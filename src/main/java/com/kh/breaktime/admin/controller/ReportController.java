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

import com.kh.breaktime.admin.model.service.ReportService;
import com.kh.breaktime.review.model.vo.Review;


@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportService reportService;
	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);
	
	@GetMapping("/list")
	public String selectReportList(Model model,
						 	@RequestParam(value="cpage", defaultValue="1") int cp
						 	) {
		Map<String, Object> map = new HashMap();
		reportService.selectReportList(cp,map);
		model.addAttribute("selectReportList", map);
		
		return "admin/report";
	}
	
	@GetMapping("/delete")
	public String reportCancel(@RequestParam(value="reviewNo", required=false, defaultValue="0") int reviewNo) {
		
		reportService.reportCancel(reviewNo);
		return "redirect:/report/list";
	}
	
	@GetMapping("/update")
	public String reportKeep(Review r, RedirectAttributes rttr) {
		reportService.reportKeep(r);
		rttr.addFlashAttribute("reportKeep", r.getReviewNo());
		return "redirect:/report/list";
	}
}
