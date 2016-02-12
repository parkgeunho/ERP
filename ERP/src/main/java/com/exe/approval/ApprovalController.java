package com.exe.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ApprovalController {

	@RequestMapping(value = "/approvalArticle", method = RequestMethod.GET)
	public String approvalArticle() {
		
		return "approval/approvalArticle";
	}

	@RequestMapping(value = "/approvalCreated", method = RequestMethod.GET)
	public String approvalCreated() {
		
		return "approval/approvalCreated";
	}	

	@RequestMapping(value = "/approvalTest", method = RequestMethod.GET)
	public String approvalTest() {
		
		return "approval/approvalTest";
	}	
}
