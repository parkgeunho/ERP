package com.exe.approval;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	@RequestMapping(value="/approvalCreated_ok", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalCreated_ok(ApprovalDTO dto, HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		return "ok";	
		
	}

	@RequestMapping(value = "/approvalTest", method = RequestMethod.GET)
	public String approvalTest() {
		
		return "approval/approvalTest";
	}	
	
	
	@RequestMapping(value = "/approvalLine", method = RequestMethod.GET)
	public String approvalLine() {
		
		return "approval/approvalLine";
	}	
		
	
	
	//HttpSession session = request.getSession();

	
	
}
