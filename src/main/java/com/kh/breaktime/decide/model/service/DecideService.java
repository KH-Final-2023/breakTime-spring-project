package com.kh.breaktime.decide.model.service;

import java.util.ArrayList;

import com.kh.breaktime.decide.model.vo.Decide;

public interface DecideService {
	
	// 메인 조회
	ArrayList<Decide> selectDecideMain(int buNo);
	
	// 리뷰 개수 조회
	int selectReviewCount(int buNo);
	
	// 리뷰 평점 조회
	//double selectReviewScore(int buNo);
	
	// 객실 조회
	ArrayList<Decide> selectDecideRoom(int buNo);
	
	// 지도 조회
	ArrayList<Decide> selectDecideMap(int buNo);
	
	//지도 메인 썸네일 조회 
	ArrayList<Decide> selectDetailMap(int buNo);
	
	//지도 팝업 지도 조회 
	ArrayList<Decide> selectPopupMap(int buNo);
	 
	// 리뷰 조회
	ArrayList<Decide> selectDecideReview(int buNo);


	
}
