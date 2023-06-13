package com.kh.breaktime.room.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class Room {
	private int roomNo;
	private int buNo;
	private int roomImgNo;
	private String roomHCount;
	private String roomName;
	private String roomPrice;
	private String roomCheckin;
	private String roomCheckout;
	private String roomInfo;
	private List<String> roomImg;
}
