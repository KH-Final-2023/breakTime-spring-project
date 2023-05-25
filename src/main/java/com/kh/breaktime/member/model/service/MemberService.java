package com.kh.breaktime.member.model.service;

import com.kh.breaktime.member.model.vo.Member;

public interface MemberService {
	
	public abstract Member loginMember(Member inputMember);
	
	public abstract int insertMember(Member inputMember);
}
