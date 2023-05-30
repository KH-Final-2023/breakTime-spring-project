package com.kh.breaktime.room.model.vo;

import java.util.List;

import lombok.Data;
@Data
public class Room {
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
