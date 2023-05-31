package com.kh.breaktime.review.model.vo;

import java.sql.Date;

import com.kh.breaktime.business.model.vo.Business;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class Review {

	private int reviewNo;
	private int reviewWriter;
	private int usingRoom;
	private String bookNo;
	private int starScore;
	private String reviewContent;
	private String reviewAvailable;
	private Date createDate;
	private String reviewDeclaration;
	private String parentReviewNo; // PARENT_REVIEW_NO
}
