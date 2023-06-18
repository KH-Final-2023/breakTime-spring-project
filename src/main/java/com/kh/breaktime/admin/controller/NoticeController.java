package com.kh.breaktime.admin.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.breaktime.admin.model.service.NoticeService;
import com.kh.breaktime.admin.model.vo.Notice;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.member.model.service.MemberService;
import com.kh.breaktime.member.model.vo.Member;
import com.kh.breaktime.review.model.vo.Review;


@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	// 관리자용 공지사항 리스트
	@GetMapping("/list")
	public String noticeList(Model model,
						 	@RequestParam(value="cpage", defaultValue="1") int cp,
						 	@RequestParam Map<String, Object> paramMap
						 	) {
		System.out.println(paramMap);
		Map<String, Object> map = new HashMap();

		if(paramMap.get("condition")==null) {
			noticeService.selectNoticeList(cp, map);
		}else {
			// 검색요청을 한 경우 
			// 검색조건을 추가한 상태로 게시글 셀렉트 
			paramMap.put("currentPage", cp);
			noticeService.selectNoticeList(paramMap, map);
		}
		
		//noticeService.selectNoticeList(cp,map);
		model.addAttribute("selectNoticeList",map);
		return "admin/noticeListView";
	}
	
	// 고객용 공지사항 리스트
	@GetMapping("/publicList")
	public String publicNoticeList(Model model,
						 	@RequestParam(value="cpage", defaultValue="1") int cp,
						 	@RequestParam Map<String, Object> paramMap
						 	) {
		System.out.println(paramMap);
		Map<String, Object> map = new HashMap();

		if(paramMap.get("condition")==null) {
			noticeService.selectNoticeList(cp, map);
		}else {
			// 검색요청을 한 경우 
			// 검색조건을 추가한 상태로 게시글 셀렉트 
			paramMap.put("currentPage", cp);
			noticeService.selectNoticeList(paramMap, map);
		}
		
		//noticeService.selectNoticeList(cp,map);
		model.addAttribute("selectNoticeList",map);
		return "admin/publicNoticeView";
	}
	
	// 관리자용 상세보기
	@GetMapping("/detail")
	public String noticeDetail( Model model,
		      					@RequestParam(value="noticeNo",required=false, defaultValue="0") int noticeNo,
		      					HttpSession session, HttpServletRequest req, HttpServletResponse resp){
		Notice detail = noticeService.selectNoticeDetail(noticeNo);
		
		if(detail != null) { // 상세조회 성공
			
			Member loginUser = (Member)session.getAttribute("loginUser");
			int memberNo = 0;
			if(loginUser != null) { // 로그인한 상태일때
				memberNo = loginUser.getUserNo();
			}
			//글쓴이와 현제 상세보기요청을 한 클라이언트가 같지 않을 경우에만 조회수 증가 서비스 호출
			if(Integer.parseInt(detail.getNoticeWriter()) != memberNo) {
				Cookie cookie = null;
				
				Cookie[] cArr =req.getCookies(); // 쿠기 얻어보기
				
				if(cArr != null && cArr.length > 0) { // 얻어온 쿠기가 있을 경우
					for( Cookie c : cArr) {
						if(c.getName().equals("readNoticeNo")) {
							cookie = c; 
						}
					}
				}
				int result = 0;
				if(cookie == null) { // 기존에 readBoardNo라는 이름의 쿠키가 없던 경우
					cookie = new Cookie("readNoticeNo", noticeNo+"");
					result = noticeService.updateReadCount(noticeNo); // 조회수 증가 서비스 호출 
					
				}else {
					String temp[] = cookie.getValue().split("/"); // 기존 value
					
					List<String> list = Arrays.asList(temp); // 배열 --> List로 변환시켜주는 함수
					
					if(list.indexOf(noticeNo+"") == -1) { // 즉, 기본값에 같은 글번호가 없다면
						cookie.setValue(cookie.getValue()+"/"+noticeNo);
						result = noticeService.updateReadCount(noticeNo); // 조회수 증가 서비스 호출
						
					}
				}
				if(result>0) {
					cookie.setPath(req.getContextPath());
					cookie.setMaxAge(60*60*1); // 1시간
					resp.addCookie(cookie);
				}
				
				
			}
			
		}
		
		model.addAttribute("notice",noticeService.selectNoticeDetail(noticeNo));
		return "admin/noticeDetailView";
	}
	
	// 고객용 상세보기
		@GetMapping("/publicDetail")
		public String publicNoticeDetail( Model model,
			      					@RequestParam(value="noticeNo",required=false, defaultValue="0") int noticeNo,
			      					HttpSession session, HttpServletRequest req, HttpServletResponse resp){
			Notice detail = noticeService.selectNoticeDetail(noticeNo);
			
			if(detail != null) { // 상세조회 성공
				
				Member loginUser = (Member)session.getAttribute("loginUser");
				int memberNo = 0;
				if(loginUser != null) { // 로그인한 상태일때
					memberNo = loginUser.getUserNo();
				}
				//글쓴이와 현제 상세보기요청을 한 클라이언트가 같지 않을 경우에만 조회수 증가 서비스 호출
				if(Integer.parseInt(detail.getNoticeWriter()) != memberNo) {
					Cookie cookie = null;
					
					Cookie[] cArr =req.getCookies(); // 쿠기 얻어보기
					
					if(cArr != null && cArr.length > 0) { // 얻어온 쿠기가 있을 경우
						for( Cookie c : cArr) {
							if(c.getName().equals("readNoticeNo")) {
								cookie = c; 
							}
						}
					}
					int result = 0;
					if(cookie == null) { // 기존에 readBoardNo라는 이름의 쿠키가 없던 경우
						cookie = new Cookie("readNoticeNo", noticeNo+"");
						result = noticeService.updateReadCount(noticeNo); // 조회수 증가 서비스 호출 
						
					}else {
						String temp[] = cookie.getValue().split("/"); // 기존 value
						
						List<String> list = Arrays.asList(temp); // 배열 --> List로 변환시켜주는 함수
						
						if(list.indexOf(noticeNo+"") == -1) { // 즉, 기본값에 같은 글번호가 없다면
							cookie.setValue(cookie.getValue()+"/"+noticeNo);
							result = noticeService.updateReadCount(noticeNo); // 조회수 증가 서비스 호출
							
						}
					}
					if(result>0) {
						cookie.setPath(req.getContextPath());
						cookie.setMaxAge(60*60*1); // 1시간
						resp.addCookie(cookie);
					}
					
					
				}
				
			}
			
			model.addAttribute("notice",noticeService.selectNoticeDetail(noticeNo));
			return "admin/publicNoticeDetail";
		}
	
	// 관리자 글등록 폼
	@GetMapping("/enrollForm")
	public String noticeEnrollForm(
				Model model,
				@RequestParam(value="mode", defaultValue = "insert", required = false) String mode,
				@RequestParam(value="nno", defaultValue = "0", required = false) int nno
			) {
			return "admin/noticeEnrollForm";
		
	}
	
	
	// 관리자 글 등록
	@PostMapping("/insert")
	public String noticeEnroll(Notice n , RedirectAttributes rttr) {
	    noticeService.insertNotice(n);
		rttr.addFlashAttribute("insertNotice", n.getNoticeNo());
		return "redirect:/notice/list";
	}
	
	// 글 삭제
	@GetMapping("/delete")
	public String noticeDelete(@RequestParam(value="noticeNo", required=false, defaultValue="0") int noticeNo) {
		
		noticeService.deleteNotice(noticeNo);
		
		return "redirect:/notice/list";
	}
	
	// 글 수정 폼
	@GetMapping("/update")
	public String updateForm( Model model,
		      					@RequestParam(value="noticeNo",required=false, defaultValue="0") int noticeNo){
		
		model.addAttribute("notice",noticeService.selectNoticeDetail(noticeNo));
		return "admin/noticeUpdateForm";
	}
	
	// 글 수정
	@PostMapping("/update")
	public String noticeUpdatePost(Notice n, RedirectAttributes rttr) {
		noticeService.updateNotice(n);
		rttr.addFlashAttribute("updateNotice", n.getNoticeNo());
		return "redirect:/notice/list";
	}
	
	// 채팅
		@GetMapping("/chatList")
		public String chatList(Model model,
							 	@RequestParam(value="cpage", defaultValue="1") int cp,
							 	@RequestParam Map<String, Object> paramMap
							 	) {
			System.out.println(paramMap);
			Map<String, Object> map = new HashMap();

			if(paramMap.get("condition")==null) {
				noticeService.selectChatSearchList(cp, map);
			}else {
				// 검색요청을 한 경우 
				// 검색조건을 추가한 상태로 게시글 셀렉트 
				paramMap.put("currentPage", cp);
				noticeService.selectChatSearchList(paramMap, map);
			}
			
			//noticeService.selectNoticeList(cp,map);
			model.addAttribute("selectChatSearchList",map);
			return "admin/chatRoomList";
		}
		
		 @GetMapping("/businessCount")
		 @ResponseBody
		  public int getBusinessCount() {
		    int count = noticeService.getBusinessCount();
		    System.out.println(count);
		    return count;
		  }
		 
		 @GetMapping("/reviewCount")
		 @ResponseBody
		  public int getreviewCount() {
		    int count = noticeService.getReviewCount();
		    System.out.println(count);
		    return count;
		  }
		 
		 @GetMapping("/selectBusinessInfo")
		    @ResponseBody
		    public List<Business> getBusinessInfo() {
		        return noticeService.getBusinessInfo();
		    }
		 
		 
		 @GetMapping("/selectReviewDeclariation")
		    @ResponseBody
		    public List<Review> selectReviewDeclariation() {
		        return noticeService.selectReviewDeclariation();
		    }
}
