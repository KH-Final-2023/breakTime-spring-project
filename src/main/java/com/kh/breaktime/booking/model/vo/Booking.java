package com.kh.breaktime.booking.model.vo;

import lombok.Data;

@Data
public class Booking {

	 	private String bookNo;
	    private int userNo;
	    private int roomNo;
	    private int roomHCount;
	    private String reservationNo;
	    private String roomName;
	    private String roomCheckin;
	    private String roomCheckout;
	    private String status;
}
