package com.swdo.test.vo;

import lombok.Data;

@Data
public class RequestVO {

	private int request_no;			//글번호
	private String request_title;		//글제목
	private String user_id;				//작성자
	private String request_content;	//글내용
	private String request_indate;		//작성일
	private int request_hits;
}
