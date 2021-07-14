package com.swdo.test.controller;


import java.util.ArrayList;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.swdo.test.service.RequestService;

import com.swdo.test.vo.RequestVO;


@Controller
public class RequestViewController {
	
	@Autowired
	private RequestService service;
	
	private static final Logger logger = LoggerFactory.getLogger(RequestViewController.class);


	@RequestMapping(value="/request/listForm", method=RequestMethod.GET) 
	public String listForm(Model model) {
		logger.info("글 목록 페이지 이동");
		ArrayList<RequestVO> list = service.requestSelectAll();
		model.addAttribute("requestList", list);
		return "request/listForm";
	}
	
	
	@RequestMapping(value="/request/writeForm", method=RequestMethod.GET)
	public String writeForm() {
		logger.info("글 등록 페이지 이동");
		return "request/writeForm";
	}
	
	@RequestMapping(value="/request/write", method=RequestMethod.POST)
	public String write(RequestVO request) { 
		logger.info("전달된 글 등록 데이터{}",request); 
		
		service.requestInsert(request);
		return "redirect:/request/listForm"; 
	}
	
	@RequestMapping(value="/request/detail", method=RequestMethod.GET)
	public String detail(int request_no, Model model) {
		logger.info("전달받은 글번호:{}", request_no);
		
		RequestVO request = service.requestSelectOne(request_no);
		
		model.addAttribute("detail", request);
		
		return"request/detail";
	}
	
	@RequestMapping(value="/request/delete", method=RequestMethod.GET)
	public String delete(RequestVO request) {
		logger.info("특정 글 삭제 : {}", request);
		service.requestDelete(request);
		return "redirect:/request/listForm";
		
	}
	
	@RequestMapping(value="/request/updateForm", method=RequestMethod.GET)
	public String updateForm(int request_no, Model model) {
		logger.info("특정 글 수정폼 이동 : {}", request_no);
		RequestVO request = service.requestSelectOne(request_no);
		model.addAttribute("detail", request);
		return "request/updateForm";
	}
	
	@RequestMapping(value = "/request/update", method = RequestMethod.POST)
	public String update( RequestVO request) {
		logger.info("특정 글 수정 기능 : {}",request);
		service.requestUpdate(request);
		return "redirect:/request/listForm";
	}
	
	
	
	
}
