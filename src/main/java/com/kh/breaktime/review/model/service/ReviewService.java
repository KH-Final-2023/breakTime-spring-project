package com.kh.breaktime.review.model.service;

import java.util.List;

import com.kh.breaktime.review.model.vo.Review;

public interface ReviewService {
	
	
	public int insertReview(Review review);
	
	public List<Review> selectReviewList(int reviewNo);
}
