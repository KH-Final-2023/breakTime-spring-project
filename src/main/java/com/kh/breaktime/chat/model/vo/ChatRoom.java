package com.kh.breaktime.chat.model.vo;

import lombok.Data;

@Data
public class ChatRoom {
	private int buNo;
	private String title;
	private String status;
	private int userNo;
	
	private String userId;
	private int cnt;
}
