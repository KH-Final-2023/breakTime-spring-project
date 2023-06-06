package com.kh.breaktime.chat.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatMessage {
	private int cmNo;
	private String message;
	private Date createDate;
	private int buNo;
	private int userNo;
	private String userId;
	private String buTitle;
}
