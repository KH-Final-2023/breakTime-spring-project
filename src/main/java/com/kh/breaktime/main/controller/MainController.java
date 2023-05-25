package com.kh.breaktime.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 컨트롤러임을 명시 + servlet-context.xml에서 bean(스프링에서 관리하는 객체)으로 등록시켜주는 역할을함
public class MainController {
	
	@RequestMapping("/main")
	public String mainForward() {
		
		// index.jsp의 forward를 처리하는 함수가 mainForward
		// index.jsp에서 다시한번 main페이지로 포워딩 시켜줌
		return "main"; // 단순 문자열작성시 무조건 forward가 실행됨	 (WEB-INF/VIEWS + main + .jsp)
	}
	
	@GetMapping("loginType")
	public String loginTypeForward() {
		
		return "common/loginTypeForm";
	}
	
}
