package com.kh.breaktime.admin.model.service;

import java.util.Map;

import com.kh.breaktime.business.model.vo.Business;

public interface ManageService {
	
	public void selectManageList(int cp, Map<String, Object> map);
	
	public int manageUpdate(Business b); 
	
	public int manageCancel(Business b);
	
}
