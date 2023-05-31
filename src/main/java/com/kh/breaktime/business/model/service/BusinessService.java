package com.kh.breaktime.business.model.service;

import java.util.List;

import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.review.model.vo.Review;
import com.kh.breaktime.room.model.vo.Room;
import com.kh.breaktime.room.model.vo.RoomImg;


public interface BusinessService {



	
	public abstract Business loginBusiness(Business inputBusiness);
		
	public abstract int insertBusiness(Business inputBusiness);

	
	public List<Room> getRoomsByBuId(String buId);
	 
	public RoomImg getRoomImagesByBuId(int roomNo);
	
	public List<Booking> getAllBookings();
	    
	public List<Review> getReviewsForBusiness(String businessId , Review businessReviews);
}

