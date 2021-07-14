package com.swdo.test.dao;

import java.util.ArrayList;

import com.swdo.test.vo.BoardVO;

public interface BoardMapper {
	public int boardInsert(BoardVO board);
	
	public ArrayList<BoardVO> boardSelectAll(String searchText);

	public BoardVO boardSelectOne(int board_no);

	public int boardDelete(BoardVO board);
	
	public int boardUpdate(BoardVO board);

}
