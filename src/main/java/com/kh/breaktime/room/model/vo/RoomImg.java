package com.kh.breaktime.room.model.vo;

import lombok.Data;

@Data
public class RoomImg {
	
    private int fileNo;
    private int roomNo;
    private String originName;
    private String saveName;
    private String filePath;
    private int fileLevel;
    private String status;

}
