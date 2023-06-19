package com.kh.breaktime.room.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.room.model.service.RoomService;
import com.kh.breaktime.room.model.vo.Room;
import com.kh.breaktime.room.model.vo.RoomImg;

@Controller
@RequestMapping("/businessRoom")
@SessionAttributes({ "loginBusiness" })
public class RoomController {

	@Autowired
	private RoomService buService;

	@Autowired
	private ServletContext servletContext;

//	  private static final Logger Logger = LoggerFactory.getLogger(buController.class);

	@PostMapping("/enroll")
	public String registerBuRoom(Room buRoom, @RequestParam("upfiles") List<MultipartFile> upfiles, HttpSession session,
			Model model) {
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
			e.printStackTrace();
			model.addAttribute("errorMsg", "객실 등록 실패");
			return "common/errorPage";
		}
	}

	public String saveImage(MultipartFile file) {
		// MultipartFile 객체인 file을 매개변수로 받습니다. 이 객체는 업로드된 이미지 파일을 나타냅니다.
		String uploadPath = servletContext.getRealPath("/resources/images"); // 이미지 저장 디렉토리 경로
		// servletContext.getRealPath("/resources/images")를 사용하여 이미지 저장 디렉토리 경로인
		// uploadPath를 가져옵니다.
		// servletContext.getRealPath 메서드는 서블릿 컨텍스트를 통해 실제 파일 시스템 경로를 얻을 수 있습니다. 여기서는
		// /resources/images 디렉토리를 사용합니다.
		String fileName = StringUtils.cleanPath(file.getOriginalFilename()); // 파일명
		// file.getOriginalFilename()을 호출하여 업로드된 파일의 원래 파일명을 가져옵니다.
		try {
			// StringUtils.cleanPath를 사용하여 파일명에서 잠재적인 경로 조작을 정리합니다.
			// 이는 파일명에 포함된 경로 구분자 등을 제거하여 안전한 파일명을 생성하는 작업입니다.
			String savePath = uploadPath + File.separator + fileName;
			// 이미지 저장 경로인 savePath를 uploadPath + File.separator + fileName로 생성합니다.
			// File.separator는 파일 시스템의 경로 구분자를 나타냅니다.
			// 이미지 저장
			File dest = new File(savePath);
			file.transferTo(dest);
			// File 객체를 생성하여 savePath에 해당하는 파일을 나타냅니다.
			// file.transferTo(dest)를 호출하여 업로드된 파일을 지정된 위치에 저장합니다.
			// 저장된 파일 경로 반환
			return savePath;
			// 파일이 성공적으로 저장되면 저장된 파일 경로인 savePath를 반환합니다.
		} catch (IOException e) {
			// 저장 실패 시 예외 처리
			e.printStackTrace();
			return null;
			// 저장 중에 발생한 예외나 오류는 IOException으로 처리되며, 예외가 발생한 경우 null반환
		}
	}

//	@PostMapping("/businessRoomList")
//	public String businessList() {Model model, HttpSession session
//	     로그인된 사업자 정보 가져오기
//	    Business loginUser = (Business) session.getAttribute("loginUser");
//
//	     사업자의 방 정보와 이미지 정보 가져오기
//	    List<BusinessRoom> roomList = buService.getRoomsByBuId(loginUser.getBuId());
//	    List<BusinessRoomImg> roomImgList = buService.getRoomImagesByBuId(loginUser.getBuId());
//
//	     Model에 방 정보와 이미지 정보 저장
//	    model.addAttribute("roomList", roomList);
//	    model.addAttribute("roomImgList", roomImgList);
//
//	    return "businessRoom/buRoomList";
//	    
//	}
	@PostMapping("/businessRoomList")
	public String businessList(Model model, HttpSession session) {
		// 세션에서 loginUser 속성 가져오기
		Business loginUser = (Business) session.getAttribute("loginUser");

		// loginUser 값 확인
		System.out.println("loginUser: " + loginUser);

		// loginUser 사용
		// ...

		return "businessRoom/buRoomList";
	}

	@GetMapping("/resister")
	public String buRoomEnroll() {
		return "businessRoom/buRoomEnroll";
	}

	@GetMapping("/review")
	public String buReview() {
		return "businessRoom/buReview";
	}

	@PostMapping("/buRoomModify")
	public String updateBuRoom(Room room, @RequestParam("upfiles") List<MultipartFile> upfiles, HttpSession session,
			Model model, @RequestParam(value = "roomNo") int roomNo, @RequestParam(value = "fileNo") int fileNo) {

		try {
			List<String> savedImagePaths = new ArrayList<>();
			int result = buService.updateRoom(room);

			// RoomImg 정보 수정
			List<RoomImg> roomImgList = new ArrayList<>();

			for (MultipartFile file : upfiles) {
				// 파일이 비어있지 않은 경우 -> 사진까지 수정한 경우
				if (!file.isEmpty()) {
					String savedImagePath = saveImage1(file);
					savedImagePaths.add(savedImagePath);

					savedImagePath = saveImage(file);

					RoomImg roomImg = new RoomImg();
					roomImg.setFileNo(fileNo);
					roomImg.setRoomNo(result);
					roomImg.setOriginName(file.getOriginalFilename());
					roomImg.setSaveName(savedImagePath);
					roomImg.setFilePath("/resources/images");
					roomImg.setFileLevel(0);
					roomImg.setStatus("N");

					roomImgList.add(roomImg);

					// RoomImg 리스트 업데이트
					buService.updateRoomImg(roomImgList);
				}
				session.setAttribute("alertMsg", "객실 수정이 완료되었습니다.");
				return "redirect:/businessRoom/buRoomList";
			}
			return "redirect:/businessRoom/buRoomList";

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", "객실 수정 실패");
			return "common/errorPage";
		}

	}

	private String saveImage1(MultipartFile file) throws IOException {
		// 저장할 디렉토리 경로
		String uploadDir = "C:/BREAKTIME/breakTime-spring-project/src/main/webapp/resources/images";
		// 저장할 파일명
		String fileName = file.getOriginalFilename();
		// 저장된 이미지 경로
		String savedImagePath = uploadDir + "/" + fileName;

		try {
			// 이미지 파일을 지정된 경로에 저장
			Files.copy(file.getInputStream(), Paths.get(savedImagePath), StandardCopyOption.REPLACE_EXISTING);
			return savedImagePath;
		} catch (IOException e) {
			// 오류 처리 로직 추가
			e.printStackTrace();
			throw new IOException("이미지 저장에 실패하였습니다.");
		}
	}

	@GetMapping("/modifyPage")
	public String modifyPage(Model model, HttpSession session, @RequestParam("roomNo") int roomNo) {
		// 방 이미지와 방 정보 페이지로 이동
		Business loginBusiness = (Business) session.getAttribute("loginBusiness");
		List<Room> roomList = buService.getRoomsModifyByBuId(roomNo);
		List<RoomImg> roomImgList = new ArrayList<RoomImg>();
		for (int i = 0; i < roomList.size(); i++) {
			RoomImg roomImg = buService.getRoomImagesModifyByBuId(roomList.get(i).getRoomNo());
			roomImgList.add(roomImg);
		}
		if(roomList.size()!=0 && roomImgList.size() !=0) {
		model.addAttribute("room", roomList.get(0));
		model.addAttribute("roomImg", roomImgList.get(0));
		}
		return "businessRoom/buRoomModify";
	}

	@GetMapping("buRoomList")
	public String selectBuRoomList(Model model, HttpSession session) {
		Business loginBusiness = (Business) session.getAttribute("loginBusiness");
		List<Room> roomList = buService.standardRoom(loginBusiness.getBuNo());
		List<RoomImg> roomImgList = new ArrayList<RoomImg>();
		for (int i = 0; i < roomList.size(); i++) {

			RoomImg roomImg = buService.standardRoomImg(roomList.get(i).getRoomNo());
			roomImgList.add(roomImg);
		}

		model.addAttribute("roomList", roomList);
		model.addAttribute("roomImgList", roomImgList);
		System.out.println(roomList);
		System.out.println(roomImgList);
		return "businessRoom/buRoomList";
	}

	@GetMapping("/searchRoomList")
	public String searchRooms(@RequestParam Map<String, Object> paramMap, String roomName, int roomHCount, String roomPrice, Model model) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("roomName", roomName);
	    params.put("roomHCount", roomHCount);
	    params.put("roomPrice", roomPrice);
	    List<Room> roomList = buService.searchRooms(params);
	    if (roomList == null) {
	        model.addAttribute("errorMsg", "객실 등록 실패");
	        return "common/errorPage";
	    }
	    model.addAttribute("roomList", roomList);

	    // 이미지 불러오기
	    List<RoomImg> roomImgList = new ArrayList<>();
	    for (Room room : roomList) {
	        RoomImg roomImg = buService.searchRoomsImg(room.getRoomNo());
	        roomImgList.add(roomImg);
	    }
	    model.addAttribute("roomImgList", roomImgList);

	    return "businessRoom/buRoomList";
	}


	/*
	 * @GetMapping("/paing") public String searchRoomList(@RequestParam(defaultValue
	 * = "1") int page, Model model) { int pageSize = 10; // 한 페이지에 표시할 방 개수 int
	 * totalCount = roomService.getTotalCount(); // 전체 방 개수
	 * 
	 * // 페이징 계산 Pagination pagination = new Pagination(totalCount, page, pageSize);
	 * 
	 * // 페이지에 해당하는 방 정보 가져오기 List<Room> roomList = roomService.getRoomsByPage(page,
	 * pageSize);
	 * 
	 * model.addAttribute("roomList", roomList); model.addAttribute("pagination",
	 * pagination);
	 * 
	 * return "searchRoomList"; }
	 */
}
