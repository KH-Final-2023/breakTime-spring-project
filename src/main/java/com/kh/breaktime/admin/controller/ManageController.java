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

import com.kh.breaktime.admin.model.service.ManageService;
import com.kh.breaktime.business.model.vo.Business;


@Controller
@RequestMapping("/manage")
public class ManageController {

	@Autowired
	private ManageService manageService;
	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);
	
	@GetMapping("/list")
	public String selectManageList(Model model,
						 	@RequestParam(value="cpage", defaultValue="1") int cp
						 	) {
		Map<String, Object> map = new HashMap();
		manageService.selectManageList(cp,map);
		model.addAttribute("selectManageList", map);
		
		return "admin/manage";
	}
	
	@GetMapping("/delete")
	public String manageCancel(@RequestParam(value="buId", required=false, defaultValue="0") String buId) {
		
		manageService.manageCancel(buId);
		
		return "redirect:/manage/list";
	}
	
	@PostMapping("/update")
	public String manageUpdate(Business b) {
		manageService.manageUpdate(b);
		return "redirect:/manage/list";
	}
}
