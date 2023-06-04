package com.kh.breaktime.decide.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Decide {
	
	private String mainImg;
	private int buNo;
	private String buTitle;
	private int starScore;
	private String reviewCount;
	private String buAddress;
	private int areaNo;
	private String buCategory;
}
