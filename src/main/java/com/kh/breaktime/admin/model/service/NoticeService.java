package com.kh.breaktime.admin.model.service;

import java.util.Map;

import com.kh.breaktime.admin.model.vo.Notice;

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
}
