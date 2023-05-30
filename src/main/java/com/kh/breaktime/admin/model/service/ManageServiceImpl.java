package com.kh.breaktime.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.admin.model.dao.ManageDao;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.common.model.vo.PageInfo;
import com.kh.breaktime.common.template.Pagination;

@Service
public class ManageServiceImpl implements ManageService{
	
	@Autowired
	private ManageDao manageDao;

	@Autowired
	private Pagination pagination;

	public void selectManageList(int cp, Map<String, Object> map) {
		
		int listCount = manageDao.selectManageListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);


		map.put("pi", pi);
		map.put("list", manageDao.selectManageList(pi));
	}

	
	public int manageUpdate(Business b) {
		
		return manageDao.manageUpdate(b);
	}
	
	public int manageCancel(String buId) {
		return manageDao.manageCancel(buId);
	}
	
}
