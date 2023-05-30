package com.kh.breaktime.decide.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.breaktime.decide.model.service.DecideService;

@Controller
@RequestMapping("/decide")
public class DecideController {
	
	private DecideService decideService;
	
	@Autowired
	public void setDecideService(DecideService decideService) {
		this.decideService = decideService;
	}
	
	@GetMapping("/demain") 
	public String decideMain() {

		return "decide/decideMain";
	}
	
	@GetMapping("/deroom") 
	public String decideRoomSelect() {

		return "decide/decideRoomSelect";
	}
	
	@GetMapping("/demap") 
	public String decideMainMap() {

		return "decide/decideMainMap";
	}
	
	@GetMapping("/dereview") 
	public String decideReview() {

		return "decide/decideReview";
	}
	
	@GetMapping("/dedate") 
	public String decideDateSelect() {

		return "decide/decideDateSelect";
	}
	
	@GetMapping("/debasket") 
	public String decideBasket() {

		return "decide/decideBasket";
	}

}
