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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.breaktime.admin.model.vo.Notice;
import com.kh.breaktime.booking.model.service.BookingService;
import com.kh.breaktime.booking.model.vo.Booking;
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
   public String reviewEnroll(Review r, HttpSession session, Model model, RedirectAttributes rttr) {
      bookingService.insertReview(r);
      System.out.println("리뷰출력 : "  + r);
      model.addAttribute("Review", r);
      rttr.addFlashAttribute("insertReivew", r.getReviewNo());
      return "redirect:/booking/bookingView";
      
   }
   
   
   @GetMapping("/pay")
   public String selectPay(Model model, HttpSession session) {
      
      Member loginUser = (Member) session.getAttribute("loginUser");
      int userNo = loginUser.getUserNo();
      ArrayList<Room> bookingList = bookingService.selectPay(userNo);
      
      model.addAttribute("bookingList", bookingList);
      System.out.println(bookingList);
       System.out.println(userNo);
      return "pay/pay";
   }
   
   
   
   
   
   
   
   
}