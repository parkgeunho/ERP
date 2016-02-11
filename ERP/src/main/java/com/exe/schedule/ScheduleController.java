package com.exe.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ScheduleController {

	//메인 홈페이지 이동
	@RequestMapping(value = "/schedule", method=RequestMethod.GET)
	public String scheduleMain() {
		
		return "scheTile";
	}

}
