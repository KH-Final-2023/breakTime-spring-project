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
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.breaktime.detail.model.service.DetailService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/detail")
public class DetailController {

	@Autowired
	private DetailService detailService;

	private static final Logger logger = LoggerFactory.getLogger(DetailController.class);

	@GetMapping("/list/{category}")
	public String detailList(@RequestParam(value = "category", required = false) String category, Model model,
	        @RequestParam(value = "prices[]", required = false) List<String> prices) {

	    Map<String, Object> map = new HashMap<>();
	    
	    if (prices == null || prices.isEmpty()) {
	        detailService.selectDetailList(category, map);
	    } else {
	        // 옵션 선택을 한 경우
	    	List<List<Integer>> priceRanges = new ArrayList<>();
	    	for (String price : prices) {
	    	    System.out.println("price: " + price);
	    	    String[] range = price.split(",");
	    	    System.out.println("price: " + price); 
	    	    System.out.println("range 배열의 길이: " + range.length);
	    	    int minPrice = Integer.parseInt(range[0].trim());
	    	    int maxPrice = Integer.parseInt(range[1].trim());
	    	    priceRanges.add(Arrays.asList(minPrice, maxPrice));
	    	}

	        detailService.selectDetailList(category, priceRanges);
	    }
	    
	    model.addAttribute("map", map);
	    
	    return "/detail/detail";
	}


}
