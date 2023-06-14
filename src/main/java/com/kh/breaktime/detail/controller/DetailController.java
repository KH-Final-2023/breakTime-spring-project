package com.kh.breaktime.detail.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.breaktime.detail.model.service.DetailService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/list")
public class DetailController {

	@Autowired
	private DetailService detailService;

	private static final Logger logger = LoggerFactory.getLogger(DetailController.class);

	@GetMapping("/detail/{category}")
	public String filterListSubmit(@PathVariable("category") String category,
			@RequestParam(value = "prices", required = false) List<String> prices,
			@RequestParam(value = "reserveOptions", required = false) List<String> reserves,
			@RequestParam(value = "houseOptions", required = false) List<String> options,
			@RequestParam(value = "guests", required = false) Integer guests, 
			@RequestParam(value = "area", required = false) String area,
			@RequestParam(value = "inOut", required = false) List<String> inOut, Model model) {
		Map<String, Object> map = new HashMap<>();

		detailService.selectDetailList(category, prices, reserves, options, guests, area, inOut, map);

		model.addAttribute("map", map);

		return "detail/detail";
	}
  
  @GetMapping("/marea/{areaNo}")
	public String selectAreaList(@PathVariable("areaNo") String areaNo, Model model) {
	    Map<String, Object> map = new HashMap<>();

	    detailService.selectAreaList(areaNo, map);

	    model.addAttribute("map", map);

	    return "detail/detail";
	}
	
	

}
