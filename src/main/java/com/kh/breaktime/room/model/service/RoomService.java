package com.kh.breaktime.room.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.breaktime.room.model.vo.Room;
import com.kh.breaktime.room.model.vo.RoomImg;

public interface RoomService {

	public int insertBuRoom(Room buRoom, List<MultipartFile> upfiles) throws Exception;

	public int updateRoom(Room room);

	public int updateRoomImg(List<RoomImg> roomImgList);

	public List<Room> getRoomsByBuId(int roomNo); 

	public RoomImg getRoomImagesByBuId(int roomNo);
	
}
