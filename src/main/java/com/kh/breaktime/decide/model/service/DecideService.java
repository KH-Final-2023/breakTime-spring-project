package com.kh.breaktime.decide.model.service;

import java.util.ArrayList;

import com.kh.breaktime.decide.model.vo.Decide;

public interface DecideService {
	
	// 메인 조회
	ArrayList<Decide> selectDecideMain(int buNo);
	
	// 메인 리뷰 개수 조회
	int selectReviewCount(int buNo);
	
	// 객실 조회
	ArrayList<Decide> selectDecideRoom(int buNo);
	
	// 지도 조회
	ArrayList<Decide> selectDecideMap(int buNo);
	
	// 리뷰 조회
	ArrayList<Decide> selectDecideReview(int buNo);

	
}
