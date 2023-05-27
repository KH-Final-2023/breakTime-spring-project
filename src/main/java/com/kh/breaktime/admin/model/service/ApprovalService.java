package com.kh.breaktime.admin.model.service;

import java.util.Map;

import com.kh.breaktime.admin.model.vo.Approval;
import com.kh.breaktime.business.model.vo.Business;

public interface ApprovalService {
	
	public void selectApprovalList(int cp, Map<String, Object> map);
	
	public int approvalAccept(Business b); 
	
	public int approvalCancel(String buId);
	
}
