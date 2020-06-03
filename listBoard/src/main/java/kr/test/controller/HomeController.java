package kr.test.controller;

import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.test.dao.BoardDAO;
import kr.test.vo.BoardVO;

@Controller
public class HomeController {
	
	@Autowired
	public SqlSession sqlSession;
	
//	처음 메인페이지
	@RequestMapping(value = "/")
	public String home() {
		System.out.println("컨트롤러에서 /에 들어옴.");
		
		return "redirect:list";
	}
	
//	글쓰기 페이지로 가는 컨트롤러
	@RequestMapping(value = "insert")
	public String insert() {
		System.out.println("컨트롤러에서 insert에 들어옴.");
		
		return "insert";
	}
	
//	글쓰기 완료
	@RequestMapping(value = "insertOK")
	public String insertOK(HttpServletRequest req, Model model, BoardVO boardVO) {
		System.out.println("컨트롤러에서 insertOK에 들어옴.");
		
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		mapper.insert(boardVO);
		
		return "list";
	}
	
//	list페이지
	@RequestMapping(value = "list")
	public String list(Model model) {
		System.out.println("컨트롤러에서 list에 들어옴.");
		
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		int totalCount = mapper.totalCount();
		
		ArrayList<BoardVO> boardVOs = mapper.select();
		
		System.out.println("boardVO의 값은 : " + boardVOs.toString());
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("boardVO", boardVOs);
		
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
		
		return "redirect:list";
	}
	
//	글 삭제
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest req) {
		System.out.println("컨트롤러에서 delete에 들어옴");
		
		int idx = Integer.parseInt(req.getParameter("idx"));
		BoardDAO mapper = sqlSession.getMapper(BoardDAO.class);
		mapper.delete(idx);
		
		return "redirect:list";
	}
	
}
