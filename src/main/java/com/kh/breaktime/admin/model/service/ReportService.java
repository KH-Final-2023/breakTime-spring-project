package com.kh.breaktime.admin.model.service;

import java.util.Map;

import com.kh.breaktime.review.model.vo.Review;


public interface ReportService {
	
	public void selectReportList(int cp, Map<String, Object> map);
	
	public int reportKeep(Review r); 
	
	public int reportCancel(Review r);
	
}
