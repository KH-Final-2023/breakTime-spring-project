package com.kh.breaktime.room.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	        int result =  sqlSession.insert("buRoom-mapper.insertBuRoom", buRoom);
	        int roomNo = 0;
			if(result > 0) {
				roomNo = buRoom.getRoomNo();
				// 객실등록 성공시 selectKey태그를 이용해서 세팅한 roomNo값을 buRoom객체안에 담아서 반환시켜줌.
			}
			return roomNo;
			
	    }
	    
	    
	    public int insertRoomImgList(List<RoomImg> roomImgList) {
	        return sqlSession.insert("buRoom-mapper.insertRoomImgList", roomImgList.get(0));
	    }
	    

	    public int updateRoom(int roomNo, Room room) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("roomNo", roomNo);
	        params.put("room", room);
	        System.out.println("roomImgList: " + roomNo);
	        System.out.println("roomImgList: " + room);
	        return sqlSession.update("buRoom-mapper.updateRoom", params);
	    }

	    public int updateRoomImg(int roomNo, List<RoomImg> roomImgList) {
	        Map<String, Object> params = new HashMap<>();
	        params.put("roomNo", roomNo);
	        params.put("roomImgList", roomImgList);
	        System.out.println("roomImgList: " + roomNo);
	        System.out.println("roomImgList: " + roomImgList);
	        return sqlSession.update("buRoom-mapper.updateRoomImg", params);
	      
	    }


	
}

