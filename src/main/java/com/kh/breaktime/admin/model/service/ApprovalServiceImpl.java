package com.kh.breaktime.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.admin.model.dao.ApprovalDao;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.common.model.vo.PageInfo;
import com.kh.breaktime.common.template.Pagination;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	
	@Autowired
	private ApprovalDao approvalDao;

	@Autowired
	private Pagination pagination;

	public void selectApprovalList(int cp, Map<String, Object> map) {
		
		int listCount = approvalDao.selectApprovalListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);


		map.put("pi", pi);
		map.put("list", approvalDao.selectApprovalList(pi));
	}

	
	public int approvalAccept(Business b) {
		
		return approvalDao.approvalAccept(b);
	}
	
	public int approvalCancel(int buNo) {
		return approvalDao.approvalCancel(buNo);
	}
	
}
