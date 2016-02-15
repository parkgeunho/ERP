package com.exe.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@RequestMapping(value = "/login.action")
	public String loginView() {
		
		return "member/login";
		
	}
	
	@RequestMapping(value = "/join.action")
	public String joinView() {
		
		
		return "member/join";
	}
	
	
	@RequestMapping(value = "/insaView.action" , method = {RequestMethod.POST,RequestMethod.GET})
	public String insaView() {
		
		
		return "member/insaView";
	}
	
	

}
