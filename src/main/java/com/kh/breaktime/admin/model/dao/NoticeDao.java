package com.kh.breaktime.admin.model.dao;

import java.util.ArrayList;
import java.util.Map;

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
	
	public int selectNoticeListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("notice-mapper.searchNoticeListCount", paramMap);
		
	}
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlSession.selectList("notice-mapper.selectNoticeList", "", rowBounds);
	}
	
	public ArrayList<Notice> selectNoticeList(PageInfo pi,Map<String, Object> paramMap){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlSession.selectList("notice-mapper.searchNoticeList", paramMap, rowBounds);
	}
	
	
	public Notice selectNoticeDetail(int noticeNo) {
		return sqlSession.selectOne("notice-mapper.selectNoticeDetail", noticeNo);
	}
	
	public int insertNotice(Notice n) {
		return sqlSession.insert("notice-mapper.insertNotice", n);
	}
	
	public int updateNotice(Notice n) {
		return sqlSession.update("notice-mapper.updateNotice", n);
	}
	
	public int deleteNotice(int noticeNo) {
		return sqlSession.delete("notice-mapper.deleteNotice",noticeNo);
	}
	
	public int updateReadCount(int noticeNo) {
		return sqlSession.update("notice-mapper.updateReadCount", noticeNo);
	}
}
