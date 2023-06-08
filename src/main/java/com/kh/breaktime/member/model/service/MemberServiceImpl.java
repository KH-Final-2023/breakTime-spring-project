package com.kh.breaktime.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.admin.model.vo.Notice;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.common.model.vo.PageInfo;
import com.kh.breaktime.common.template.Pagination;
import com.kh.breaktime.member.model.dao.MemberDao;
import com.kh.breaktime.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired // bean으로 등록된 객체중 같은 타입이 있을 경우 의존성(객체)를 주입해줌(DI)
	private MemberDao memberDao;
	
	@Autowired
	private Pagination pagination;
	
	@Override
	public Member loginMember(Member inputMember) {
		
		Member loginUser = memberDao.loginMember(inputMember);
		
		return loginUser;
	}

	@Override
	public int insertMember(Member inputMember) {

		int result = memberDao.insertMember(inputMember);

		return result;
	}
	
	// 충영
	// 검색 게시글 목록 조회 서비스 구현 
		public void selectSearchList(Map<String, Object> paramMap, Map<String, Object> map) {
			int listCount = memberDao.selectSearchListCount(paramMap);
			int pageLimit = 10;
			int boardLimit = 5;
			PageInfo pi = pagination.getPageInfo(listCount, (int)paramMap.get("currentPage"), pageLimit, boardLimit);

			ArrayList<Notice> list = memberDao.selectSearchList(pi, paramMap);

			map.put("pi", pi);
			map.put("list", list);
		}

		@Override
		public void selectSearchList(int cp, Map<String, Object> map) {
			int listCount = memberDao.selectSearchListCount();
			int pageLimit = 10;
			int boardLimit = 10;
			PageInfo pi = pagination.getPageInfo(listCount, cp, pageLimit, boardLimit);


			map.put("pi", pi);
			map.put("list", memberDao.selectSearchList(pi));
			
		}

}
