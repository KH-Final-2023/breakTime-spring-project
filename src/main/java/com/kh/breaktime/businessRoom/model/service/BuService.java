package com.kh.breaktime.businessRoom.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.breaktime.businessRoom.model.vo.BusinessRoom;

public interface BuService {
	
	public int insertBuRoom(BusinessRoom buRoom, List<MultipartFile> upfiles) throws Exception;
	
	
}
