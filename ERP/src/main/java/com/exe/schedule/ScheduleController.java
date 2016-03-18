package com.exe.schedule;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ScheduleController {

	//메인 홈페이지 이동
	@RequestMapping(value = "/schedule", method={RequestMethod.GET,RequestMethod.POST})
	public String scheduleMain() {
		
		return "scheTile";
	}

	@RequestMapping(value = "/calendar", method={RequestMethod.GET,RequestMethod.POST})
	public String calendar() {
		
		return "leftCalendar";
	}

	@RequestMapping(value = "/calendar2", method={RequestMethod.GET,RequestMethod.POST})
	public String calendar2() {
		
		return "rightCalendar";
	}

	@RequestMapping(value = "/schedulemain2", method={RequestMethod.GET,RequestMethod.POST})
	public String scheduleMain2() {
		
		return "scheduleMain2";
	}

	@RequestMapping(value = "/preCal", method={RequestMethod.GET,RequestMethod.POST})
	public String preCal(HttpServletRequest request,HttpServletResponse response) {
		
		Calendar cal = Calendar.getInstance();
		
		//오늘 날짜 구하기
		int nowYear = cal.get(Calendar.YEAR);
		int nowMonth = cal.get(Calendar.MONTH)+1;
		int nowDay = cal.get(Calendar.DAY_OF_MONTH);
		
		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");
		
		int year = nowYear;
		int month = nowMonth;
		
		if(strYear != null)
			year = Integer.parseInt(strYear);
		
		if(strMonth != null)
			month = Integer.parseInt(strMonth);
		
		int preYear = year, preMonth = month-1;
		
		if(preMonth<1){
			preYear = year-1;
			preMonth = 12;
		}
		
		int nextYear = year, nextMonth = month+1;
		
		if(nextMonth>12){
			
			nextYear = year+1;
			nextMonth=1;
		}
		
		cal.set(year, month-1, 1);
		
		int startDay = 1;
		int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		int week = cal.get(Calendar.DAY_OF_WEEK);
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("nowYear", nowYear);
		request.setAttribute("nowMonth", nowMonth);
		request.setAttribute("preYear", preYear);
		request.setAttribute("preMonth", preMonth);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		request.setAttribute("week", week);
		request.setAttribute("startDay", startDay);
		request.setAttribute("endDay", endDay);
		request.setAttribute("nowDay", nowDay);
		
		return "schedule/leftCal";
	}

	@RequestMapping(value = "/test", method={RequestMethod.GET,RequestMethod.POST})
	public String test() {
		
		return "schedule/scheduleRight2";
	}
}
