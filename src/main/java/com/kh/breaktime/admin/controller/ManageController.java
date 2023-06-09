package com.kh.breaktime.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.breaktime.admin.model.service.ManageService;
import com.kh.breaktime.business.model.vo.Business;


@Controller
@RequestMapping("/manage")
public class ManageController {

	@Autowired
	private ManageService manageService;
	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
	@GetMapping("/list")
	public String selectManageList(Model model,
						 	@RequestParam(value="cpage", defaultValue="1") int cp,
						 	@RequestParam Map<String, Object> paramMap
						 	) {
		Map<String, Object> map = new HashMap();
		
		if(paramMap.get("condition")==null) {
		manageService.selectManageList(cp,map);
		}else {
			// 검색요청을 한 경우 
			// 검색조건을 추가한 상태로 게시글 셀렉트 
			paramMap.put("currentPage", cp);
			manageService.selectManageList(paramMap, map);
		}
		model.addAttribute("selectManageList", map);
		
		return "admin/manage";
	}
	
	@GetMapping("/delete")
	public String manageCancel(@RequestParam(value="buNo", required=false, defaultValue="0") int buNo) {
		
		manageService.manageCancel(buNo);
		return "redirect:/manage/list";
	}
	
	@PostMapping("/update")
	public String manageUpdate(Business b, RedirectAttributes rttr) {
		manageService.manageUpdate(b);
		rttr.addFlashAttribute("updateManage", b.getBuNo());
		return "redirect:/manage/list";
	}
}
