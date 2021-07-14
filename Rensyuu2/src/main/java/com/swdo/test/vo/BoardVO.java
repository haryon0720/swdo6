package com.swdo.test.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int board_no;
	private String board_title;
	private String user_id;
	private String board_type;
	private String board_content;
	private String board_indate;
}
