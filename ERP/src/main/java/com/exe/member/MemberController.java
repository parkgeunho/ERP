package com.exe.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	

}
