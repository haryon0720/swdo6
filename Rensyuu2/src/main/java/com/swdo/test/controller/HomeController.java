package com.swdo.test.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.swdo.test.service.BoardService;
import com.swdo.test.service.UserService;
import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.UserVO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private BoardService service;	
	
	@Autowired
	private UserService userService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,@RequestParam(name = "searchText",defaultValue = "") String searchText,@RequestParam(name = "user_id",defaultValue = "")String user_id) {
		logger.info("홈 화면", searchText);
		logger.info("홈 화면 유저 정보", user_id);
		ArrayList<BoardVO> list = service.boardSelectAll(searchText);
		model.addAttribute("boardList", list);
		UserVO vo = userService.userSelectOne(user_id);
		model.addAttribute("userDetail", vo);		
		return "home";
	}

	@RequestMapping(value = "/board/mySearchForm", method = RequestMethod.GET)
	public String mySearchForm(Model model,@RequestParam(name = "searchText",defaultValue = "") String searchText) {
		logger.info("홈 화면", searchText);
		ArrayList<BoardVO> list = service.boardSelectAll(searchText);
		model.addAttribute("boardList", list);
		return "board/mySearchForm";
	}
	
	
}
