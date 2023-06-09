package com.kh.breaktime.review.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.review.model.vo.Review;

@Repository 
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertReview(Review review) {
		return sqlSession.insert("reviewMapper.insertReview",review);
		
	}
	
	public List<Review> selectReviewList(int reviewNo){
		return sqlSession.selectList("reviewMapper.selectReviewList",reviewNo);
	}

}
