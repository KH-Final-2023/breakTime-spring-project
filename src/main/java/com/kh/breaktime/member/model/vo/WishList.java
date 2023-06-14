package com.kh.breaktime.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class WishList {
	private int userNo;
	private int buNo;
	private String buTitle;
	private String buMainImg;
	private String buAddress;
	private String roomPrice;
}
