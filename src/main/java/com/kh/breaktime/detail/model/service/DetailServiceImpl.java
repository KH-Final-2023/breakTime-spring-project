package com.kh.breaktime.detail.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.detail.model.dao.DetailDAO;
import com.kh.breaktime.detail.model.vo.CategoryCode;
import com.kh.breaktime.detail.model.vo.Detail;

@Service
public class DetailServiceImpl implements DetailService {

	@Autowired
	private DetailDAO detailDao;
	
	@Autowired
    private SqlSession sqlSession;

	public ArrayList<CategoryCode> selectCategoryCodeList() {
		return detailDao.selectCategoryCodeList();
	}

	public void selectDetailList(String category, Map<String, Object> map) {
		ArrayList<Detail> list = detailDao.selectDetailList(category);
		map.put("list", list);
	}
	
    @Override
    public List<Map<String, Object>> selectDetailList(String category, List<List<Integer>> priceRanges) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("category", category);
        paramMap.put("priceRanges", priceRanges);
        return sqlSession.selectList("com.example.mapper.selectDetailListByPrice", paramMap);
    }

	public void getFilteredData(Map<String, Object> paramMap, Map<String, Object> map) {
		ArrayList<Detail> list = detailDao.getFilteredData(paramMap);
	}
	
	public void searchDetailList(Map<String, Object> paramMap, Map<String, Object> map) {
		ArrayList<Detail> list = detailDao.searchDetailList(paramMap);
		
		map.put("list", list);
	}

}
