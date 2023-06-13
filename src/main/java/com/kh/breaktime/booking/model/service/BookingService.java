package com.kh.breaktime.booking.model.service;

import java.util.ArrayList;

import com.kh.breaktime.booking.model.vo.Booking;

public interface BookingService {
	
	ArrayList<Booking> selectBookingList(int userNo);
}
