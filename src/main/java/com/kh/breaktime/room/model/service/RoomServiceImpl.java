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

import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.common.model.vo.PageInfo;
import com.kh.breaktime.common.template.Pagination;
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

   public int updateRoom(Room room) {
      System.out.println(
            "roomNo:=================================================================================== " + room);
      return buDao.updateRoom(room);
   }

   public int updateRoomImg(List<RoomImg> roomImgList) {
      System.out.println("roomImgList: " + roomImgList);
      return buDao.updateRoomImg(roomImgList);
   }

   @Override
   public List<Room> getRoomsModifyByBuId(int roomNo) {
      return buDao.getRoomsModifyByBuId(roomNo);
   }

   @Override
   public RoomImg getRoomImagesModifyByBuId(int buNo) {
      return buDao.getRoomImagesModifyByBuId(buNo);
   }

   @Override
   public List<Room> standardRoom(int buNo) {
      return buDao.standardRoom(buNo);
   }

   @Override
   public RoomImg standardRoomImg(int roomNo) {
      return buDao.standardRoomImg(roomNo);
   }

   @Override
   public List<Room> searchRooms(Map<String, Object> params) {
      // 필요한 로직 수행
      return buDao.searchRooms(params);
   }
   @Override
   public RoomImg searchRoomsImg(int roomNo){
      return buDao.searchRoomsImg(roomNo);
   }
   @Override
   public int deleteRoom(int roomNo) {
       return buDao.deleteRoom(roomNo);
       
   }
   @Override
   public int deleteRoomImg(int roomNo) {
       return buDao.deleteRoomImg(roomNo);
       
   }
}