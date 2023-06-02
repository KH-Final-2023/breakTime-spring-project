package com.kh.breaktime.detail.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	public ArrayList<Detail> selectDetailList(String category, List<List<Integer>> priceRanges) {
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("category", category);
	    paramMap.put("priceRanges", priceRanges);
	    List<Object> resultList = sqlSession.selectList("detailMapper.selectDetailList", paramMap);

	    ArrayList<Detail> detailList = new ArrayList<>();
	    for (Object result : resultList) {
	        Detail detail = (Detail) result;
	        detailList.add(detail);
	    }

	    return detailList;
	}



	public ArrayList<Detail> getFilteredData(Map<String, Object> paramMap) {

		return (ArrayList) sqlSession.selectList("detailMapper.getFilteredData", paramMap);
	}
	
	public ArrayList<Detail> searchDetailList(Map<String, Object> paramMap){
		
		return (ArrayList)sqlSession.selectList("detailMapper.searchDetailList", paramMap);
	}

}
