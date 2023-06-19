package com.kh.breaktime.booking.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.review.model.vo.Review;

@Repository
public class BookingDao {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Booking> selectBookingList(int userNo) {
		
		return (ArrayList)sqlSession.selectList("bookingMapper.selectBookingList", userNo);
	}
	
	public int insertReview(Review r) {
		return sqlSession.insert("bookingMapper.insertReview", r);
	}
	
	// 예약 등록
	public int insertBooking(Booking b) {
		return sqlSession.insert("bookingMapper.insertBooking", b);

	}
		
	public ArrayList<Review> selectReviewList(int userNo) {
		
		return (ArrayList)sqlSession.selectList("bookingMapper.selectReviewList", userNo);

	}
	
	// 예약 등록시 카트 삭제
	public int deleteCartList(Booking booking) {
		return sqlSession.delete("bookingMapper.deleteCartList", booking);
	}
	
}
