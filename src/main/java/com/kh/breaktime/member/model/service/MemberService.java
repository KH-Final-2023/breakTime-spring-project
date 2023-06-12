package com.kh.breaktime.member.model.service;

import com.kh.breaktime.member.model.vo.Member;

public interface MemberService {
	
	public abstract Member loginMember(Member inputMember);
	
	public abstract int insertMember(Member inputMember);
	
	public abstract int deleteMember(Member inputMember);
	
	public abstract int updateId(Member inputMember);
	
	public abstract int updatePwd(Member inputMember);
	
	public abstract int updateName(Member inputMember);
	
	public abstract int updateEmail(Member inputMember);
}
