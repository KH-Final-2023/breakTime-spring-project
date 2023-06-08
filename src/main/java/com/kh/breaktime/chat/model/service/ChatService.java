package com.kh.breaktime.chat.model.service;

import java.util.List;

import com.kh.breaktime.chat.model.vo.ChatMessage;
import com.kh.breaktime.chat.model.vo.ChatRoomJoin;

public interface ChatService {

	List<ChatMessage> joinChatRoom(ChatRoomJoin join);
	 
	int insertMessage(ChatMessage cm);
	
	
}
