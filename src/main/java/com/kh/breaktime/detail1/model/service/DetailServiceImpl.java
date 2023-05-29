package com.kh.breaktime.detail1.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.detail1.model.dao.DetailDAO;
import com.kh.breaktime.detail1.model.vo.CategoryCode;
import com.kh.breaktime.detail1.model.vo.Detail;

@Service
public class DetailServiceImpl implements DetailService{
	
	@Autowired
	private DetailDAO detailDao;
	
	public ArrayList<CategoryCode> selectCategoryCodeList(){
		return detailDao.selectCategoryCodeList();
	}
	
	public void selectDetailList(String category, Map<String, Object> map) {
		ArrayList<Detail> list = detailDao.selectDetailList(category);
		
		map.put("list", list);
	}
	
	public void selectDetailList(Map<String, Object> paramMap, Map<String, Object> map) {
		ArrayList<Detail> list = detailDao.selectDetailList(paramMap);
		
		map.put("list", list);
	}
	

}
