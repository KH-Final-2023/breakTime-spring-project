package com.kh.breaktime.detail.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.detail.model.vo.AreaCode;
import com.kh.breaktime.detail.model.vo.CategoryCode;
import com.kh.breaktime.detail.model.vo.Detail;

@Repository
public class DetailDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<CategoryCode> selectCategoryCodeList() {
		return (ArrayList) sqlSession.selectList("detailMapper.selectCategoryCodeList");
	}

	public ArrayList<Detail> selectDetailList(String category) {
		return (ArrayList) sqlSession.selectList("detailMapper.selectDetailList", category);
	}

	public ArrayList<Detail> getFilteredData(String category, List<String> prices, List<String> reserves, List<String> options, String area, List<String> inOut, Integer guests) {
	    Map<String, Object> map = new HashMap<>();
	    map.put("category", category);
	    map.put("prices", prices);
	    map.put("reserves", reserves);
	    map.put("options", options);
	    map.put("guests", guests);
	    return (ArrayList) sqlSession.selectList("detailMapper.getFilteredData", map);
	}

	public ArrayList<Detail> searchDetailList(Map<String, Object> paramMap){
		
		return (ArrayList)sqlSession.selectList("detailMapper.searchDetailList", paramMap);
	}
	
	public ArrayList<AreaCode> selectAreaList(String areaNo) {
	      return (ArrayList) sqlSession.selectList("detailMapper.selectAreaList", areaNo);
	   }
}
