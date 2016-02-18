package com.exe.approval;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.insa.BuseoDTO;
import com.exe.insa.InsaDAO;

@Controller
public class ApprovalController {


	
	@RequestMapping(value = "/approval", method=RequestMethod.GET)
	public String scheduleMain() {
		
		return "approvalTile";
	}
	
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
	public String approvalTest(HttpServletRequest request) {
		


		return "approval/approvalTest";
	}	
	
	//
	@RequestMapping(value = "/approvalLine.action", method = RequestMethod.GET)
	public String approvalLine(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
	
		return "approval/approvalLine";
	}	
		
	
	
	//HttpSession session = request.getSession();

	
	
}
