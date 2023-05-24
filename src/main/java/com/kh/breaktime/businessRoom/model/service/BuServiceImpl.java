package com.kh.breaktime.businessRoom.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.kh.breaktime.businessRoom.model.dao.BuDao;
import com.kh.breaktime.businessRoom.model.vo.BusinessRoom;
import com.kh.breaktime.businessRoom.model.vo.BusinessRoomImg;


@Service
public class BuServiceImpl implements BuService {

	@Autowired
	private BuDao buDao;

	@Transactional(rollbackFor = Exception.class)
	public int insertBuRoom(BusinessRoom buRoom, List<MultipartFile> upfiles) throws Exception {
		// 1) 객실 정보 등록
		int result = buDao.insertBuRoom(buRoom);

		if (result > 0 && upfiles != null) {
			// 2) 이미지 등록
			List<BusinessRoomImg> roomImgList = new ArrayList<>();

			for (MultipartFile file : upfiles) {
				if (!file.isEmpty()) {
					String savedImagePath = saveImage(file);

					BusinessRoomImg roomImg = new BusinessRoomImg();
					roomImg.setRoomNo(buRoom.getRoomNo());
					roomImg.setOriginName(file.getOriginalFilename());
					roomImg.setSaveName(savedImagePath);
					roomImg.setFilePath("webapp/resources/images");
					roomImg.setFileLevel(0);
					roomImg.setStatus("ACTIVE");

					roomImgList.add(roomImg);
				}
			}

			if (!roomImgList.isEmpty()) {
				buDao.insertRoomImgList(roomImgList);
			}
		}
		return result;
	}

	public String saveImage(MultipartFile file) {
		String uploadPath = "webapp/resources/images"; // 이미지 저장 디렉토리 경로
		String fileName = StringUtils.cleanPath(file.getOriginalFilename()); // 파일명

		try {
			// 이미지 저장 경로
			String savePath = uploadPath + File.separator + fileName;

			// 이미지 저장
			File dest = new File(savePath);
			file.transferTo(dest);

			// 저장된 파일 경로 반환
			return savePath;
		} catch (IOException e) {
			// 저장 실패 시 예외 처리
			e.printStackTrace();
			return null;
			
		}
	}



}
