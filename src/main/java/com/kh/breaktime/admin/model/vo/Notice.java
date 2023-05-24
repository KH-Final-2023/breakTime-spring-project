package com.kh.breaktime.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

	
	
@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
	
public class Notice {
	private int noticeNo;		//	NOTICE_NO
	private int userNo;		//	USER_NO
	private String noticeTitle;		//	NOTICE_TITLE
	private String noticeContent;		//	NOTICE_CONTENT
	private String status;		//	STATUS
	private Date createDate;
	
	
}
