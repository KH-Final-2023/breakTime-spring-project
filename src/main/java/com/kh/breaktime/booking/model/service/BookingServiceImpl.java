package com.kh.breaktime.booking.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.booking.model.dao.BookingDao;
import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.review.model.vo.Review;

@Service
public class BookingServiceImpl implements BookingService{
   
   @Autowired
   private BookingDao bookingDao;
   
   
   @Override
   public ArrayList<Booking> selectBookingList(int userNo) {
      return bookingDao.selectBookingList(userNo);
   }
   
   @Override
   public int insertReview(Review r) {
      
      return bookingDao.insertReview(r);
   }
   
   @Override
   public int insertBooking(Booking b) {
      
      return bookingDao.insertBooking(b);
   }

}