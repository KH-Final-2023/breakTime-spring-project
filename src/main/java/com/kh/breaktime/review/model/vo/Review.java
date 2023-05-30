package com.kh.breaktime.review.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	
	private int reviewNo;
	private int userNo;
	private int starNo;
	private int starScore;
	private Date createDate;
	
	

}
