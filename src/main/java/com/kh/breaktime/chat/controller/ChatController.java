package com.kh.breaktime.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.breaktime.business.model.vo.Business;
import com.kh.breaktime.chat.model.service.ChatService;
import com.kh.breaktime.chat.model.vo.ChatMessage;
import com.kh.breaktime.chat.model.vo.ChatRoomJoin;
import com.kh.breaktime.chat.model.vo.ChatRoomJoinBu;
import com.kh.breaktime.member.model.vo.Member;

@Controller
@SessionAttributes({"loginUser" , "loginBusiness", "chatRoomNo"})
public class ChatController {

	@Autowired
	private ChatService service;
	
	@GetMapping("/chat/room/{buNo}")
	public String joinChatRoom(
				@ModelAttribute("loginUser") Member loginUser,
				Model model,
				@PathVariable("buNo") int buNo,
				ChatRoomJoin join,
				RedirectAttributes ra
				) {
		join.setUserNo(loginUser.getUserNo());
		List<ChatMessage> list = service.joinChatRoom(join);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("buNo", buNo);  // session에 올림
			return "member/chatRoom";
		} else {
			ra.addFlashAttribute("alertMsg", "채팅방이 존재하지 않습니다");
			return "redirect:../chatRoomList";
		}
	}
	
	@GetMapping("/chat/roomBu")
	public String joinBuChatRoom(
				@ModelAttribute("loginBusiness") Business loginBusiness,
				Model model,
				ChatRoomJoinBu join,
				RedirectAttributes ra
				) {
		join.setBuNo(loginBusiness.getBuNo());
		List<ChatMessage> list = service.joinBuChatRoom(join);
		
		if(list != null) {
			model.addAttribute("list", list);
			return "member/chatRoomBu";
		} else {
			ra.addFlashAttribute("alertMsg", "채팅방이 존재하지 않습니다");
			return "redirect:../chatRoomList";
		}
	}
}
