package com.exe.insa;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ListController {
	
	
	
	@RequestMapping(value = "/con", method = {RequestMethod.GET,RequestMethod.POST})
	public String test2(HttpServletRequest request,HttpServletResponse response) {
		
		
		return "boardtest";
	}
	
	
	
	
	
	
	
	
	
	
	

}
