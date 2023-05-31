package com.kh.breaktime.business.model.dao;


import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.business.model.vo.Business;



@Repository
public class BusinessDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Business loginBusiness(Business inputBusiness) {

		return sqlSession.selectOne("businessMapper.loginBusiness", inputBusiness);
	}
	
	public int insertBusiness(Business inputBusiness) {
		
		return sqlSession.insert("businessMapper.insertBusiness", inputBusiness);
	}
	
}
