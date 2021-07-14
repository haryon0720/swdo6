package com.swdo.test.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.swdo.test.vo.RequestVO;

@Repository
public class RequestDAO {
	
	@Autowired
	private SqlSession session;
	
	public int requestInsert(RequestVO request) {
		int cnt=0;
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			cnt= mapper.requestInsert(request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public ArrayList<RequestVO> requestSelectAll(){
		ArrayList<RequestVO> list =null;
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			list = mapper.requestSelectAll(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public RequestVO requestSelectOne(int request_no){
		RequestVO request = null;
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			mapper.requestUpdateHits(request_no);
			request = mapper.requestSelectOne(request_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return request;
	}
	
	public int requestDelete(RequestVO request) {
		int cnt=0;
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			cnt=mapper.requestDelete(request);
		} catch (Exception e) {
		e.printStackTrace();
		}
		return cnt;
	}
	
	public int requestUpdate(RequestVO request) {
		int cnt=0;
		try {
			RequestMapper mapper = session.getMapper(RequestMapper.class);
			cnt=mapper.requestUpdate(request);
		} catch (Exception e) {
		e.printStackTrace();
		}
		return cnt;
	}
	
	
	
	
	
	
	
	
	
	
}
