package com.kh.breaktime.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.common.model.vo.PageInfo;
import com.kh.breaktime.review.model.vo.Review;

@Repository
public class ReportDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectReportListCount() {
		return sqlSession.selectOne("notice-mapper.selectReportListCount");
	}
	
	public ArrayList<Review> selectReportList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("notice-mapper.selectReportList", "", rowBounds);
	}
	
	public int reportKeep(Review r) {
		return sqlSession.update("notice-mapper.reportKeep", r);
	}
	
	public int reportCancel(Review r) {
		return sqlSession.delete("notice-mapper.reportCancel",r);
	}
	
}
