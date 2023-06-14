package com.kh.breaktime.member.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.admin.model.vo.Notice;
import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.common.model.vo.PageInfo;
import com.kh.breaktime.member.model.vo.Member;
import com.kh.breaktime.member.model.vo.WishList;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member loginMember(Member inputMember) {

		return sqlSession.selectOne("memberMapper.loginMember", inputMember);
	}

	public int insertMember(Member inputMember) {

		return sqlSession.insert("memberMapper.insertMember", inputMember);
	}
	
	public int deleteMember(Member inputMember) {
		
		return sqlSession.update("memberMapper.deleteMember", inputMember);
		
	}
	
	public int updateId(Member inputMember) {
		
		return sqlSession.update("memberMapper.updateId", inputMember);
	}
	
	public int updatePwd(Member inputMember) {
		
		return sqlSession.update("memberMapper.updatePwd", inputMember);
	}
	
	public int updateName(Member inputMember) {
		
		return sqlSession.update("memberMapper.updateName", inputMember);
	}
	
	public int updateEmail(Member inputMember) {
		
		return sqlSession.update("memberMapper.updateEmail", inputMember);
	}
	
	// 충영
	public int selectSearchListCount() {
		return sqlSession.selectOne("memberMapper.selectSearchListCount");
	}
	
	public int selectSearchListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("memberMapper.selectSearchListCount", paramMap);
		
	}
	
	public ArrayList<Notice> selectSearchList(PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchList", "", rowBounds);
	}
	
	public ArrayList<Notice> selectSearchList(PageInfo pi,Map<String, Object> paramMap){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchList", paramMap, rowBounds);
	}
	
	public List<WishList> selectWishList(WishList w){
		
		return sqlSession.selectList("memberMapper.selectWishList", w);
	}
	
	public String findId(String email) throws Exception{
		return sqlSession.selectOne("member.findId", email);
	}
}
