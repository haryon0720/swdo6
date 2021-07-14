package com.swdo.test.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.LikeDAO;
import com.swdo.test.vo.LikeVO;

@Service
public class LikeService {

	@Autowired
	private LikeDAO dao;
	
	
	private static final Logger logger = LoggerFactory.getLogger(LikeService.class);
	
	public LikeVO likeSelect(int board_no, String user_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", board_no);
		map.put("user_id", user_id);
		
		LikeVO like = dao.likeSelect(map);
		
		return like;
	}
	
	public ArrayList<LikeVO> likeUpdate(int board_no, String user_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", board_no);
		map.put("user_id", user_id);
		
		int cnt1 = dao.likeInsert(map);
		logger.info("로거 새거1:{}",map);
		LikeVO like = dao.likeSelect(map);
		logger.info("로거 새거2:{}",map);
		map.put("like_check", like.getLike_check());
		int cnt = dao.likeUpdate(map);
		
		ArrayList<LikeVO> list = dao.likeSelectAll(user_id);
		
		
		logger.info("로거 새거3:{}",map);
		if(cnt1==0) {
			logger.info("테이블 실패: {}",map);
		}else {
			logger.info("테이블 성공: {}",map);
		}
		if(cnt==0) {
			logger.info("업데이트 실패 : {}",map);
		}else {
			logger.info("업데이트 성공 : {}",map);
		}
		
		return list;
	}
	
	public ArrayList<LikeVO> likeSelectAll(String user_id){
		ArrayList<LikeVO> list = dao.likeSelectAll(user_id);		
		return list;
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
