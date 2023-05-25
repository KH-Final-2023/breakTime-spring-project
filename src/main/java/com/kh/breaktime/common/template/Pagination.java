package com.kh.breaktime.common.template;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kh.breaktime.common.model.vo.PageInfo;

@Component
public class Pagination {
	
	@Autowired
	private PageInfo pageinfo;
	
	public PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage -1) / pageLimit*pageLimit +1;
		int endPage = startPage+pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		pageinfo.setBoardLimit(boardLimit);
		pageinfo.setCurrentPage(currentPage);
		pageinfo.setEndPage(endPage);
		pageinfo.setListCount(listCount);
		pageinfo.setMaxPage(maxPage);
		pageinfo.setPageLimit(pageLimit);
		pageinfo.setStartPage(startPage);
		
		return pageinfo;
	}
}
