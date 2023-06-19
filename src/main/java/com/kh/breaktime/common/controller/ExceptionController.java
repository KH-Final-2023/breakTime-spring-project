package com.kh.breaktime.common.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		e.printStackTrace();
		
		return "common/errorPage";
	}
	
}
