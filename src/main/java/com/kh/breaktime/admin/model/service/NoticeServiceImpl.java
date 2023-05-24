package com.kh.breaktime.admin.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.admin.model.dao.NoticeDao;
import com.kh.breaktime.admin.model.vo.Notice;
import com.kh.breaktime.common.model.vo.PageInfo;
import com.kh.breaktime.common.template.Pagination;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;

	@Autowired
	private Pagination pagination;

	public void selectNoticeList(int cp, Map<String, Object> map) {
		
		int listCount = noticeDao.selectNoticeListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);


		map.put("pi", pi);
		map.put("list", noticeDao.selectNoticeList(pi));
	}


	// 게시글 상세조회 구현 서비스
	public Notice selectNoticeDetail(int noticeNo) {

		return noticeDao.selectNoticeDetail(noticeNo);
	}
	
//	public int insertNotice(Notice n) {
//		
//		return noticeDao.insertNotice(n);
//	}
	
public int insertNotice(Notice n) throws Exception{
		int noticeNo = noticeDao.insertNotice(n);
		
		
		return noticeNo;
	}
	
	public int updateNotice(Notice n) {
		
		return noticeDao.updateNotice(n);
	}

}
