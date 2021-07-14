package com.swdo.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.BoardDAO;
import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.LikeVO;
import com.swdo.test.vo.UserVO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO dao;
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	public void boardInsert(BoardVO board) {
		UserVO user = (UserVO)session.getAttribute("loginVO");
		board.setUser_id(user.getUser_id());	
		
		int cnt = dao.boardInsert(board);
		
		if(cnt==0) {
			logger.info("글 등록 실패 : {}",board);
		}else {
			logger.info("글 등록 성공 : {}",board);
		}
	}
	
	public ArrayList<BoardVO> boardSelectAll(String searchText){
		ArrayList<BoardVO> list = dao.boardSelectAll(searchText);
		logger.info("글 전체 목록 조회 : {}",list);
		return list;
	}

	public BoardVO boardSelectOne(int board_no) {
		BoardVO board = dao.boardSelectOne(board_no);
		logger.info("특정 글 조회 : {}",board);
		return board;
	}
	
	public void boardDelete(BoardVO board) {
		//로그인한 사람의 정보를 가져와서 그 아이디를 setting 해준다.
		UserVO user = (UserVO)session.getAttribute("loginVO");
		board.setUser_id(user.getUser_id());
		
		int cnt = dao.boardDelete(board);
		
		if(cnt==0) {
			logger.info("글 삭제 실패 : {}",board);
		}else {
			logger.info("글 삭제 성공 : {}",board);
		}
	}
	
	public void boardUpdate(BoardVO board) {
		//로그인한 사람의 정보를 가져와서 그 아이디를 setting 해준다.
		UserVO user = (UserVO)session.getAttribute("loginVO");
		board.setUser_id(user.getUser_id());
						
		int cnt = dao.boardUpdate(board);
						
		if(cnt==0) {
			logger.info("글 삭제 실패 : {}",board);
		}else {
			logger.info("글 삭제 성공 : {}",board);
		}
	}
	
	

	
	
}
