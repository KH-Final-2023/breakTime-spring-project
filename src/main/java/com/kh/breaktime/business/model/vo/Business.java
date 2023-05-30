package com.kh.breaktime.business.model.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.kh.breaktime.business.model.vo.Business;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class Business {
	
	private int buNo;
	private String buId;
	private String buPwd;
	private int areaNo;
	private String buCategory;
	private String email;
	private String buTel;
	private String buUserName;
	private String buAddress;
	private String buTitle;
	private String approval;
	private Date enrollDate;
	private int roomCount;
	private MultipartFile f;
	private String changeName;
	
}
