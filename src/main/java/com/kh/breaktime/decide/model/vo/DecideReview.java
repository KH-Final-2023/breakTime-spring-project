package com.kh.breaktime.decide.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class DecideReview {

	private int reviewNo;
	private int reviewWriter;
	private int usingRoom;
	private String bookNo;
	private int starScore;
	private String reviewCount;
	private String reviewContent;
	private String reviewAvailable;
	private Date createDate;
	private String reviewDeclariation;
	private String reviewContentReply;
	private String userName;
}
