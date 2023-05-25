package com.kh.breaktime.businessRoom.model.vo;

import java.util.List;

import lombok.Data;
@Data
public class BusinessRoom {
	private int roomNo;
	private String buId;
	private int roomImgNo;
	private String roomCount;
	private String roomName;
	private String roomPrice;
	private String roomCheckin;
	private String roomCheckout;
	private String roomInfo;
	private List<String> roomImg;
}
