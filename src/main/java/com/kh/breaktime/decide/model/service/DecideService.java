package com.kh.breaktime.decide.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.breaktime.decide.model.vo.Decide;
import com.kh.breaktime.review.model.vo.Review;

public interface DecideService {
	
	// 메인 조회
	ArrayList<Decide> selectDecideMain(int buNo);
	
	// 리뷰 등록
	int insertReview(Decide decide);
	
	// 리뷰 개수 조회
	int selectReviewCount(int buNo);
	
	// 리뷰 평점 조회
	double selectReviewScore(int buNo);
	
	// 유저 리뷰 점수 조회
	List<Double> selectuserStarScore(int buNo);
	
	// 객실 조회
	ArrayList<Decide> selectDecideRoom(int buNo);
	
	// 선택 객실 조회
	ArrayList<Decide> payDecideRoom(int roomNo);
	
	// 지도 조회
	ArrayList<Decide> selectDecideMap(int buNo);
	
	//지도 메인 썸네일 조회 
	ArrayList<Decide> selectDetailMap(int buNo);
	
	//지도 팝업 지도 조회 
	ArrayList<Decide> selectPopupMap(int buNo);
	 
	// 리뷰 조회
	ArrayList<Decide> selectDecideReview(int buNo);


	
}
