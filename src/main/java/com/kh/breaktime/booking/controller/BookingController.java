package com.kh.breaktime.booking.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import com.kh.breaktime.admin.model.vo.Notice;
import com.kh.breaktime.booking.model.service.BookingService;
import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.decide.model.vo.Decide;
import com.kh.breaktime.member.model.vo.Member;
import com.kh.breaktime.review.model.vo.Review;
import com.kh.breaktime.room.model.vo.Room;


@Controller
@RequestMapping("/booking")
@SessionAttributes({ "loginUser" })
public class BookingController {


	private BookingService bookingService;
	private static final Logger logger = LoggerFactory.getLogger(BookingController.class);

	@Autowired
	public void setBookingService(BookingService bookingService) {
		this.bookingService = bookingService;
	}

	@GetMapping("/bookingView")
	public String selectBookingList(Model model, HttpSession session) {

		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<Booking> bookingList = bookingService.selectBookingList(userNo);

		model.addAttribute("bookingList", bookingList);
		System.out.println(bookingList);
		System.out.println(userNo);
		return "booking/memberBooking";
	}

	@PostMapping("/reviewInsert")
	@ResponseBody
	public String reviewEnroll(@RequestParam("reviewNo") int reviewNo,
			@RequestParam("reviewContent") String reviewContent, @RequestParam("reviewWriter") int reviewWriter,
			@RequestParam("starScore") int starScore, @RequestParam("bookNo") int bookNo,
			@RequestParam("usingRoom") int usingRoom, Model model, RedirectAttributes rttr, HttpSession session) {

		Review review = new Review();
		review.setReviewNo(reviewNo);
		review.setReviewContent(reviewContent);
		review.setReviewWriter(reviewWriter);
		review.setStarScore(starScore);
		review.setBookNo(bookNo);
		review.setUsingRoom(usingRoom);

		int temp = bookingService.insertReview(review);
		String result = String.valueOf(temp);

		model.addAttribute("insertReview", review);
		return result;
	}
	 
	// 예약 등록
	@GetMapping("/insertBooking")
	public String insertBooking(@RequestParam String requestData,  HttpSession session) {
		
		int userNo = ((Member) session.getAttribute("loginUser")).getUserNo();
		Booking booking = new Booking(); 
		booking.setUserNo(userNo);
	
		try {
	        String decodedData = URLDecoder.decode(requestData, "UTF-8");
	        Gson gson = new Gson();
	        Map<String, List<Object>> requestDataMap = gson.fromJson(decodedData, new TypeToken<Map<String, List<Object>>>() {}.getType());
	
	        List<Object> roomDataList = requestDataMap.get("roomData");
	        List<Integer> roomNoList = new ArrayList<>(); // roomNo를 담을 리스트 생성
	        
	        for (Object roomDataItem : roomDataList) {
	        	
	            List<Object> roomData = (List<Object>) roomDataItem;
	            
	            double roomNoDouble = (double) roomData.get(0);
	            int roomNo = (int) roomNoDouble;
	            String roomName = (String) roomData.get(1);
	            String roomCheckin = (String) roomData.get(2);
	            String roomCheckout = (String) roomData.get(3);
	            double roomHCountDouble = (double) roomData.get(4);
	            int roomHCount = (int) roomHCountDouble;
		
			    booking.setRoomNo(roomNo);
			    booking.setRoomName(roomName);
			    booking.setRoomCheckin(roomCheckin);
			    booking.setRoomCheckout(roomCheckout);
			    booking.setRoomHCount(roomHCount);
			    
			    roomNoList.add(roomNo); // roomNo를 리스트에 추가
			    bookingService.insertBooking(booking);
	        }
	        // 요청간 데이터 전송을 위해 세션에 데이터를 저장
	        session.setAttribute("roomNoArray", roomNoList.toArray(new Integer[0]));
	        return "redirect:/booking/success";
	        
		} catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	        // 에러 처리
	        return "error";
	    }
	}
	
	// 예약 성공 페이지 포워딩
	@GetMapping("/success")
	public String successBooking(Model model, HttpSession session) {
		
		int userNo = ((Member) session.getAttribute("loginUser")).getUserNo();
		Booking booking = new Booking(); 
		booking.setUserNo(userNo);
		
		//예약이 성공한 후에 받아온 roomNo값들을 통해 CART의 내용을 삭제해준다.
		Integer[] roomNoArray = (Integer[]) session.getAttribute("roomNoArray");
		
	    // 성공 시 카트리스트 삭제
		for (Integer roomNo : roomNoArray) {
	        booking.setRoomNo(roomNo);
	        bookingService.deleteCartList(booking);
	    }
		
		session.removeAttribute("roomNoArray");
		//예약 완료 페이지로 이동 !
		return "pay/paySuccess";
	}

	@ResponseBody
	@GetMapping("/getReviewList")
	public String getReviewList(HttpSession session) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		ArrayList<Review> reviewList = bookingService.selectReviewList(userNo);
		return new Gson().toJson(reviewList);
	}


}

