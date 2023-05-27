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

public class Approval {
	private int buNo;
	private String buId;
	private String buUserName;
	private String buTel;
	private String buTitle;
	private String buAddress;
	private String approval;
	
}
