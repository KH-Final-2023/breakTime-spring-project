//package com.kh.breaktime.admin.controller;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.kh.breaktime.admin.model.service.ApprovalService;
//import com.kh.breaktime.admin.model.service.ReportService;
//
//
//@Controller
//@RequestMapping("/approval")
//public class ApprovalController {
//	private static Map<Object, Object> controllerMap = new HashMap<Object, Object>();
//	HttpServletRequest request;
//	Model model;
//	HttpSession session;
//
//	private final ApprovalService approvalService;
//	private final ReportService reportService;
//	
//	@Autowired
//	public ApprovalController(ApprovalService approvalService, ReportService reportService) {
//		this.approvalService = approvalService;
//		this.reportService = reportService;
//	}
//	
//	@ModelAttribute
//	void init(HttpServletRequest request, Model model) {
//		this.request = request;
//		this.model = model;
//		this.session = request.getSession();
//	}
//	
//	@GetMapping("/list")
//	public String notice(Model model, @RequestParam(value = "cpage", required = false, defaultValue = "1") int cp) {
//		Map<String, Object> map = new HashMap();
//		approvalService.selectApprovalList(cp, map);
//		model.addAttribute("selectApprovalList", map);
//		return "admin/approval";
//	}
//	
//	@ResponseBody
//	@PostMapping("/approvalAccept")
//	public boolean approval(String bu_email) {
//		try {
//			int result = approvalService.appovalAccept(bu_email);
//			if(result != 0) {
//				return false;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return true;
//	}
//		
//	@ResponseBody
//	@PostMapping("/approvalCancel")
//	public boolean cancel(String bu_email) {
//		try {
//			int result = approvalService.approvalCancel(bu_email);
//			if(result != 0) {
//				return false;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return true;
//	}
//	
//	
//	
//	
//	
//	
//	
//}
