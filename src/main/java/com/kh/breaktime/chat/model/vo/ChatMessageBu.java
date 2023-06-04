package com.kh.breaktime.chat.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatMessageBu {
	private int cmNo;
	private String message;
	private Date createDate;
	private int buNo;
	private String buTitle;
}
