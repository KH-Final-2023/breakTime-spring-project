package com.kh.breaktime.decide.model.service;

import java.util.ArrayList;

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
	
	// 객실 조회
	@Override
	public ArrayList<Decide> selectDecideRoom(int buNo) {
		return decideDao.selectDecideRoom(buNo);
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
	
    

}
