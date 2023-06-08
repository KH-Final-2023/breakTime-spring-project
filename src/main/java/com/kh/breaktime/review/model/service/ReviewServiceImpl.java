package com.kh.breaktime.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.breaktime.decide.model.dao.DecideDao;
import com.kh.breaktime.member.model.vo.Member;
import com.kh.breaktime.review.model.dao.ReviewDAO;
import com.kh.breaktime.review.model.vo.Review;
import org.springframework.beans.factory.annotation.Autowired;
@Service
public class ReviewServiceImpl implements ReviewService {

	
  @Autowired
  private ReviewDAO reviewDao;
  
  public int insertReview(Review review) {
     
     return reviewDao.insertReview(review);
     
  }

@Override
public List<Review> selectReviewList(int reviewNo) {
	
	return reviewDao.selectReviewList(reviewNo);
}

}
