package com.kh.breaktime.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.admin.model.vo.Approval;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.common.model.vo.PageInfo;

@Repository
public class ApprovalDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectApprovalListCount() {
		return sqlSession.selectOne("notice-mapper.selectApprovalListCount");
	}
	
	public ArrayList<Business> selectApprovalList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("notice-mapper.selectApprovalList", "", rowBounds);
	}
	
	public int approvalAccept(Business b) {
		return sqlSession.update("notice-mapper.approvalAccept", b);
	}
	
	public int approvalCancel(String buId) {
		return sqlSession.delete("notice-mapper.approvalCancel",buId);
	}
	
}
