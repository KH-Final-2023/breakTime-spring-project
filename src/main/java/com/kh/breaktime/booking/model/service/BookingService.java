package com.kh.breaktime.booking.model.service;

import java.util.ArrayList;

import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.review.model.vo.Review;
import com.kh.breaktime.room.model.vo.Room;

public interface BookingService {
   
   ArrayList<Booking> selectBookingList(int userNo);
   
   public int insertReview(Review r);
   
   
}