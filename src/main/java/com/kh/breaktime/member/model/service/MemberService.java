package com.kh.breaktime.member.model.service;

import java.util.Map;

import com.kh.breaktime.member.model.vo.Member;

public interface MemberService {
	
	public abstract Member loginMember(Member inputMember);
	
	public abstract int insertMember(Member inputMember);
	
	//충영
	public void selectSearchList(int cp, Map<String, Object> map);
	
	public void selectSearchList(Map<String,Object> paramMap, Map<String, Object> map);
}
