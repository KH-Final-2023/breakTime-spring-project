package com.kh.breaktime.businessRoom.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.breaktime.businessRoom.model.service.BuService;
import com.kh.breaktime.businessRoom.model.vo.BusinessRoom;

@Controller
@RequestMapping("/businessRoom")
public class buController {

    // ...
	  @Autowired
	  private BuService buService;

//	  private static final Logger Logger = LoggerFactory.getLogger(buController.class);
	  
	   

	    @GetMapping("/enroll")
	    public String registerBuRoom(
	        BusinessRoom buRoom,
	        @RequestParam("upfiles") List<MultipartFile> upfiles,
	        HttpSession session,
	        Model model
	    ) {
	        try {
	            List<String> savedImagePaths = new ArrayList<>();
	            for (MultipartFile file : upfiles) {
	                if (!file.isEmpty()) {
	                    String savedImagePath = saveImage(file);
	                    savedImagePaths.add(savedImagePath);
	                }
	            }
	            buRoom.setRoomImg(savedImagePaths);
	            buService.insertBuRoom(buRoom , upfiles);
	            session.setAttribute("alertMsg", "객실 등록이 완료되었습니다.");
	            return "redirect:/businessRoom/buRoomList";
	        } catch (Exception e) {
	            model.addAttribute("errorMsg", "객실 등록 실패");
	            return "common/errorPage";
	        }
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

	    @GetMapping("/resister")
	    public String buRoomEnroll() {
	        return "businessRoom/buRoomEnroll";
	    }
	    @GetMapping("/reservation")
	    public String buReservation() {
	        return "businessRoom/buReservation";
	    }
	    
	    @GetMapping("/review")
	    public String buReview() {
	        return "businessRoom/buReview";
	    }
    			
    
   
}

