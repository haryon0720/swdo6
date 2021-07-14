package com.swdo.test.service;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swdo.test.dao.LikeDAO;
import com.swdo.test.dao.UserDAO;
import com.swdo.test.vo.UserVO;

@Service
public class UserService {
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private HttpSession session;
	
	
	public String userInsert(UserVO user) {
		
		int cnt = dao.userInsert(user);
		String path = "";
		if(cnt == 0 ) {
			System.out.println("회원 가입 실패"); 
			path = "redirect:/user/joinForm";
		}else {
			System.out.println("회원 가입 성공");
			path = "redirect:/";
		}
		
		return path;
	}

	public String userLogin(UserVO user) {
		UserVO result = dao.userLogin(user);
		String path ="";
		
		if(result == null) {
			System.out.println("ID가 없다.");
			path = "redirect:/user/loginForm";
		}else {
			System.out.println("ID가 있다.");
			if(user.getUser_pw().equals(result.getUser_pw())) { 
				System.out.println("로그인 정보가 올바르다.");
				
				session.setAttribute("loginVO", result);
				path = "redirect:/";
			}else {
				System.out.println("비밀번호가 틀림");
				path = "redirect:/user/loginForm";
			}
		}
		return path;
	}

	public void logout() {
		session.removeAttribute("loginVO");
	}
	
	public UserVO userSelectOne(String user_id) {
		UserVO vo = dao.userSelectOne(user_id);
		return vo;
	}

	
	public String userUpdate(UserVO user) {
		int cnt = dao.userUpdate(user);
		String path = "";
		
		if(cnt == 0) {
			System.out.println("회원 정보 수정 실패");
			path = "redirect:/user/updateForm?user_id="+user.getUser_id();
			
		}else {
			System.out.println("회원 정보 수정 성공");
			path = "redirect:/user/detail?user_id="+user.getUser_id();
		}
		return path;
	}
	

	
	
}