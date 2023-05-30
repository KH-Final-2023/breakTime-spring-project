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

	@GetMapping("")
	public String detailList(@RequestParam("category") String category, 
			Model model,
			@RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = new HashMap();
		// 데이터 가져오기 전에 속성 초기화
		map.put("address", null);
		map.put("areaNo", null);
		map.put("buCategory", null);
		map.put("mainImg", null);
		map.put("buTel", null);
		map.put("buTitle", null);
		
		if (paramMap.get("condition") == null) {
			detailService.selectDetailList(category, map);
		} else {
			// 검색요청을 한 경우
			// 검색조건을 추가한 상태로 게시글 셀렉트?
			paramMap.put("category", category);
			detailService.selectDetailList(paramMap, map);
		}

		model.addAttribute("map", map);

		return "/detail/detail";
	}
}
