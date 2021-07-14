package com.swdo.test.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.swdo.test.service.BoardService;
import com.swdo.test.service.LikeService;
import com.swdo.test.vo.BoardVO;
import com.swdo.test.vo.LikeVO;


@Controller
public class BoardViewController {

	private static final Logger logger = LoggerFactory.getLogger(BoardViewController.class);
	
	@Autowired
	private BoardService service;	
	
	@Autowired
	private LikeService service2;
	
	@RequestMapping(value="/board/detail1", method= RequestMethod.GET)
	public String detail1(int board_no, String user_id, Model model) {
		BoardVO board = service.boardSelectOne(board_no);
		model.addAttribute("detail", board);
		LikeVO like = service2.likeSelect(board_no, user_id);
		logger.info("좋아요 성공: {}");
		model.addAttribute("like",like);
		return "board/detail1";
	}
	@RequestMapping(value="/board/detail2", method= RequestMethod.GET)
	public String detail2(int board_no, String user_id, Model model) {
		BoardVO board = service.boardSelectOne(board_no);
		model.addAttribute("detail", board);
		LikeVO like = service2.likeSelect(board_no, user_id);
		logger.info("좋아요 성공: {}");
		model.addAttribute("like",like);
		return "board/detail2";
	}
	@RequestMapping(value="/board/detail3", method= RequestMethod.GET)
	public String detail3(int board_no, String user_id,Model model) {
		BoardVO board = service.boardSelectOne(board_no);
		model.addAttribute("detail", board);
		LikeVO like = service2.likeSelect(board_no, user_id);
		logger.info("좋아요 성공: {}");
		model.addAttribute("like",like);
		return "board/detail3";
	}
	@RequestMapping(value="/board/detail4", method= RequestMethod.GET)
	public String detail4(int board_no, String user_id, Model model) {
		BoardVO board = service.boardSelectOne(board_no);
		model.addAttribute("detail", board);
		LikeVO like = service2.likeSelect(board_no,user_id);
		logger.info("좋아요 성공: {}");
		model.addAttribute("like",like);
		return "board/detail4";
	}

	@RequestMapping(value="/board/detail5", method= RequestMethod.GET)
	public String detail5(int board_no, String user_id, Model model) {
		BoardVO board = service.boardSelectOne(board_no);
		model.addAttribute("detail", board);
		LikeVO like = service2.likeSelect(board_no,user_id);
		logger.info("좋아요 성공: {}");
		model.addAttribute("like",like);
		return "board/detail5";
	}
	@RequestMapping(value="/board/detail6", method= RequestMethod.GET)
	public String detail6(int board_no, String user_id,Model model) {
		BoardVO board = service.boardSelectOne(board_no);
		model.addAttribute("detail", board);
		LikeVO like = service2.likeSelect(board_no,user_id);
		logger.info("좋아요 성공: {}");
		model.addAttribute("like",like);
		return "board/detail6";
	}
	@RequestMapping(value="/board/detail7", method= RequestMethod.GET)
	public String detail7(int board_no, String user_id, Model model) {
		BoardVO board = service.boardSelectOne(board_no);
		model.addAttribute("detail", board);
		LikeVO like = service2.likeSelect(board_no,user_id);
		logger.info("좋아요 성공: {}");
		model.addAttribute("like",like);
		return "board/detail7";
	}

	@RequestMapping(value="/board/searchForm", method= RequestMethod.GET)
	public String searchForm() {
		return "board/searchForm";
	}

	@RequestMapping(value="/board/writeForm", method= RequestMethod.GET)
	public String writeForm() {
		return "board/writeForm";
	}
	
	@RequestMapping(value="/board/write" , method = RequestMethod.POST)
	public String write(BoardVO board) {
		logger.info("전달된 글 등록 데이터 : {}",board);
		service.boardInsert(board);
		return "redirect:/";		
	}
	
	@RequestMapping(value="/board/delete" , method=RequestMethod.GET)
	public String delete(BoardVO board) {
		logger.info("특정 글 삭제 기능: {}", board);
		service.boardDelete(board);
		return "redirect:/";
	}
	
	@RequestMapping(value="/board/updateForm", method=RequestMethod.GET)
	public String updateForm(int board_no,Model model) {
		logger.info("특정 글 수정폼 이동 : {}",board_no);
		BoardVO board = service.boardSelectOne(board_no);
		model.addAttribute("detail",board);
		return "board/updateForm";
	}
	
	@RequestMapping(value="/board/update" , method=RequestMethod.POST)
	public String update(BoardVO board) {
		logger.info("특정 글 수정 기능 : {}",board);
		service.boardUpdate(board);
		return "redirect:/";
	}
	
	
	
	
}
