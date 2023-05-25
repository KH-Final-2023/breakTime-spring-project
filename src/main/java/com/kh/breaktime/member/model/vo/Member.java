package com.kh.breaktime.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private Date enrollDate;
	private int authority;
	private String status;
}
