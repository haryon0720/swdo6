package com.swdo.test.dao;



import com.swdo.test.vo.UserVO;

public interface UserMapper {

	
	public int userInsert(UserVO user);
	
	public UserVO userLogin(UserVO user);
	
	public int userUpdate(UserVO user);

	public UserVO userSelectOne(String user_id);
	
}
