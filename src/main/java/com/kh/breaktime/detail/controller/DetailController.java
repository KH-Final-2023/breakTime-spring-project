package com.kh.breaktime.detail.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.breaktime.detail.model.service.DetailService;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/detail")
public class DetailController {

	@Autowired
	private DetailService detailService;

	private static final Logger logger = LoggerFactory.getLogger(DetailController.class);

	@GetMapping("/search")
	public String detailList(@RequestParam(value="category" , required=false) String category, 
			Model model,
			@RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = new HashMap();
		
		if (paramMap.get("condition") == null) {
			detailService.selectDetailList(category, map);
		} else {
			// 검색요청을 한 경우
			// 검색조건을 추가한 상태로 게시글 셀렉트?
			paramMap.put("category", category);
			detailService.searchDetailList(paramMap, map);
			map.put("condition", paramMap.get("condition"));
			map.put("keyword", "%"+paramMap.get("keyword")+"%");
		}
		String sUrl = "";
		if(paramMap.get("condition") != null && paramMap.get("keyword")!=null) {
			sUrl = "&condition="+paramMap.get("condition")+"&keyword="+paramMap.get("keyword");
		}
		
		model.addAttribute("sUrl",sUrl);
		model.addAttribute("map", map);

		return "/detail/detail";
	}
	
	
	
	
	
}
