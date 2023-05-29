package com.kh.breaktime.businessRoom.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@Autowired
	private ServletContext servletContext;

//	  private static final Logger Logger = LoggerFactory.getLogger(buController.class);

	@PostMapping("/enroll")
	public String registerBuRoom(BusinessRoom buRoom, @RequestParam("upfiles") List<MultipartFile> upfiles,
			HttpSession session, Model model) {
		try {
			List<String> savedImagePaths = new ArrayList<>();
			for (MultipartFile file : upfiles) {
				if (!file.isEmpty()) {
					String savedImagePath = saveImage(file);
					savedImagePaths.add(savedImagePath);
				}
			}
			buRoom.setRoomImg(savedImagePaths);
			buService.insertBuRoom(buRoom, upfiles);
			session.setAttribute("alertMsg", "객실 등록이 완료되었습니다.");
			return "redirect:/businessRoom/buRoomList";
		} catch (Exception e) {
			model.addAttribute("errorMsg", "객실 등록 실패");
			return "common/errorPage";
		}
	}

	public String saveImage(MultipartFile file) {
		//MultipartFile 객체인 file을 매개변수로 받습니다. 이 객체는 업로드된 이미지 파일을 나타냅니다.
		String uploadPath = servletContext.getRealPath("/resources/images"); // 이미지 저장 디렉토리 경로
		//servletContext.getRealPath("/resources/images")를 사용하여 이미지 저장 디렉토리 경로인 uploadPath를 가져옵니다. 
		//servletContext.getRealPath 메서드는 서블릿 컨텍스트를 통해 실제 파일 시스템 경로를 얻을 수 있습니다. 여기서는 /resources/images 디렉토리를 사용합니다.
		String fileName = StringUtils.cleanPath(file.getOriginalFilename()); // 파일명
		//file.getOriginalFilename()을 호출하여 업로드된 파일의 원래 파일명을 가져옵니다.
		try {
			//	StringUtils.cleanPath를 사용하여 파일명에서 잠재적인 경로 조작을 정리합니다. 
			//이는 파일명에 포함된 경로 구분자 등을 제거하여 안전한 파일명을 생성하는 작업입니다.
			String savePath = uploadPath + File.separator + fileName;
			//이미지 저장 경로인 savePath를 uploadPath + File.separator + fileName로 생성합니다. 
			//File.separator는 파일 시스템의 경로 구분자를 나타냅니다.
			// 이미지 저장
			File dest = new File(savePath);
			file.transferTo(dest);
			//	File 객체를 생성하여 savePath에 해당하는 파일을 나타냅니다.
			//file.transferTo(dest)를 호출하여 업로드된 파일을 지정된 위치에 저장합니다.
			// 저장된 파일 경로 반환
			return savePath;
			//파일이 성공적으로 저장되면 저장된 파일 경로인 savePath를 반환합니다.
		} catch (IOException e) {
			// 저장 실패 시 예외 처리
			e.printStackTrace();
			return null;
			//저장 중에 발생한 예외나 오류는 IOException으로 처리되며, 예외가 발생한 경우 null반환
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