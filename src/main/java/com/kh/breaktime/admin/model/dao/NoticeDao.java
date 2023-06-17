package com.kh.breaktime.admin.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.admin.model.vo.Notice;
import com.kh.breaktime.business.model.vo.Business;
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
	
	// 채팅
	public int selectChatSearchListCount() {
		return sqlSession.selectOne("notice-mapper.selectChatSearchListCount");
	}

	public int selectChatSearchListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("notice-mapper.selectChatSearchListCount", paramMap);

	}

	public ArrayList<Notice> selectChatSearchList(PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("notice-mapper.selectChatSearchList", "", rowBounds);
	}

	public ArrayList<Notice> selectChatSearchList(PageInfo pi, Map<String, Object> paramMap) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("notice-mapper.selectChatSearchList", paramMap, rowBounds);
	}
	
	  
	  public int getBusinessCount() {
	    return sqlSession.selectOne("notice-mapper.getBusinessCount");
	  }
	  
	  public int getReviewCount() {
		    return sqlSession.selectOne("notice-mapper.getReviewCount");
		  }
	  

	    public  List<Business> getBusinessInfo() {
	        return sqlSession.selectList("notice-mapper.getBusinessInfo");
	    }
}
