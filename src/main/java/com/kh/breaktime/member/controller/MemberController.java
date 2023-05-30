package com.kh.breaktime.member.controller;

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

import com.kh.breaktime.member.model.service.MemberService;
import com.kh.breaktime.member.model.vo.Member;

@Controller
@RequestMapping("/member")
@SessionAttributes({ "loginUser" })
public class MemberController {

	private MemberService memberService;

	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;

	}

	public MemberController() {

	}

	@Autowired
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/login") // /spring/member/insert
	public String loginForm() {

		return "member/memberLoginForm";
	}
	
	@PostMapping("/memberLogin")
	public String loginMember(Model model, Member m, HttpSession session, RedirectAttributes ra,
			HttpServletResponse resp, HttpServletRequest req,
			@RequestParam(value = "saveId", required = false) String saveId) {

		//암호화 전 loginUser처리
//		Member loginUser = memberService.loginMember(m);
//		if (loginUser == null) { // 실패
//			mv.addObject("errorMsg", "로그인 실패");
//			mv.setViewName("common/errorPage");
//		} else { // 성공
//			session.setAttribute("loginUser", loginUser);
//			mv.setViewName("redirect:/"); // 메인페이지로 url재요청 == response.sendRedirect(request.getContextPath());
//		}
		//암호화 후
		/*
		 * 기존에 평문이 db에 등록되어 있었기 때문에 아이디랑 비밀번호를 같이 입력받아 조회하는 형태로 작업하였음
		 * 암호화 작업을 하면 입력받은 비밀번호는 평문이지만 db에 등록된 비밀번호는 암호문이기때문에 비교시 무조건 다르게 나옴
		 * 아이디로 먼저 회원정보 조회 후 회원이 있으면 비밀번호 암호문 비교 메서드를 이용해서 일치하는지 확인 
		 */
		
		Member loginUser = memberService.loginMember(m);
		// loginUser : 아이디 + 비밀번호로 조회한 회원정보 -------> 아이디로만 조회
		// loginUser안의 userPwd : 암호화된 비밀번호
		// m안의 userPwd은 : 암호화 되지 않은 평문 비밀번호
		
		// BCryptPasswordEncoder객체의 메서드중 matches사용
		// matches(평문, 암호문)을 작성하면 내부적으로 복호화 작업이 이루어져서 일치여부를 boolean값으로 반환(true 일치, false불일치)
		
		if(loginUser != null) {
//			session.setAttribute("loginUser", loginUser);
			model.addAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인 성공");
			System.out.println(loginUser);
			
			//로그인 성공시 아이디값을 저장하고 있는 쿠키 생성(유효시간 1년)
			Cookie cookie = new Cookie("saveId", loginUser.getUserId());
			if(saveId != null) { // 아이디 저장이 체크됐을때
				cookie.setMaxAge(60*60*24*365); // 1년

			}else { // 아이디 저장 체크하지 않았을 때
				cookie.setMaxAge(0); // 바로 소멸				
			}
			
			//쿠키를 응답시 클라이언트에 전달
			resp.addCookie(cookie);
			
		}else { // 로그인실패
			ra.addFlashAttribute("errorMsg","로그인 실패");
			// redirect시 잠깐 데이터를 sessionScope에 보관 -> redirect완료 후 다시 requestScope로 이관
			// : redirect(페이지 재요청) 시에도 request scope로 세팅된 데이터가 유지될 수 있도록 하는 방법을 spring에서 제공해줌.
			// RedirectAttributes 객체(컨트롤러의 매개변수로 작성하면 Argument Resolver가 넣어줌)
			// redirect의 특징 -> request에 데이터를 저장할 수 없다.
		}
		
		if(loginUser.getAuthority() == 0 ) {
			return "redirect:/notice/list";
		} else {
			return "redirect:/";
	    }
	}
	
	@GetMapping("/insert") // /spring/member/insert
	public String enrollForm() {

		return "member/memberEnrollForm";
	}

	@PostMapping("/insert")
	public String insertMember(Member m, HttpSession session, Model model) {

		int result = memberService.insertMember(m);

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
	
	
}
