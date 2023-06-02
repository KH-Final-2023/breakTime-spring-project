package com.kh.breaktime.business.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.review.model.vo.Review;
import com.kh.breaktime.room.model.vo.Room;
import com.kh.breaktime.room.model.vo.RoomImg;

@Repository
public class BusinessDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Business loginBusiness(Business inputBusiness) {

		return sqlSession.selectOne("businessMapper.loginBusiness", inputBusiness);
	}

	public int insertBusiness(Business inputBusiness) {

		return sqlSession.insert("businessMapper.insertBusiness", inputBusiness);
	}

	public List<Room> getRoomsByBuId(String buId) {
		return sqlSession.selectList("businessMapper.getRoomsByBuId", buId);
	}

	public RoomImg getRoomImagesByBuId(int roomNo) {
		return sqlSession.selectOne("businessMapper.getRoomImagesByBuId", roomNo);
	}

	public List<Booking> getBookingsByBusinessId(String businessId) {
		return sqlSession.selectList("businessMapper.selectBookingsByBusinessId", businessId);
	}

	public List<Review> getReviewsForBusiness(String businessId) {
		return sqlSession.selectList("businessMapper.getReviewsForBusiness", businessId);
	}
}
