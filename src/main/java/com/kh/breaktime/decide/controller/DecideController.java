package com.kh.breaktime.decide.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
		
		ArrayList<Decide> mainList = decideService.selectDecideMain(buNo);
		
		int rCnt = decideService.selectReviewCount(buNo);
		
		map.put("buNo", mainList.get(0).getBuNo());
		map.put("buTitle", mainList.get(0).getBuTitle());
		map.put("buAddress", mainList.get(0).getBuAddress());
		map.put("mainImg", mainList.get(0).getMainImg());
		map.put("starScore", mainList.get(0).getStarScore());
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
	
	@GetMapping("/demap/{buNo}") // 지도 조회
	public String decideMainMap(@PathVariable("buNo") int buNo, Model model) {	
		
		ArrayList<Decide> mapList = decideService.selectDecideMap(buNo);
		model.addAttribute("mapList", mapList);
		
		return "decide/decideMainMap";
	}
	
	@GetMapping("/detailmap/{buNo}") // 상세지도 조회
	public String decideDetailMap(@PathVariable("buNo") int buNo, Model model) {	
		
		ArrayList<Decide> mapDetailList = decideService.selectDecideMap(buNo);
		model.addAttribute("mapDetailList", mapDetailList);
		
		return "decide/decideDetailMap";
	}
	
	@GetMapping("/dereview/{buNo}") // 리뷰 조회
	public String decideReview(@PathVariable("buNo") int buNo, Model model) {

		ArrayList<Decide> reviewList = decideService.selectDecideReview(buNo);
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
