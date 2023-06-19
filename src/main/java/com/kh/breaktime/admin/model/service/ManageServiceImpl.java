package com.kh.breaktime.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.admin.model.dao.ManageDao;
import com.kh.breaktime.admin.model.vo.Notice;
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
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);


		map.put("pi", pi);
		map.put("list", manageDao.selectManageList(pi));
	}
	
		public void selectManageList(Map<String, Object> paramMap, Map<String, Object> map) {
			int listCount = manageDao.selectManageListCount(paramMap);
			int pageLimit = 10;
			int boardLimit = 10;
			PageInfo pi = pagination.getPageInfo(listCount, (int)paramMap.get("currentPage"), pageLimit, boardLimit);

			ArrayList<Business> list = manageDao.selectManageList(pi, paramMap);

			map.put("pi", pi);
			map.put("list", list);
		}

	
	public int manageUpdate(Business b) {
		
		return manageDao.manageUpdate(b);
	}
	
	public int manageCancel(int buNo) {
		return manageDao.manageCancel(buNo);
	}
	
}
