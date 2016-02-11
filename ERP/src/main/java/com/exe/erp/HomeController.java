package com.exe.erp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	//메인 홈페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainboard() {
		
		return "temp";
	}	

	//메인 홈페이지 이동
	@RequestMapping(value = "/main2", method = RequestMethod.GET)
	public String mainboard2() {
		
		return "ep";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "ep";
	}
	
	
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public String test2() {
		return "project/InsaView";
	}
	
	
	
	//기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈//	
	//기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈//
	@RequestMapping(value = "/approvalArticle", method = RequestMethod.GET)
	public String approvalArticle() {
		
		return "approval/approvalArticle";
	}

	@RequestMapping(value = "/approvalCreated", method = RequestMethod.GET)
	public String approvalCreated() {
		
		return "approval/approvalCreated";
	}	
	
	//기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈//
	//기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈기훈//
	
}
