package com.kh.breaktime.decide.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Decide {
	
	private String mainImg;
	private String roomImg;
    private int roomNo;
    private int roomHCount;
    private String roomPrice;
    private String roomInfo;
    private String roomName;
    private int buNo;
    private String buAddress;
    private int areaNo;
    private String buCategory;
    private String buTitle;
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
