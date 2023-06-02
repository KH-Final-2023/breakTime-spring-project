package com.kh.breaktime.business.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.breaktime.booking.model.vo.Booking;
import com.kh.breaktime.business.model.service.BusinessService;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.review.model.vo.Review;
import com.kh.breaktime.room.model.vo.Room;
import com.kh.breaktime.room.model.vo.RoomImg;

@Controller
@RequestMapping("/business")
@SessionAttributes({ "loginBusiness" })
public class BusinessController {

	private BusinessService businessService;

	@Autowired
	public BusinessController(BusinessService businessService) {
		this.businessService = businessService;

	}

	public BusinessController() {

	}

	@Autowired
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}

	@GetMapping("/login") // /spring/member/insert
	public String loginForm() {

		return "business/businessLoginForm";
	}

	@PostMapping("/buLogin")
	public String loginMember(Model model, Business b, HttpSession session, RedirectAttributes ra,
			HttpServletResponse resp, HttpServletRequest req,
			@RequestParam(value = "saveId", required = false) String saveId) {

		// 암호화 전 loginUser처리
//		Member loginUser = memberService.loginMember(m);
//		if (loginUser == null) { // 실패
//			mv.addObject("errorMsg", "로그인 실패");
//			mv.setViewName("common/errorPage");
//		} else { // 성공
//			session.setAttribute("loginUser", loginUser);
//			mv.setViewName("redirect:/"); // 메인페이지로 url재요청 == response.sendRedirect(request.getContextPath());
//		}
		// 암호화 후
		/*
		 * 기존에 평문이 db에 등록되어 있었기 때문에 아이디랑 비밀번호를 같이 입력받아 조회하는 형태로 작업하였음 암호화 작업을 하면 입력받은
		 * 비밀번호는 평문이지만 db에 등록된 비밀번호는 암호문이기때문에 비교시 무조건 다르게 나옴 아이디로 먼저 회원정보 조회 후 회원이 있으면
		 * 비밀번호 암호문 비교 메서드를 이용해서 일치하는지 확인
		 */

		Business loginBusiness = businessService.loginBusiness(b);

		// loginUser : 아이디 + 비밀번호로 조회한 회원정보 -------> 아이디로만 조회
		// loginUser안의 userPwd : 암호화된 비밀번호
		// m안의 userPwd은 : 암호화 되지 않은 평문 비밀번호

		// BCryptPasswordEncoder객체의 메서드중 matches사용
		// matches(평문, 암호문)을 작성하면 내부적으로 복호화 작업이 이루어져서 일치여부를 boolean값으로 반환(true 일치,
		// false불일치)

		if (loginBusiness != null) {
			// session.setAttribute("loginUser", loginUser);
			model.addAttribute("loginBusiness", loginBusiness);
			session.setAttribute("alertMsg", "로그인 성공");
			System.out.println(loginBusiness);

			// 로그인 성공시 아이디값을 저장하고 있는 쿠키 생성(유효시간 1년)
			Cookie cookie = new Cookie("saveId", loginBusiness.getBuId());

			if (saveId != null) { // 아이디 저장이 체크됐을때
				cookie.setMaxAge(60 * 60 * 24 * 365); // 1년

			} else { // 아이디 저장 체크하지 않았을 때
				cookie.setMaxAge(0); // 바로 소멸
			}

			resp.addCookie(cookie);

			// 방 이미지와 방 정보 페이지로 이동
			List<Room> roomList = businessService.getRoomsByBuId(loginBusiness.getBuId());

			List<RoomImg> roomImgList = new ArrayList<RoomImg>();
			for (int i = 0; i < roomList.size(); i++) {

				RoomImg roomImg = businessService.getRoomImagesByBuId(roomList.get(i).getRoomNo());
				roomImgList.add(roomImg);
			}

			model.addAttribute("roomList", roomList);
			model.addAttribute("roomImgList", roomImgList);

			return "businessRoom/buRoomList";
		} else { // 로그인 실패
			ra.addFlashAttribute("errorMsg", "로그인 실패");
			return "redirect:/"; // 로그인 실패 시 메인페이지로 이동하도록 수정
		}

	}

	@GetMapping("/insert") // /spring/member/insert
	public String enrollForm() {

		return "business/businessEnrollForm";
	}

	@PostMapping("/insert")
	public String insertBusiness(Business b, HttpSession session, Model model) {

		int result = businessService.insertBusiness(b);

		String url = "";
		if (result > 0) { // 성공시 - 메인페이지로
			session.setAttribute("alertMsg", "회원가입");
			url = "redirect:/";
		} else { // 실패 - 에러페이지
			model.addAttribute("errorMsg", "회원가입 실패");
			url = "common/errorPage";
		}

		return url;
	}

	@GetMapping("/reservation")
	public String buReservation(Model model, HttpSession session) {
		// 로그인한 사업자의 ID를 세션에서 가져옴
		Business loginBusiness = (Business) session.getAttribute("loginBusiness");
		String businessId = loginBusiness.getBuId();

		List<Booking> bookingList = businessService.getBookingsByBusinessId(businessId);
		model.addAttribute("bookingList", bookingList);
		System.out.println(bookingList);
		System.out.println(businessId);
		return "businessRoom/buReservation";
	}

	@GetMapping("/review")
	public String getBusinessReviews(Model model, HttpSession session) {
		Business loginBusiness = (Business) session.getAttribute("loginBusiness");
		if (loginBusiness != null) {
			String businessId = loginBusiness.getBuId();
			List<Review> businessReviews = businessService.getReviewsForBusiness(businessId);
			model.addAttribute("businessId", businessId);
			model.addAttribute("businessReviews", businessReviews);
			System.out.println(businessId);
			System.out.println(businessReviews);
			return "businessRoom/buReview";
		} else {
			// 로그인되지 않은 경우 처리
			return "redirect:/login"; // 로그인 페이지로 리다이렉트 또는 적절한 처리를 해주세요.
		}
	}

}
