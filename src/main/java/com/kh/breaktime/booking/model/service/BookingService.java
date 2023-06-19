package com.kh.breaktime.booking.model.service;

import java.util.ArrayList;

import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.review.model.vo.Review;

public interface BookingService {

	
	ArrayList<Booking> selectBookingList(int userNo);
	
	ArrayList<Review> selectReviewList(int userNo);
	
	public int insertReview(Review r);
	
	// 예약 등록
	public int insertBooking(Booking b);
	
	// 예약 등록시 카트 삭제
	public int deleteCartList(Booking booking);
}

