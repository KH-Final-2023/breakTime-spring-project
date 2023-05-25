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
	
	@GetMapping("/list")
	public String notice(Model model,
						 @RequestParam(value="cpage", required=false, defaultValue="1") int cp
						 ) {
		Map<String, Object> map = new HashMap();
		noticeService.selectNoticeList(cp,map);
		model.addAttribute("selectNoticeList",map);
		return "admin/noticeListView";
	}
	@GetMapping("/detail")
	public String noticeDetail( Model model,
		      					@RequestParam(value="noticeNo",required=false, defaultValue="0") int noticeNo){
		
		model.addAttribute("notice",noticeService.selectNoticeDetail(noticeNo));
		return "admin/noticeDetailView";
	}
	
	@GetMapping("/enrollForm")
	public String noticeEnrollForm(
				Model model,
				@RequestParam(value="mode", defaultValue = "insert", required = false) String mode,
				@RequestParam(value="nno", defaultValue = "0", required = false) int nno
			) {
		if(mode.equals("update")) {
			Notice n = noticeService.selectNoticeDetail(nno);
			
			model.addAttribute("n", n);
			
		}
			return "admin/noticeEnrollForm";
		
	}
	
	@PostMapping("/insert")
	public String noticeEnroll(Notice n , HttpSession session, Model model ) {
		
		if(n.getNoticeNo() == 0) {
			int result = noticeService.insertNotice(n);
			session.setAttribute("alertMsg", "게시글 작성에 성공하셨습니다.");
		}
		
		int result = 0;
		if(result < 0) { 
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}else { // 
			session.setAttribute("alertMsg", "게시글 작성에 성공하셨습니다.");
			return "redirect:../notice/list/";
		}
	}
	
	@GetMapping("/delete")
	public String noticeDelte(@RequestParam(value="noticeNo", required=false, defaultValue="0") int noticeNo) {
		
		noticeService.deleteNotice(noticeNo);
		
		return "redirect:../notice/list/";
	}
	
}
