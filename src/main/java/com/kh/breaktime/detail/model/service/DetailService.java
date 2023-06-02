package com.kh.breaktime.detail.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.breaktime.detail.model.vo.CategoryCode;

public interface DetailService {
	
	public ArrayList<CategoryCode> selectCategoryCodeList();
	
	public void selectDetailList(String category, Map<String, Object> map);
	
	public List<Map<String, Object>> selectDetailList(String category, List<List<Integer>> priceRanges);
	
	public void getFilteredData(Map<String, Object> paramMap, Map<String, Object> map);

	public void searchDetailList(Map<String, Object> paramMap, Map<String, Object> map);


}
