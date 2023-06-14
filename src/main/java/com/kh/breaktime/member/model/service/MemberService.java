package com.kh.breaktime.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.breaktime.member.model.vo.Member;
import com.kh.breaktime.member.model.vo.WishList;

public interface MemberService {
	
	public abstract Member loginMember(Member inputMember);
	
	public abstract int insertMember(Member inputMember);
	
	public abstract int deleteMember(Member inputMember);
	
	public abstract int updateId(Member inputMember);
	
	public abstract int updatePwd(Member inputMember);
	
	public abstract int updateName(Member inputMember);
	
	public abstract int updateEmail(Member inputMember);
	//충영
	public void selectSearchList(int cp, Map<String, Object> map);
	
	public void selectSearchList(Map<String,Object> paramMap, Map<String, Object> map);
	
	public List<WishList> selectWishList(WishList w);
	
	public abstract int findId(String email);
}
