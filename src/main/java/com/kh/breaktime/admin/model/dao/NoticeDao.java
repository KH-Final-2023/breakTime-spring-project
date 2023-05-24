package com.kh.breaktime.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.admin.model.vo.Notice;
import com.kh.breaktime.common.model.vo.PageInfo;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectNoticeListCount() {
		return sqlSession.selectOne("notice-mapper.selectNoticeListCount");
	}
	
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlSession.selectList("notice-mapper.selectNoticeList", "", rowBounds);
	}
	
	
	public Notice selectNoticeDetail(int noticeNo) {
		return sqlSession.selectOne("notice-mapper.selectNoticeDetail", noticeNo);
	}
	
	public int insertNotice(Notice n) {
		return sqlSession.insert("notice-mapper.insertNotice");
	}
	
	public int updateNotice(Notice n) {
		return sqlSession.update("notice-mapper.updateNotice", n);
	}
	
	
}
