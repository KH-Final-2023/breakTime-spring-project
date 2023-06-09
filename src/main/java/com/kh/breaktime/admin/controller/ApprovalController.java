package com.kh.breaktime.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.breaktime.admin.model.service.ApprovalService;
import com.kh.breaktime.business.model.vo.Business;


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
	public String approvalCancel(Business b, RedirectAttributes rttr) {
		
		approvalService.approvalCancel(b);
		rttr.addFlashAttribute("approvalCancel", b.getBuNo());
		return "redirect:/approval/list";
	}
	
	@GetMapping("/update")
	public String approvalAccept(Business b, RedirectAttributes rttr) {
		approvalService.approvalAccept(b);
		rttr.addFlashAttribute("approvalAccept", b.getBuNo());
		return "redirect:/approval/list";
	}
}
