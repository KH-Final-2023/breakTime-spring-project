package com.kh.breaktime.decide.model.dao;

import java.util.ArrayList;
import java.util.List;

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
   
   // 리뷰 등록
   public int insertReview(Decide decide) {
      return sqlSession.insert("decideMapper.insertReview",decide);
      
   }
   
   // 리뷰 개수 조회
   public int selectReviewCount(int buNo) {
         
      return sqlSession.selectOne("decideMapper.selectReviewCount", buNo);
   }
   
   // 리뷰 평점 조회
   public double selectReviewScore(int buNo) {
         
      return sqlSession.selectOne("decideMapper.selectReviewScore", buNo);
   }
   
   
   // 유저 리뷰 점수 조회
   public List<Double> selectuserStarScore(int buNo) {
         
      return sqlSession.selectList("decideMapper.selectuserStarScore", buNo);
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
   
   // 지도 팝업 지도 조회
   public ArrayList<Decide> selectPopupMap(int buNo) {
      
      return (ArrayList)sqlSession.selectList("decideMapper.selectPopupMap", buNo);
   }
   
   // 리뷰 조회
   public ArrayList<Decide> selectDecideReview(int buNo) {
      
      return (ArrayList)sqlSession.selectList("decideMapper.selectDecideReview", buNo);
   }

   // 장바구니 조회
   public ArrayList<Decide> selectCartList(int userNo){
	   
      return (ArrayList)sqlSession.selectList("decideMapper.selectCartList", userNo);
   }
   
   // 장바구니 등록
   public int insertCartList(Decide decide){
	   
      return sqlSession.insert("decideMapper.insertCartList", decide);
   }
   
   // 장바구니 삭제
   public int deleteCartList(Decide decide) {
	   
      return sqlSession.delete("decideMapper.deleteCartList", decide);
   }
	
   //찜
   public int insertLIkeValue(Decide decide) {

	   return sqlSession.insert("decideMapper.insertLIkeValue", decide);
   }
   
   //찜 취소
   public int deleteLikeValue(Decide decide) {

	   return sqlSession.delete("decideMapper.deleteLIkeValue", decide);
   }

   //찜 유무 확인
   public int selectLikeValue(Decide decide) {
	
	   return sqlSession.selectOne("decideMapper.selectLikeValue", decide);
   }
}