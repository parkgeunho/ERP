package com.exe.erp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class HomeController {
	
	
	
	//메인 입니다. 에러 발생
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainboard() {
		
		return "temp";
		
	}
	

	
	
	
	
}
