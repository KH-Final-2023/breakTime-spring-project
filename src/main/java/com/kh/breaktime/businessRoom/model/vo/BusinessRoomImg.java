package com.kh.breaktime.businessRoom.model.vo;

import lombok.Data;

@Data
public class BusinessRoomImg {
	
    private int fileNo;
    private int roomNo;
    private String originName;
    private String saveName;
    private String filePath;
    private int fileLevel;
    private String status;

}
