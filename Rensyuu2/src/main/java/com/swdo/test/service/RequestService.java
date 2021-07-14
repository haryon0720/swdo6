package com.swdo.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.swdo.test.dao.RequestDAO;

import com.swdo.test.vo.RequestVO;
import com.swdo.test.vo.UserVO;

@Service
public class RequestService {

	@Autowired
	private RequestDAO dao;
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(RequestService.class);
	
	
	
		public void requestInsert(RequestVO request) {
			UserVO user =(UserVO) session.getAttribute("loginVO"); 
			request.setUser_id(user.getUser_id());
		
			int cnt = dao.requestInsert(request);
		
			if(cnt ==0) {
				logger.info("글 등록 실패 : {}", request);
			}else {
				logger.info("글 등록 성공 : {}", request);
			}
		}
	
		public ArrayList<RequestVO> requestSelectAll(){
			ArrayList<RequestVO> list = dao.requestSelectAll();
			logger.info("글 전체 목록 조회: {}",list);
			return list;
		}
	
		public RequestVO requestSelectOne(int request_no) {
			RequestVO request = dao.requestSelectOne(request_no);
			logger.info("특정 글 조회 : {}", request);
			return request;
		}
	
		public void requestDelete(RequestVO request) {
			//로그인한 사람이 정보를 가져와 그 아이디를 세팅
			UserVO user =(UserVO)session.getAttribute("loginVO");
			request.setUser_id(user.getUser_id());
			
			int cnt= dao.requestDelete(request);
			
			if(cnt ==0) {
				logger.info("글 삭제 실패 : {}", request);
			}else {
				logger.info("글 삭제 성공 : {}", request);
	
			}
		}
		
		public void requestUpdate(RequestVO request) {
			UserVO user =(UserVO)session.getAttribute("loginVO");
			request.setUser_id(user.getUser_id());
		
			//수정
			int cnt= dao.requestUpdate(request);
			
			if(cnt ==0) {
				logger.info("글 수정 실패 : {}", request);
			}else {
				logger.info("글 수정 성공 : {}", request);
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
