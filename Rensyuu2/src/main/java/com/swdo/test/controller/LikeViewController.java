package com.swdo.test.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.LikeService;
import com.swdo.test.service.UserService;
import com.swdo.test.vo.LikeVO;
import com.swdo.test.vo.UserVO;

@Controller
public class LikeViewController {

	private static final Logger logger = LoggerFactory.getLogger(LikeViewController.class);
	
	@Autowired
	private LikeService service;
	
	@Autowired
	private UserService service2;
	
	@RequestMapping(value = "/like/likeUpdate", method = RequestMethod.GET)
	public String likeUpdate(Model model,int board_no,String user_id) {
		UserVO vo = service2.userSelectOne(user_id);
		model.addAttribute("userDetail", vo);
		ArrayList<LikeVO> list =  service.likeUpdate(board_no,user_id); 
		logger.info("좋아요 성공: {}");
		model.addAttribute("likeList",list);
		return "/user/detail"; 
	 }
	 


	
	
}
