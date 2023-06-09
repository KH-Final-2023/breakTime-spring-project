package com.kh.breaktime.booking.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.breaktime.booking.model.service.BookingService;
import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.member.model.vo.Member;



@Controller
@RequestMapping("/booking")
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
	
	
	  


}
