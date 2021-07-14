package com.swdo.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession session;
	
	public int boardInsert(BoardVO board) {
		int cnt = 0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			cnt = mapper.boardInsert(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ArrayList<BoardVO> boardSelectAll(String searchText){
		ArrayList<BoardVO> list = null;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			list = mapper.boardSelectAll(searchText);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	
	public BoardVO boardSelectOne(int board_no) {
		BoardVO board = null;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			//특정 글 조회
			board = mapper.boardSelectOne(board_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public int boardDelete(BoardVO board) {
		int cnt=0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			cnt = mapper.boardDelete(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int boardUpdate(BoardVO board) {
		int cnt=0;
		try {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			cnt = mapper.boardUpdate(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
}
