package com.kh.breaktime.room.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.room.model.vo.Room;
import com.kh.breaktime.room.model.vo.RoomImg;

@Repository
public class RoomDao {
	
	@Autowired 
	SqlSessionTemplate sqlSession;
	
	    
	    public int insertBuRoom(Room buRoom) {
	        return sqlSession.insert("buRoom-mapper.insertBuRoom", buRoom);
	    }
	    
	    
	    public int insertRoomImgList(List<RoomImg> roomImgList) {
	        return sqlSession.insert("buRoom-mapper.insertRoomImgList", roomImgList.get(0));
	    }
	    
		/*
		 * public List<BusinessRoom> getRoomsByBuId(String buId) { return
		 * sqlSession.selectList("buRoom-mapperr.getRoomsByBuId", buId); }
		 * 
		 * public List<BusinessRoomImg> getRoomImagesByBuId(String buId) { return
		 * sqlSession.selectList("buRoom-mapper.getRoomImagesByBuId", buId); }
		 */
}

