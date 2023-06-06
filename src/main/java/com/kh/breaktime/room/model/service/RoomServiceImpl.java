package com.kh.breaktime.room.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.kh.breaktime.room.model.dao.RoomDao;
import com.kh.breaktime.room.model.vo.Room;
import com.kh.breaktime.room.model.vo.RoomImg;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDao buDao;

	@Autowired
	private ServletContext servletContext;

	@Transactional(rollbackFor = Exception.class)
	public int insertBuRoom(Room buRoom, List<MultipartFile> upfiles) throws Exception {
		// 1) 객실 정보 등록
		int result = buDao.insertBuRoom(buRoom);

		if (result > 0 && upfiles != null) {
			// 2) 이미지 등록
			List<RoomImg> roomImgList = new ArrayList<>();

			for (MultipartFile file : upfiles) {
				if (!file.isEmpty()) {
					String savedImagePath = saveImage(file);

					RoomImg roomImg = new RoomImg();
					
					roomImg.setRoomNo(result);
					roomImg.setOriginName(file.getOriginalFilename());
					roomImg.setSaveName(savedImagePath);
					roomImg.setFilePath("/resources/images");
					roomImg.setFileLevel(0);
					roomImg.setStatus("N");
					
					System.out.print("junseok debug\n\n");
					System.out.print(roomImg);

					System.out.print("junseok debug\n");
					System.out.print(roomImgList);
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
		String uploadPath = servletContext.getRealPath("/resources/images"); // 이미지 저장 디렉토리 경로
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

	public int updateRoom(int roomNo, Room room) {
		System.out.println("roomNo: " + roomNo);
	    return buDao.updateRoom(roomNo, room);
	}

	public int updateRoomImg(int roomNo, List<RoomImg> roomImgList) {
		System.out.println("roomImgList: " + roomImgList);
	    return buDao.updateRoomImg(roomNo, roomImgList);
	}
}
