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

	public List<Room> getRoomsByBuId(int buNo) {
		return sqlSession.selectList("businessMapper.getRoomsByBuId", buNo);
	}

	public RoomImg getRoomImagesByBuId(int roomNo) {
		return sqlSession.selectOne("businessMapper.getRoomImagesByBuId", roomNo);
	}

	public List<Booking> getBookingsByBusinessId(int buNo) {
		return sqlSession.selectList("businessMapper.selectBookingsByBusinessId", buNo);
	}

	public List<Review> getReviewsForBusiness(int buNo) {
		return sqlSession.selectList("businessMapper.getReviewsForBusiness", buNo);
	}

	public List<Review> updateReviewContentReply(Review review) {
	    return sqlSession.selectOne("businessMapper.updateReviewContentReply", review);
	}
	

	public int updateReviewDeclaration(int review) {
	    return sqlSession.update("businessMapper.updateReviewDeclaration", review);
	}

}
