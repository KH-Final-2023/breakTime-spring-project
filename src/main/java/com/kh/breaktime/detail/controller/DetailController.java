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
	public String selectDetailList(@PathVariable("category") String category,
			@RequestParam(value = "area", required = false) String area, Model model) {
		Map<String, Object> map = new HashMap<>();

		detailService.selectDetailList(category, area, map);
		
		model.addAttribute("map", map);

		return "detail/detail";
	}

	@GetMapping("/filter/{category}")
	public String filterListSubmit(@PathVariable("category") String category,
			@RequestParam(value = "prices", required = false) List<String> prices,
			@RequestParam(value = "reserveOptions", required = false) List<String> reserves,
			@RequestParam(value = "houseOptions", required = false) List<String> options,
			@RequestParam(value = "guests", required = false) Integer guests,
			@RequestParam(value = "area", required = false) String area,
			@RequestParam(value = "date_in", required = false) String date_in,
			@RequestParam(value = "date_out", required = false) String date_out, Model model) {
		Map<String, Object> map = new HashMap<>();

		detailService.filterListSubmit(category, prices, reserves, options, guests, area, date_in, date_out, map);

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

  
  @GetMapping("/search")
	public String detailList(@RequestParam(value="category" , required=false) String category, 
			Model model,
			@RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = new HashMap();
			paramMap.put("category", category);
			detailService.searchDetailList(paramMap, map);
			map.put("condition", paramMap.get("condition"));
			map.put("keyword", "%"+paramMap.get("keyword")+"%");
		
		String sUrl = "";
		if(paramMap.get("condition") != null && paramMap.get("keyword")!=null) {
			sUrl = "&condition="+paramMap.get("condition")+"&keyword="+paramMap.get("keyword");
		}
		
		model.addAttribute("sUrl",sUrl);
		model.addAttribute("map", map);


		return "/detail/detail";
	}
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
}
