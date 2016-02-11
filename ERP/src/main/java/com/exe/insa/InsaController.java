package com.exe.insa;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InsaController {
	
	
	
	//메인 홈페이지 이동
	@RequestMapping(value = "/insa", method = RequestMethod.GET)
	public String mainboard() {
		
		return "insa";
	}
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		
		return "ep";
	}	
	

}
