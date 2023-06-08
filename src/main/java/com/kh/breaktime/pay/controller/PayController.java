package com.kh.breaktime.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.breaktime.business.model.service.BusinessService;
import com.kh.breaktime.pay.model.service.PayService;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	private PayService payService;
	
	
	@Autowired
	   public PayController(PayService payService) {
	      this.payService = payService;

	   }

	   public PayController() {

	   }

	   @Autowired
	   public void setPayService(PayService payService) {
	      this.payService = payService;
	   }
	
	@GetMapping("/payMain") 
	public String decideMain() {

		return "pay/pay";
	}
	
	

}
