package com.swdo.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.LikeVO;

@Repository
public class LikeDAO {

	@Autowired
	private SqlSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(LikeDAO.class);
	

	
	public int likeInsert(HashMap<String, Object> map) {
		int cnt = 0;
		try {
			LikeMapper mapper = session.getMapper(LikeMapper.class);
			cnt = mapper.likeInsert(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("Insert 다오: {}",map);
		return cnt;
	}
	
	public LikeVO likeSelect(HashMap<String, Object> map) {
		LikeVO like = null;
		try {
			LikeMapper mapper = session.getMapper(LikeMapper.class);
			like = mapper.likeSelect(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("Select 다오: {}",map);
		return like;
	}	
	
	public ArrayList<LikeVO> likeSelectAll(String user_id){
		ArrayList<LikeVO> list = null;
		try {
			LikeMapper mapper = session.getMapper(LikeMapper.class);
			list = mapper.likeSelectAll(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int likeUpdate(HashMap<String, Object> map) {
		int cnt = 0;
		try {
			LikeMapper mapper = session.getMapper(LikeMapper.class);
			cnt = mapper.likeUpdate(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("업데이트 다오: {}",map);
		return cnt;		
	}
	

		
}
