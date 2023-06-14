package com.kh.breaktime.decide.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.breaktime.member.model.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
      model.addAttribute("roomNo", roomList.get(0).getRoomNo());
      model.addAttribute("buNo", roomList.get(0).getBuNo());

      return "decide/decideRoomSelect";
   }

   @GetMapping("/pay/{roomNo}") // 선택 객실 조회
	public String payRoomSelect(
			@PathVariable("roomNo") int roomNo,Model model) {
		
		ArrayList<Decide> roomList = decideService.payDecideRoom(roomNo);
		model.addAttribute("roomList", roomList);
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
   public String insertCartList(@RequestBody Map<String, Object> requestData, HttpSession session, Model model) {

      String cartCheckIn = requestData.get("checkIn").toString();
      String cartCheckOut = requestData.get("checkOut").toString();
      int roomNo = Integer.parseInt(requestData.get("roomNo").toString());
      int buNo = Integer.parseInt(requestData.get("buNo").toString());

      Member loginUser = (Member) session.getAttribute("loginUser");
      int userNo = loginUser.getUserNo();

      Decide decide = new Decide();

      decide.setUserNo(userNo);
      decide.setRoomNo(roomNo);
      decide.setBuNo(buNo);
      decide.setCartCheckIn(cartCheckIn);
      decide.setCartCheckOut(cartCheckOut);

      System.out.println(decide);

      int result = decideService.insertCartList(decide);
      System.out.println(result);

      return "decide/decideBasket";
   }

   @GetMapping("/deleteCart") // 장바구니 삭제
   public String deleteCartList(HttpSession session, Model model) {

      Member loginUser = (Member) session.getAttribute("loginUser");
      int userNo = loginUser.getUserNo();

      decideService.deleteCartList(userNo);

      return "decide/decideBasket";
   }
}