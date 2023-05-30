package com.kh.breaktime.room.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.breaktime.room.model.vo.Room;

public interface RoomService {
	
	public int insertBuRoom(Room buRoom, List<MultipartFile> upfiles) throws Exception;
	
	
	    // ... 다른 메서드들 ...

	    // 사업자의 방 정보 가져오기
		/*
		 * public List<BusinessRoom> getRoomsByBuId(String buId);
		 * 
		 * // 사업자의 방 이미지 정보 가져오기 public List<BusinessRoomImg> getRoomImagesByBuId(String
		 * buId);
		 */
}
