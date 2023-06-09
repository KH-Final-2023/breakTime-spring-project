package com.kh.breaktime.decide.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.breaktime.decide.model.service.DecideService;
import com.kh.breaktime.decide.model.vo.Decide;

@Controller
@RequestMapping("/decide")
public class DecideController {
	
	private DecideService decideService;
	
	private static final Logger logger = LoggerFactory.getLogger(DecideController.class);
	
	@Autowired
	public void setDecideService(DecideService decideService) {
		this.decideService = decideService;
	}
	
	// url : {contextPath}/decide/demain/{buNo}
	@GetMapping("/demain/{buNo}") // 메인 조회
	public String decideMain(@PathVariable("buNo") int buNo, Model model) {
 
		Map<String, Object> map = new HashMap();
		
		ArrayList<Decide> mainList = decideService.selectDecideMain(buNo); // 메인 조회
		
		double reviewScore = decideService.selectReviewScore(buNo); // 리뷰 평점 조회
		
		int rCnt = decideService.selectReviewCount(buNo); // 메인 리뷰 개수 조회
		
		if (mainList.size() > 0) {
	        Decide main = mainList.get(0);
	        map.put("buNo", main.getBuNo());
	        map.put("buTitle", main.getBuTitle());
	        map.put("buAddress", main.getBuAddress());
	        map.put("buMainImg", main.getBuMainImg());
	    } else {
	        // mainList가 비어 있는 경우에 대한 처리
	    	map.put("buNo", 0);
	        map.put("buTitle", "No Data");
	        map.put("buAddress", "No Data");
	        map.put("buMainImg", "No Image");
	    }
		
		
		map.put("starScore", reviewScore);
		map.put("reviewCount", rCnt);
		
		model.addAttribute("map", map);

		return "decide/decideMain";
	}
	
	@GetMapping("/deroom/{buNo}") // 객실 조회
	public String decideRoomSelect(@PathVariable("buNo") int buNo, Model model) {
		
		ArrayList<Decide> roomList = decideService.selectDecideRoom(buNo);
		model.addAttribute("roomList", roomList);
		
		return "decide/decideRoomSelect";
	}
	
	@GetMapping("/demap/{buNo}") // 메인 지도 화면 조회
	public String decideMainMap(@PathVariable("buNo") int buNo, Model model) {	
		
		Map<String, Object> map = new HashMap();
		
		ArrayList<Decide> mapList = decideService.selectDecideMap(buNo);
		
		map.put("buNo", mapList.get(0).getBuNo());
		map.put("buAddress", mapList.get(0).getBuAddress());
		
		model.addAttribute("map", map);
		
		return "decide/decideMainMap";
	}
	
	
	 @GetMapping("/detailmap/{buNo}") // 지도 메인 썸네일 조회
	 public String decideDetailMap(@PathVariable("buNo") int buNo, Model model) {
	 
		 Map<String, Object> map = new HashMap();
			 
		 ArrayList<Decide> mapDetailList = decideService.selectDetailMap(buNo);
		 map.put("buNo", mapDetailList.get(0).getBuNo());
		 map.put("buAddress", mapDetailList.get(0).getBuAddress());
		 map.put("buTitle", mapDetailList.get(0).getBuTitle());
		 
		 model.addAttribute("map", map);
		 
		 return "decide/decideDetailMap"; 
	 }
	 
	
	@GetMapping("/depopupmap/{buNo}") // 팝업 지도 조회
	public String decidePopupMap(@PathVariable("buNo") int buNo, Model model) {
	
	 Map<String, Object> map = new HashMap();
		
	 ArrayList<Decide> mappopupList = decideService.selectPopupMap(buNo);
	 
	 map.put("buAddress", mappopupList.get(0).getBuAddress());
	 map.put("buTitle", mappopupList.get(0).getBuTitle());
	 
	 model.addAttribute("map", map);

	 return "decide/decidePopupMap";
	}
	
	@GetMapping("/dereview/{buNo}") // 리뷰 조회
	public String decideReview(@PathVariable("buNo") int buNo, Model model) {
		
		Map<String, Object> map = new HashMap();

		ArrayList<Decide> reviewList = decideService.selectDecideReview(buNo);
		
		double reviewScore = decideService.selectReviewScore(buNo); // 리뷰 평점 조회
		
		List<Double> userStarScore  = decideService.selectuserStarScore(buNo); // 유저 리뷰 점수 조회
		
		int rCnt = decideService.selectReviewCount(buNo); // 메인 리뷰 개수 조회
		
		
		map.put("starScore", reviewScore);
		map.put("userStarScore", userStarScore);
		map.put("reviewCount", rCnt);
		
		model.addAttribute("map", map);
		model.addAttribute("reviewList", reviewList);
		
		return "decide/decideReview";
	}
	
	@GetMapping("/dedate") // 날짜 조회
	public String decideDateSelect() {

		return "decide/decideDateSelect";
	}
	
	@GetMapping("/debasket") // 장바구니 조회
	public String decideBasket() {

		return "decide/decideBasket";
	}
	
	

}
