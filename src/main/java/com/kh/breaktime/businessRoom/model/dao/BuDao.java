package com.kh.breaktime.businessRoom.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.businessRoom.model.vo.BusinessRoom;
import com.kh.breaktime.businessRoom.model.vo.BusinessRoomImg;

@Repository
public class BuDao {
	
	@Autowired 
	SqlSessionTemplate sqlSession;
	
	    
	    public int insertBuRoom(BusinessRoom buRoom) {
	        return sqlSession.insert("buRoom-mapper.insertBuRoom", buRoom);
	    }
	    
	    
	    public int insertRoomImgList(List<BusinessRoomImg> roomImgList) {
	        return sqlSession.insert("buRoom-mapper.insertRoomImgList", roomImgList.get(0));
	    }
}

