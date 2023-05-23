package com.kh.breaktime.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

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
