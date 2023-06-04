package com.kh.breaktime.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.breaktime.chat.model.vo.ChatMessage;
import com.kh.breaktime.chat.model.vo.ChatMessageBu;
import com.kh.breaktime.chat.model.vo.ChatRoomJoin;
import com.kh.breaktime.chat.model.vo.ChatRoomJoinBu;

@Repository
public class ChatDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 채팅방 참여여부 확인
	public int joinCheck(ChatRoomJoin join) {
		return sqlSession.selectOne("chat-mapper.joinCheck", join);
	}
	
	public int joinCheckBu(ChatRoomJoinBu join) {
		return sqlSession.selectOne("chat-mapper.joinCheckBu", join);
	}
	
	// 채팅방 참여
	public void joinChatRoom(ChatRoomJoin join) {
		sqlSession.insert("chat-mapper.joinChatRoom", join);
	}
	
	public void joinBuChatRoom(ChatRoomJoinBu join) {
		sqlSession.insert("chat-mapper.joinChatRoomBu", join);
	}
	
	// 채팅방 메세지 목록 조회
	public List<ChatMessage> selectChatMessage(int chatRoomNo) {
		return sqlSession.selectList("chat-mapper.selectChatMessage", chatRoomNo);
	}
	
	// 채팅메세지 삽입
	public int insertMessage(ChatMessage chatMessage) {
		return sqlSession.insert("chat-mapper.insertMessage", chatMessage);
	}
	
	public int insertMessageBu(ChatMessageBu chatMessageBu) {
		return sqlSession.insert("chat-mapper.insertMessageBu", chatMessageBu);
	}
}
