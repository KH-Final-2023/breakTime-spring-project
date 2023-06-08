package com.kh.breaktime.decide.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Decide {

	private int buNo;
	
	//main 
	private String buTitle;
	private String buAddress;
	private String mainImg;
	private String filePath;
    private String saveName;
	private double starScore;
    
	// review
	private int reviewNo;
	private int reviewWriter;
	private int usingRoom;
	private String bookNo;
	private String reviewContent;
	private String reviewAvailable;
	private String createDate;
	private String reviewContentReply;
	private String userName;
	
	// room
	private int areaNo;
	private String buCategory;
	private String roomImg;
    private int roomNo;
    private int roomHCount;
    private String roomPrice;
    private String roomInfo;
    private String roomName;
    
    private	int fileLevel;
    private int userNo;
}
