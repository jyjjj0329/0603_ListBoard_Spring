package kr.test.dao;

import java.util.ArrayList;

import kr.test.vo.BoardVO;

public interface BoardDAO {

	public void insert(BoardVO boardVO);

	public int totalCount();
	
	public ArrayList<BoardVO> select();

	public BoardVO upSelect(int idx);

	public void reqUpdate(int idx);

	public void update(BoardVO boardVO);

	public void delete(int idx);


}
