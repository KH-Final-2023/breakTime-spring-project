package com.kh.breaktime.decide.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.decide.model.dao.DecideDao;
import com.kh.breaktime.member.model.vo.Member;

@Service
public class DecideServiceImpl implements DecideService {

	@Autowired // bean으로 등록된 객체중 같은 타입이 있을 경우 의존성(객체)를 주입해줌(DI)
	private DecideDao decideDao;
	
//	@Override
//	public Member loginMember(Member inputMember) {
//		
//		Member loginUser = memberDao.loginMember(inputMember);
//		
//		return loginUser;
//	}

}
