package com.kh.breaktime.admin.model.service;

import java.util.Map;

import com.kh.breaktime.admin.model.vo.Notice;

public interface NoticeService {
	
	public void selectNoticeList(int cp, Map<String, Object> map);
	
	public Notice selectNoticeDetail(int noticeNo);
	
	public int insertNotice(Notice n); //throws Exception;

	public int updateNotice(Notice n); //throws Exception;
	
	public int deleteNotice(int noticeNo);
}
