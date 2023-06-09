package com.kh.breaktime.booking.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.booking.model.vo.Booking;

@Repository
public class BookingDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Booking> selectBookingList(int userNo) {
		
		return (ArrayList)sqlSession.selectList("bookingMapper.selectBookingList", userNo);
	}

}
