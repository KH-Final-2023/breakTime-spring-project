package com.kh.breaktime.room.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.common.model.vo.PageInfo;
import com.kh.breaktime.room.model.vo.Room;
import com.kh.breaktime.room.model.vo.RoomImg;

@Repository
public class RoomDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertBuRoom(Room buRoom) {
		int result = sqlSession.insert("buRoom-mapper.insertBuRoom", buRoom);
		int roomNo = 0;
		if (result > 0) {
			roomNo = buRoom.getRoomNo();
			// 객실등록 성공시 selectKey태그를 이용해서 세팅한 roomNo값을 buRoom객체안에 담아서 반환시켜줌.
		}
		return roomNo;

	}

	public int insertRoomImgList(List<RoomImg> roomImgList) {
		return sqlSession.insert("buRoom-mapper.insertRoomImgList", roomImgList.get(0));
	}

	/*
	 * public int updateRoom(Room room) {
	 * 
	 * return sqlSession.insert("buRoom-mapper.updateRoom", room);
	 * 
	 * int roomNo = 0; if(result > 0) { roomNo = room.getRoomNo(); // 객실등록 성공시
	 * selectKey태그를 이용해서 세팅한 roomNo값을 buRoom객체안에 담아서 반환시켜줌. } return roomNo;
	 * 
	 * 
	 * }
	 * 
	 * public int updateRoomImg( List<RoomImg> roomImgList) { return
	 * sqlSession.update("buRoom-mapper.updateRoomImg", roomImgList);
	 * 
	 * }
	 */
	public int updateRoom(Room room) {
		return sqlSession.update("buRoom-mapper.updateRoom", room);
	}

	public int updateRoomImg(List<RoomImg> roomImgList) {
		return sqlSession.update("buRoom-mapper.updateRoomImg", roomImgList);
	}
	
	public List<Room> getRoomsByBuId(int roomNo) {
		return sqlSession.selectList("buRoom-mapper.getRoomsByBuId", roomNo);
	}

	public RoomImg getRoomImagesByBuId(int roomNo) {
		return sqlSession.selectOne("buRoom-mapper.getRoomImagesByBuId", roomNo);
	}
	
	public List<Room> standardRoom(int buNo) {
		return sqlSession.selectList("buRoom-mapper.standardRoom", buNo);
	}

	public RoomImg standardRoomImg(int roomNo) {
		return sqlSession.selectOne("buRoom-mapper.standardRoomImg", roomNo);
	}
}
