package com.swdo.test.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.swdo.test.vo.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession session;
	
	public int userInsert(UserVO user) {
		int cnt = 0;
		try {
			//Mapper Interface의 객체를 생성해서 메소드를 호출한다.
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.userInsert(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return cnt;
	}

	public UserVO userLogin(UserVO user) {
		UserVO result = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.userLogin(user); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int userUpdate(UserVO user) {
		int cnt = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			cnt = mapper.userUpdate(user);
		}catch(Exception e){
			e.printStackTrace();
		}
		return cnt;
	}

	public UserVO userSelectOne(String user_id) {
		UserVO vo = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
					vo = mapper.userSelectOne(user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
}
