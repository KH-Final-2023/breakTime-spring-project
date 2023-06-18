package com.kh.breaktime.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.breaktime.admin.model.vo.Notice;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.review.model.vo.Review;

public interface NoticeService {
	
	public void selectNoticeList(int cp, Map<String, Object> map);
	
	public void selectNoticeList(Map<String,Object> paramMap, Map<String, Object> map);
	
	public Notice selectNoticeDetail(int noticeNo);
	
	public int insertNotice(Notice n); 

	public void updateNotice(Notice n); 
	
	public int deleteNotice(int noticeNo);
	
	public int updateReadCount(int noticeNo);
	
	//채팅
	public void selectChatSearchList(int cp, Map<String, Object> map);
	
	public void selectChatSearchList(Map<String,Object> paramMap, Map<String, Object> map);
	
	public int getBusinessCount();
	
	public int getReviewCount();
	
	public List<Business> getBusinessInfo();
	
	public List<Review> selectReviewDeclariation();

}
