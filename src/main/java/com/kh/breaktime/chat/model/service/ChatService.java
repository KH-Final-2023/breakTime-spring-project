package com.kh.breaktime.chat.model.service;

import java.util.List;

import com.kh.breaktime.chat.model.vo.ChatMessage;
import com.kh.breaktime.chat.model.vo.ChatMessageBu;
import com.kh.breaktime.chat.model.vo.ChatRoomJoin;
import com.kh.breaktime.chat.model.vo.ChatRoomJoinBu;

public interface ChatService {

	List<ChatMessage> joinChatRoom(ChatRoomJoin join);
	
	List<ChatMessage> joinBuChatRoom(ChatRoomJoinBu join);
	
	int insertMessage(ChatMessage cm);
	
	int insertMessageBu(ChatMessageBu cmb);
	
}
