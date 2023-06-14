package com.kh.breaktime.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.business.model.dao.BusinessDao;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.review.model.vo.Review;
import com.kh.breaktime.room.model.vo.Room;
import com.kh.breaktime.room.model.vo.RoomImg;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired // bean으로 등록된 객체중 같은 타입이 있을 경우 의존성(객체)를 주입해줌(DI)
	private BusinessDao businessDao;

	@Override
	public Business loginBusiness(Business inputBusiness) {

		Business loginUser = businessDao.loginBusiness(inputBusiness);

		return loginUser;
	}

	@Override
	public int insertBusiness(Business inputBusiness) {

		int result = businessDao.insertBusiness(inputBusiness);

		return result;
	}

	@Override
	public List<Room> getRoomsByBuId(int buNo) {
		return businessDao.getRoomsByBuId(buNo);
	}

	@Override
	public RoomImg getRoomImagesByBuId(int roomNo) {
		return businessDao.getRoomImagesByBuId(roomNo);
	}

	@Override
	public List<Booking> getBookingsByBusinessId(int buNo) {
		return businessDao.getBookingsByBusinessId(buNo);
	}

	@Override
	public List<Review> getReviewsForBusiness(int buNo) {
		return businessDao.getReviewsForBusiness(buNo);
	}
	
	@Override
	public List<Review> updateReviewContentReply(Review review) {
		// DAO를 통해 데이터베이스 업데이트
		return businessDao.updateReviewContentReply(review);
	}
	@Override
	 public int updateReviewDeclaration(int reviewNo) {
		return businessDao.updateReviewDeclaration(reviewNo);
	    }
}
