package com.kh.breaktime.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.pay.model.service.PayService;
import com.kh.breaktime.review.model.service.ReviewService;
import com.kh.breaktime.review.model.vo.Review;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	private ReviewService reviewService;
	
	
	@Autowired
	   public ReviewController(ReviewService reviewService) {
	      this.reviewService = reviewService;

	   }

	   public ReviewController() {

	   }

	   @Autowired
	   public void setReviewService(ReviewService reviewService) {
	      this.reviewService = reviewService;
	   }
	   
	 
	
	@GetMapping("/insert")
	public String insertReview(Review review) {
		reviewService.insertReview(review);
		return "";
			
		}
	
	@GetMapping("/selectReviewList")
	public String selectReplyList(int reviewNo) {
		
		List<Review> rList = reviewService.selectReviewList(reviewNo);
		return new Gson().toJson(rList);
	}
		
		
		
		
	}
	
	
	
	

