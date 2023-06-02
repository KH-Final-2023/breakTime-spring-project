package com.kh.breaktime.chat.model.service;

import java.util.List;

import com.kh.breaktime.chat.model.vo.ChatMessage;
import com.kh.breaktime.chat.model.vo.ChatRoom;
import com.kh.breaktime.chat.model.vo.ChatRoomBu;
import com.kh.breaktime.chat.model.vo.ChatRoomJoin;

public interface ChatService {

	List<ChatMessage> joinChatRoom(ChatRoomJoin join);
	
	int openChatRoom(ChatRoomBu cr);
	
	int insertMessage(ChatMessage cm);
	
	int exitChatRoom(ChatRoomJoin crj);
}
