package com.kh.breaktime.chat.model.websocket;

import java.sql.Date;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kh.breaktime.chat.model.service.ChatService;
import com.kh.breaktime.chat.model.vo.ChatMessage;
import com.kh.breaktime.chat.model.vo.ChatMessageBu;

public class ChatWebsocketHandler extends TextWebSocketHandler {

	// 채팅서비스 주입
	@Autowired
	private ChatService chatService;
	
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		
		sessions.add(session); // 전달받은 session을 set에 추가
	}
	
	// 클라이언트와 연결이 종료되면 수행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessions.remove(session);
		// 웹소켓 연결이 종료되는 경우, sessions안에 저장되어있던 클라이언트의 session정보를 삭제
	}
	
	@Override // 클라이언트로부터 텍스트 메세지를 전달받았을때 수행
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TextMessage : 웹소켓을 이용해 전달된 텍스트가 담겨있는 객체
		
		// payLoad : 전송되는 데이터(json객체)
		System.out.println("전달된 메세지 : "+message.getPayload());
		
		// JackSon라이브러리 : java에서 json을 다루기 위한 라이브러리
		
		// Jackson-databind -> ObjectMapper를 이용해서 JSON형태로 넘어온 데이터를 특정 VO필드에 맞게 자동매핑
		ObjectMapper objectMapper = new ObjectMapper();
		
		ChatMessage chatMessage = objectMapper.readValue(message.getPayload(), ChatMessage.class);
		
		ChatMessageBu chatMessageBu = objectMapper.readValue(message.getPayload(), ChatMessageBu.class);
		
		chatMessage.setCreateDate(new Date(System.currentTimeMillis()));
		
		chatMessageBu.setCreateDate(new Date(System.currentTimeMillis()));
		
		// 전달받은 채팅메세지를 db에 삽입
		System.out.println(chatMessage);
		System.out.println(chatMessageBu);
		
		int result = chatService.insertMessage(chatMessage);
		
		if(result > 0) {
			// 같은 방에 접속중인 클라이언트에게 전달받은 메세지 뿌리기
			for(WebSocketSession s : sessions) {
				
				// 반복을 진행중인 WebSocketSession안에 담겨있는 방번호 == 메세지 안에 담겨있는 방번호가 일치하는 경우 메세지 뿌리기
				int buNo = (int) s.getAttributes().get("buNo");
				
				// 메세지에 담겨있는 채팅방 번호와 chatRoomNo 일치하는지 비교
				if(chatMessage.getBuNo() == buNo) {
					// 같은방 클라이언트에게 JSON형태로 메세지를 보냄
					// s.sendMessage( new TextMessage( message.getPayload() ) )
					s.sendMessage(new TextMessage( new Gson().toJson(chatMessage)));
				}
			}
		}
		
		int result2 = chatService.insertMessageBu(chatMessageBu);
		
		if(result2 > 0) {
			// 같은 방에 접속중인 클라이언트에게 전달받은 메세지 뿌리기
			for(WebSocketSession s : sessions) {
				
				// 반복을 진행중인 WebSocketSession안에 담겨있는 방번호 == 메세지 안에 담겨있는 방번호가 일치하는 경우 메세지 뿌리기
				int buNo = (int) s.getAttributes().get("buNo");
				
				// 메세지에 담겨있는 채팅방 번호와 chatRoomNo 일치하는지 비교
				if(chatMessageBu.getBuNo() == buNo) {
					// 같은방 클라이언트에게 JSON형태로 메세지를 보냄
					// s.sendMessage( new TextMessage( message.getPayload() ) )
					s.sendMessage(new TextMessage( new Gson().toJson(chatMessageBu)));
				}
			}
		}
	}
}
