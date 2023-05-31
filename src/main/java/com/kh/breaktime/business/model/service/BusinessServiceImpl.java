package com.kh.breaktime.business.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.business.model.dao.BusinessDao;
import com.kh.breaktime.business.model.vo.Business;
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
	public List<Room> getRoomsByBuId(String buId) {
		return businessDao.getRoomsByBuId(buId);
	}

	@Override
	public RoomImg getRoomImagesByBuId(int roomNo) {
		return businessDao.getRoomImagesByBuId(roomNo);
	}

	@Override
	public List<Booking> getAllBookings() {
		return businessDao.getAllBookings();
	}
}

