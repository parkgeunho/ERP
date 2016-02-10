package com.exe.erp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	//메인홈페이지 
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainboard() {
		
		return "temp";
		
	}
	
	
}
