package com.kh.breaktime.room.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

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
	    

	    public int updateRoom(Room room ) {
	        return sqlSession.update("buRoom-mapper.updateRoom", room);
	    }
	    
	    public int updateRoomImg(RoomImg roomImg) {
	        return sqlSession.update("buRoom-mapper.updateRoomImg", roomImg);
	    }
}

