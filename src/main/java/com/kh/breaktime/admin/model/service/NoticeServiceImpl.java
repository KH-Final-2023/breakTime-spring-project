package com.kh.breaktime.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.admin.model.dao.NoticeDao;
import com.kh.breaktime.admin.model.vo.Notice;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.common.model.vo.PageInfo;
import com.kh.breaktime.common.template.Pagination;
import com.kh.breaktime.review.model.vo.Review;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;

	@Autowired
	private Pagination pagination;

	public void selectNoticeList(int cp, Map<String, Object> map) {
		
		int listCount = noticeDao.selectNoticeListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);


		map.put("pi", pi);
		map.put("list", noticeDao.selectNoticeList(pi));
	}


	// 게시글 상세조회 구현 서비스
	public Notice selectNoticeDetail(int noticeNo) {

		return noticeDao.selectNoticeDetail(noticeNo);
	}
	
	// 검색 게시글 목록 조회 서비스 구현 
	public void selectNoticeList(Map<String, Object> paramMap, Map<String, Object> map) {
		int listCount = noticeDao.selectNoticeListCount(paramMap);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = pagination.getPageInfo(listCount, (int)paramMap.get("currentPage"), pageLimit, boardLimit);

		ArrayList<Notice> list = noticeDao.selectNoticeList(pi, paramMap);

		map.put("pi", pi);
//		map.put("list", noticeDao.selectNoticeList(pi));
		map.put("list", list);
	}
	
	public int insertNotice(Notice n) {
	
		return noticeDao.insertNotice(n);
	}
	
	public void updateNotice(Notice n) {
		
		noticeDao.updateNotice(n);
	}
	
	public int deleteNotice(int noticeNo) {
		return noticeDao.deleteNotice(noticeNo);
	}
	
	public int updateReadCount(int noticeNo) {
		return noticeDao.updateReadCount(noticeNo);
	}
	
	// 채팅
	// 검색 게시글 목록 조회 서비스 구현
	public void selectChatSearchList(Map<String, Object> paramMap, Map<String, Object> map) {
		int listCount = noticeDao.selectChatSearchListCount(paramMap);
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = pagination.getPageInfo(listCount, (int) paramMap.get("currentPage"), pageLimit, boardLimit);

		ArrayList<Notice> list = noticeDao.selectChatSearchList(pi, paramMap);

		map.put("pi", pi);
		map.put("list", list);
	}

	@Override
	public void selectChatSearchList(int cp, Map<String, Object> map) {
		int listCount = noticeDao.selectChatSearchListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);

		map.put("pi", pi);
		map.put("list", noticeDao.selectChatSearchList(pi));

	}
	

	  @Override
	  public int getBusinessCount() {
	    return noticeDao.getBusinessCount();
	  }
	  

	  @Override
	  public int getReviewCount() {
	    return noticeDao.getReviewCount();
	  }
	  
	  @Override
	    public List<Business> getBusinessInfo() {
	        return noticeDao.getBusinessInfo();
	    }

	  @Override
	    public List<Review>selectReviewDeclariation() {
	        return noticeDao.selectReviewDeclariation();
	    }
}
