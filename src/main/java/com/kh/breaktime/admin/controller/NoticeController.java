package com.kh.breaktime.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.kh.breaktime.admin.model.service.NoticeService;
import com.kh.breaktime.admin.model.vo.Notice;


@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
//	@GetMapping("/list")
//	public String noticeList(
//							Model model,
//						    @RequestParam(value = "cpage", defaultValue="1") int currentPage,
//						    @RequestParam Map<String, Object> paramMap) {
//
//		Map<String, Object> map= new HashMap();
//	
//		
//		model.addAttribute("map",map);
//		
//		return "admin/noticeListView";
//		
//	}
	@GetMapping("/list")
	public String notice(Model model,
						 @RequestParam(value="cpage", required=false, defaultValue="1") int cp
						 ) {
		Map<String, Object> map = new HashMap();
		noticeService.selectNoticeList(cp,map);
		model.addAttribute("selectNoticeList",map);
		return "admin/noticeListView";
	}
	// 상세조회
	@GetMapping("/detail/{noticeNo}")
	public String noticeDetail( @PathVariable("noticeNo") int noticeNo,
		      @RequestParam(value="cpage",required=false, defaultValue="1") int cp,
		      Model model,
		      HttpSession session,
		      HttpServletRequest req, HttpServletResponse resp) {
		// 게시글 상세조회 서비스 호출 
		Notice detail = noticeService.selectNoticeDetail(noticeNo);
		
		
		model.addAttribute("n",detail);
		return "admin/noticeDetailView";
	}
	
	@GetMapping("/enrollForm")
	public String noticeEnrollForm(
				Model model,
				@RequestParam(value="mode", defaultValue = "insert", required = false) String mode,
				@RequestParam(value="nno", defaultValue = "0", required = false) int nno
			) {
		if(mode.equals("update")) {
			// 수정하기 페이지 요청 
			// 선택한 게시판 정보 조회 후 이동. 
			Notice n = noticeService.selectNoticeDetail(nno);
			
			model.addAttribute("n", n);
			
		}
			return "admin/noticeEnrollForm";
		
	}
	
	@PostMapping("/insert")
	public String insertBoard(
			Notice n,
			@RequestParam(value="mode", required=false, defaultValue = "insert") String mode,
			HttpSession session,
			Model model,
			@RequestParam(value="deleteList", required=false) String deleteList
			) {

		int result = 0; 

		if(mode.equals("insert")) {
			
			// db에 Board테이블에 데이터 추가 
			try {
				result = noticeService.insertNotice(n);
			}catch(Exception e){
				
			}
		} else {
			// 게시글 수정 서비스 호출
			// b객체 안에 boardNo이 들어간 상태일 것.
			
			try {
				result = noticeService.updateNotice(n);
			} catch (Exception e) {
				
			}
		}
		
		
		
		if(result > 0) { // 성공적으로 추가시 
			session.setAttribute("alertMsg", "게시글 작성에 성공하셨습니다.");
			return "redirect:../list/";
		}else { // errorPage 포워딩 
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
	}
	
	
	
	
	
	
	
}
