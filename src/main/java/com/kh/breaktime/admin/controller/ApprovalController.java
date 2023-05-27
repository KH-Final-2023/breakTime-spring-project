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

import com.kh.breaktime.admin.model.service.ApprovalService;
import com.kh.breaktime.admin.model.vo.Approval;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.member.model.vo.Member;


@Controller
@RequestMapping("/approval")
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;
	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);
	
	@GetMapping("/list")
	public String selectApprovalList(Model model,
						 	@RequestParam(value="cpage", defaultValue="1") int cp
						 	) {
		Map<String, Object> map = new HashMap();
		approvalService.selectApprovalList(cp,map);
		model.addAttribute("selectApprovalList", map);
		
		return "admin/approval";
	}
	
	@GetMapping("/delete")
	public String approvalCancel(@RequestParam(value="buId", required=false, defaultValue="0") String buId) {
		
		approvalService.approvalCancel(buId);
		
		return "redirect:/approval/list";
	}
	
	@PostMapping("/update")
	public String approvalAccept(Business b) {
		approvalService.approvalAccept(b);
		return "redirect:/approval/list";
	}
}
