package com.kh.breaktime.decide.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.decide.model.dao.DecideDao;
import com.kh.breaktime.decide.model.vo.Decide;

@Service
public class DecideServiceImpl implements DecideService {

   @Autowired 
   private DecideDao decideDao;

   // 메인 조회
   @Override
   public ArrayList<Decide> selectDecideMain(int buNo) {
      return decideDao.selectDecideMain(buNo);
   }
   
   @Override
   public int insertReview(Decide decide) {
        
        return decideDao.insertReview(decide);
        
     }
   
   // 리뷰 개수 조회
   @Override
   public int selectReviewCount(int buNo) {
      return decideDao.selectReviewCount(buNo);
   }
   
   // 리뷰 평점 조회
   @Override
   public double selectReviewScore(int buNo) {
      return decideDao.selectReviewScore(buNo);
   }
   
   // 유저 리뷰 점수 조회
   @Override
   public List<Double> selectuserStarScore(int buNo) {
      return decideDao.selectuserStarScore(buNo);
   }
   
   // 객실 조회
   @Override
   public ArrayList<Decide> selectDecideRoom(int buNo) {
      return decideDao.selectDecideRoom(buNo);
   }

   // 선택 객실 조회
	@Override
	public ArrayList<Decide> payDecideRoom(int roomNo) {
		return decideDao.payDecideRoom(roomNo);
	}
   
   // 지도 메인 화면 조회
   @Override
   public ArrayList<Decide> selectDecideMap(int buNo) {
      return decideDao.selectDecideMap(buNo);
   }
   
   // 지도 메인 썸네일 조회
   @Override
   public ArrayList<Decide> selectDetailMap(int buNo) {
      return decideDao.selectDetailMap(buNo);
   }
   
   // 지도 팝업 지도 조회
   @Override
   public ArrayList<Decide> selectPopupMap(int buNo) {
      return decideDao.selectPopupMap(buNo);
   }
   
   // 리뷰 조회
   @Override
   public ArrayList<Decide> selectDecideReview(int buNo) {
      return decideDao.selectDecideReview(buNo);
   }

   // 장바구니 조회
   @Override
   public ArrayList<Decide> selectCartList(int userNo) {
      return decideDao.selectCartList(userNo);
   }
   
   // 장바구니 등록
   @Override
   public int insertCartList(Decide decide) {
      return decideDao.insertCartList(decide);
   }

   // 장바구니 삭제
   @Override
   public int deleteCartList(Decide decide) {
      return decideDao.deleteCartList(decide);
   }
   
   //찜
   @Override
	public int insertLIkeValue(Decide decide) {
	   return decideDao.insertLIkeValue(decide);
	}
   
   //찜 취소
  @Override
	public int deleteLikeValue(Decide decide) {
	  return decideDao.deleteLikeValue(decide);
	}
  
  @Override
	public int selectLikeValue(Decide decide) {
	  return decideDao.selectLikeValue(decide);
	}
}