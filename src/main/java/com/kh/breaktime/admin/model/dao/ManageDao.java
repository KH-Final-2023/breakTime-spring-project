package com.kh.breaktime.admin.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.admin.model.vo.Notice;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.common.model.vo.PageInfo;

@Repository
public class ManageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectManageListCount() {
		return sqlSession.selectOne("notice-mapper.selectManageListCount");
	}
	
	public int selectManageListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("notice-mapper.searchManageListCount", paramMap);
	}
	
	public ArrayList<Business> selectManageList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("notice-mapper.selectManageList", "", rowBounds);
	}
	
	
	public ArrayList<Business> selectManageList(PageInfo pi,Map<String, Object> paramMap){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlSession.selectList("notice-mapper.searchManageList", paramMap, rowBounds);
	}
	
	public int manageUpdate(Business b) {
		return sqlSession.update("notice-mapper.manageUpdate", b);
	}
	
	public int manageCancel(int buNo) {
		return sqlSession.delete("notice-mapper.manageCancel",buNo);
	}
	
}
