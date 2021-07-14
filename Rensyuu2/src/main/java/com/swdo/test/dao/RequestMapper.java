package com.swdo.test.dao;

import java.util.ArrayList;


import com.swdo.test.vo.RequestVO;

public interface RequestMapper {

	public int requestInsert(RequestVO request);
	
	public ArrayList<RequestVO> requestSelectAll();
	
	public RequestVO requestSelectOne(int request_no);
	
	public void requestUpdateHits(int request_no);
	
	public int requestDelete(RequestVO request);
	
	public int requestUpdate(RequestVO request);

	
	
	
	
	
	
}
