package com.kh.breaktime.detail.model.dao;

import java.util.ArrayList;
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
	
	public ArrayList<CategoryCode> selectCategoryCodeList(){
		return (ArrayList)sqlSession.selectList("detailMapper.selectCategoryCodeList");
	}

	public ArrayList<Detail> selectDetailList(String category) {

		return (ArrayList) sqlSession.selectList("detailMapper.selectDetailList", category);
	}
	
	public ArrayList<Detail> selectDetailList(Map<String, Object> paramMap){
		
		return (ArrayList)sqlSession.selectList("boardMapper.searchDetailList", paramMap);
	}

}
