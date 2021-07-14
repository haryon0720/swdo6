package com.swdo.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.swdo.test.vo.LikeVO;

public interface LikeMapper {

	public int likeInsert(HashMap<String, Object> map);
	
	public LikeVO likeSelect(HashMap<String, Object> map);

	public ArrayList<LikeVO> likeSelectAll(String user_id);
	
	public int likeUpdate(HashMap<String, Object> map);
}
