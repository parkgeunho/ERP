package com.exe.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping(value = "/login.action")
	public String loginView() {
		
		return "login/login";
		
	}	
	
	

}
