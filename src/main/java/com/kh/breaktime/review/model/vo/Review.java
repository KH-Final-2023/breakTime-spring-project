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

	
	private int reviewNo;							//	REVIEW_NO, 
	private int reviewWriter;							//	USER_NO, 
	private int usingRoom;							//	ROOM_NO, 
	private String bookNo;							//	BOOK_NO, 
	private int starScore;							//	STAR_SCORE,
	private String reviewContent;							//	REVIEW_CONTENT,
	private String reviewAvailable;							//	REVIEW_AVAILABLE,
	private Date createDate;							//	CREATE_DATE, 
	private String reviewDeclariation;							//	REVIEW_DECLARIATION, 
	private String reviewContentReply;						//	PARENT_REVIEW_NO
	private String userName;
	private String roomName;

}
