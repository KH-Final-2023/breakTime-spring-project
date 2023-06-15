package com.kh.breaktime.decide.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.breaktime.member.model.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.kh.breaktime.decide.model.service.DecideService;
import com.kh.breaktime.decide.model.vo.Decide;

import javax.servlet.http.HttpSession;

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
   public String decideMain(@PathVariable("buNo") int buNo, Model model, HttpSession session) {
	  
	  Map<String, Object> map = new HashMap();
	  
	  Member loginUser = (Member) session.getAttribute("loginUser");
	  int userNo;
	  if (loginUser != null) {
		  userNo = loginUser.getUserNo();
		  
		  Decide decide = new Decide();
		  decide.setUserNo(userNo);
		  decide.setBuNo(buNo);
		  
		  int isLike = decideService.selectLikeValue(decide); // 메인 찜 유무 조회
		  map.put("isLike", isLike);
	  }
      
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
      model.addAttribute("roomNo", roomList.get(0).getRoomNo());
      model.addAttribute("buNo", roomList.get(0).getBuNo());

      return "decide/decideRoomSelect";
   }
   
   @RequestMapping(value = "/pay", method = {RequestMethod.GET, RequestMethod.POST}) // 객실 구매 목록 조회 @RequestMapping GET, POST 둘다 가능
   public String payRoomSelect(@RequestParam(value = "roomNos[]", required = false) List<Integer> roomNos,  // roomNos[] 에 값을 저장 값이 없어도 가능
		   @RequestParam(value = "roomNo", required = false) Integer singleRoomNo,Model model) {
       
       Map<String, Object> map = new HashMap<>();
       
       if (roomNos != null) {
	       for(int i = 0; i < roomNos.size(); i++) {
	    	   
	           int roomNo = roomNos.get(i);
	           System.out.println("for - roomNo :" + roomNo);
	           ArrayList<Decide> roomList = decideService.payDecideRoom(roomNo);
	           
	           map.put("roomList" + i , roomList);
	       }
       } else if (singleRoomNo != null) {
    	   
           ArrayList<Decide> roomList = decideService.payDecideRoom(singleRoomNo);
           map.put("roomList", roomList);
       }
       
       model.addAttribute("map", map);

       return "pay/pay";
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
   
   @GetMapping("/insert")
   public String insertReview(Decide decide) {
      
      decideService.insertReview(decide);
      
      return "decide/decideReview";
         
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
   public String decideBasket(Model model, HttpSession session) {

      Member loginUser = (Member) session.getAttribute("loginUser");
      int userNo = loginUser.getUserNo();

      ArrayList<Decide> list = decideService.selectCartList(userNo);

      
      model.addAttribute("list", list);

      return "decide/decideBasket";
   }

   @PostMapping("/insertCart") // 장바구니 등록
   @ResponseBody
   public String insertCartList(@RequestBody Map<String, Object> requestData, HttpSession session) {

      String cartCheckIn = requestData.get("checkIn").toString();
      String cartCheckOut = requestData.get("checkOut").toString();
      int roomNo = Integer.parseInt(requestData.get("roomNo").toString());
      int buNo = Integer.parseInt(requestData.get("buNo").toString());

      Member loginUser = (Member) session.getAttribute("loginUser");
      int userNo = loginUser.getUserNo();
      
      ArrayList<Decide> list = decideService.selectCartList(userNo);
      for(Decide li : list) {
    	  if ( ( roomNo == li.getRoomNo() && buNo == li.getBuNo()) && (cartCheckIn == li.getCartCheckIn() || cartCheckOut == li.getCartCheckOut()) ){
    		  return  String.valueOf(0);
    	  }
      }

      Decide decide = new Decide();

      decide.setUserNo(userNo);
      decide.setRoomNo(roomNo);
      decide.setBuNo(buNo);
      decide.setCartCheckIn(cartCheckIn);
      decide.setCartCheckOut(cartCheckOut);


      int temp = decideService.insertCartList(decide);
      String result = String.valueOf(temp);

      return result;
   }

   @PostMapping("/deleteCart") // 장바구니 삭제
   @ResponseBody
   public String deleteCartList(@RequestBody Map<String, Object> requestData, HttpSession session) {
	   
	  List<Map<String, Object>> items = (List<Map<String, Object>>) requestData.get("items");
	  String flag = (String) requestData.get("flag");
	  
      Member loginUser = (Member) session.getAttribute("loginUser");
      int userNo = loginUser.getUserNo();
      
      int temp = 0;
      String result;
      
	  // 선택삭제
	  for(Map<String, Object> map : items) {
		  Decide decide = new Decide();
		  
		  int roomNo = Integer.parseInt(map.get("roomNo").toString());
		  int buNo = Integer.parseInt(map.get("buNo").toString());
		  
		  decide.setUserNo(userNo);
		  decide.setRoomNo(roomNo);
		  decide.setBuNo(buNo);
		  
		  temp += decideService.deleteCartList(decide);
	  }  
      result = String.valueOf(temp);
      
      return result;
   }
   
   @PostMapping("/insertLike") // 좋아요, 찜기능
   @ResponseBody
   public String insertLIkeValue(@RequestBody Map<String, Object> requestData, HttpSession session) {
	   
	  int buNo = Integer.parseInt(requestData.get("buNo").toString());
      Member loginUser = (Member) session.getAttribute("loginUser");
      int userNo = loginUser.getUserNo();
      
      Decide decide = new Decide();
      decide.setUserNo(userNo);
      decide.setBuNo(buNo);

      int temp = decideService.insertLIkeValue(decide);
      String result = String.valueOf(temp);
      
      return result;
   }
   
   @PostMapping("/deleteLike") // 좋아요, 찜 취소 기능
   @ResponseBody
   public String deleteLikeValue(@RequestBody Map<String, Object> requestData, HttpSession session) {

	  int buNo = Integer.parseInt(requestData.get("buNo").toString());
      Member loginUser = (Member) session.getAttribute("loginUser");
      int userNo = loginUser.getUserNo();
      
      Decide decide = new Decide();
      decide.setUserNo(userNo);
      decide.setBuNo(buNo);
      
      int temp = decideService.deleteLikeValue(decide);
      
      String result = String.valueOf(temp);
      return result;
   }
}