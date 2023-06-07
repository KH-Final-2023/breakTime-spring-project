package com.kh.breaktime.decide.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.decide.model.vo.Decide;

@Repository
public class DecideDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 메인 조회
	public ArrayList<Decide> selectDecideMain(int buNo) {
		
		return (ArrayList)sqlSession.selectList("decideMapper.selectDecideMain", buNo);
	}
	
	// 메인 리뷰 개수 조회
	public int selectReviewCount(int buNo) {
			
		return sqlSession.selectOne("decideMapper.selectReviewCount", buNo);
	}
	
	// 객실 조회
	public ArrayList<Decide> selectDecideRoom(int buNo) {
		
		return (ArrayList)sqlSession.selectList("decideMapper.selectDecideRoom", buNo);
	}
	
	// 지도 메인 화면 조회
	public ArrayList<Decide> selectDecideMap(int buNo) {
		
		return (ArrayList)sqlSession.selectList("decideMapper.selectDecideMap", buNo);
	}
	
	// 지도 메인 화면 조회
	public ArrayList<Decide> selectDetailMap(int buNo) {
		
		return (ArrayList)sqlSession.selectList("decideMapper.selectDetailMap", buNo);
	}
	
	// 리뷰 조회
	public ArrayList<Decide> selectDecideReview(int buNo) {
		
		return (ArrayList)sqlSession.selectList("decideMapper.selectDecideReview", buNo);
	}
	
	
}
