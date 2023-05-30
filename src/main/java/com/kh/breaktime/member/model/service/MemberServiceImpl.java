package com.kh.breaktime.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.member.model.dao.MemberDao;
import com.kh.breaktime.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired // bean으로 등록된 객체중 같은 타입이 있을 경우 의존성(객체)를 주입해줌(DI)
	private MemberDao memberDao;

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
}
