package com.kh.breaktime.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.admin.model.dao.ReportDao;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.common.model.vo.PageInfo;
import com.kh.breaktime.common.template.Pagination;
import com.kh.breaktime.review.model.vo.Review;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportDao reportDao;

	@Autowired
	private Pagination pagination;

	public void selectReportList(int cp, Map<String, Object> map) {
		
		int listCount = reportDao.selectReportListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);


		map.put("pi", pi);
		map.put("list", reportDao.selectReportList(pi));
	}

	
	public int reportKeep(Review r) {
		
		return reportDao.reportKeep(r);
	}
	
	public int reportCancel(int reviewNo) {
		return reportDao.reportCancel(reviewNo);
	}
	
}
