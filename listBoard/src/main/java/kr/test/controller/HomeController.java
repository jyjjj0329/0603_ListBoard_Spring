package kr.test.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.test.dao.BoardDAO;
import kr.test.vo.BoardVO;
import kr.test.vo.ListVO;

@Controller
public class HomeController {
	
	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	public ListVO listVO;
	
//	처음 메인페이지
	@RequestMapping(value = "/")
	public String home() {
		System.out.println("컨트롤러에서 /에 들어옴.");
		
		return "redirect:list?page=1";
	}
	
//	글쓰기 페이지로 가는 컨트롤러
	@RequestMapping(value = "insert")
	public String insert() {
		System.out.println("컨트롤러에서 insert에 들어옴.");
		
		return "insert";
	}
	
//	글쓰기 완료
	@RequestMapping(value = "insertOK")
	public String insertOK(HttpServletRequest req, Model model, 
			BoardVO boardVO, RedirectAttributes redirect) {
		System.out.println("컨트롤러에서 insertOK에 들어옴.");
		
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		System.out.println("컨트롤러에서 boardVO의 값은 : " + boardVO);
		mapper.insert(boardVO);
		
//		redirect로 page의 파라미터값 1을 보내줌
		redirect.addAttribute("page", 1);
			
		return "redirect:list";
	}
	
//	list페이지
	@RequestMapping(value = "list")
	public String list(HttpServletRequest req, Model model) {
		System.out.println("컨트롤러에서 list에 들어옴.");
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		String category = req.getParameter("category");
		String search = req.getParameter("search");
		hmap.put("category", category);
		hmap.put("search", search);
		System.out.println("컨트롤러에서 category의 값은 : " + category);
		System.out.println("컨트롤러에서 search의 값은 : " + search);
		
//		페이징
		listVO.setTotalCount(mapper.totalCount(hmap));
		
		listVO.setCurrentPage(Integer.parseInt(req.getParameter("page")));
		listVO.initPageList(listVO.getPageSize(), listVO.getTotalCount(), listVO.getCurrentPage());
		System.out.println("컨트롤러에서 전체 페이지 수는 : " + listVO.getTotalPage());
		
		hmap.put("startNo", listVO.getStartNo());
		hmap.put("endNo", listVO.getEndNo());
		
		listVO.setBoardVO(mapper.select(hmap));
		
		System.out.println("boardVO의 값은 : " + listVO.getBoardVO());
		model.addAttribute("listVO", listVO);
		
		return "list";
	}
	
//	글수정 페이지로 이동
	@RequestMapping(value = "update")
	public String update(HttpServletRequest req, Model model, BoardVO boardVO) {
		System.out.println("update에 들어옴");
		int idx = Integer.parseInt(req.getParameter("idx"));
		
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
//		글을 클릭하였으니 조회수 1증가
		mapper.reqUpdate(idx);
		boardVO = mapper.upSelect(idx);
		
		System.out.println("컨트롤러에서 boardVO의 값은 : " + boardVO);

		model.addAttribute("boardVO", boardVO);
		return "update";
	}
	
//	글수정
	@RequestMapping(value = "updateOK")
	public String updateOK(HttpServletRequest req, Model model, BoardVO boardVO) {
		System.out.println("컨트롤러에서 updateOK에 들어옴.");
		
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		mapper.update(boardVO);
		
		return "redirect:list?page=1";
	}
	
//	글 삭제
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest req) {
		System.out.println("컨트롤러에서 delete에 들어옴");
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		mapper.delete(idx);
		
		return "redirect:list?page=1";
	}
	
}
