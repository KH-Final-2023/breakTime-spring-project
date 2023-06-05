package com.kh.breaktime.room.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.breaktime.room.model.vo.Room;
import com.kh.breaktime.room.model.vo.RoomImg;

public interface RoomService {
	
	public int insertBuRoom(Room buRoom, List<MultipartFile> upfiles) throws Exception;
	
	public void updateRoom(Room room );
	
	public void updateRoomImg(RoomImg roomImg );
}
