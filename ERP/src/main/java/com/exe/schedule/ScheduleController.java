package com.exe.schedule;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.member.MemberDAO;
import com.exe.member.MemberDTO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ScheduleController {
	
	@Autowired
	@Qualifier("scheduleDAO")
	ScheduleDAO dao;
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO memberDAO;

	//메인 홈페이지 이동
	@RequestMapping(value = "/schedule", method={RequestMethod.GET,RequestMethod.POST})
	public String scheduleMain(ScheduleDTO dto, HttpServletRequest request, HttpServletResponse response) {
		
		return "scheTile";
	}

	@RequestMapping(value = "/leftCalChange", method={RequestMethod.GET,RequestMethod.POST})
	public String leftCalChange(HttpServletRequest request,HttpServletResponse response) {
		
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

	@RequestMapping(value = "/rightCalChange", method={RequestMethod.GET,RequestMethod.POST})
	public String rightCalChange(HttpServletRequest request , HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("dto");
		
		String id = (String)mdto.getId();
		
		int count = dao.getDataCount(id);
		
		System.out.println("스케줄 갯수 :" + count);
		
		List<ScheduleDTO> scheduleList = null;
		
		if(count>0){
			
			scheduleList = dao.getList(id);
			
			ListIterator<ScheduleDTO> it = scheduleList.listIterator();
			
			ScheduleDTO vo = it.next();
			
			System.out.println(vo.getContent());
			
			JSONArray jsonArray = JSONArray.fromObject(scheduleList);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("scheduleList", jsonArray);
			
			JSONObject jsonObject = JSONObject.fromObject(map);

			request.setAttribute("jsonObject", jsonObject);
			request.setAttribute("ScheduleList", scheduleList);
		}
		
		if(count == 0){
			
			request.setAttribute("jsonObject", 0);
		}
		
		return "schedule/rightCal";
	}
	
	@RequestMapping(value = "/scheduleCreated", method={RequestMethod.GET,RequestMethod.POST})
	public String scheduleCreated(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		return "schedule/scheduleCreated";
	}
	
	@RequestMapping(value = "/scheduleUpdated", method={RequestMethod.GET,RequestMethod.POST})
	public String scheduleUpdated(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		String scheduleNum = request.getParameter("scheduleNum");
		
		ScheduleDTO dto = dao.getReadData(scheduleNum);
		
		String start = dto.getStartDate();
		String end = dto.getEndDate();
		
		System.out.println(start);
		System.out.println(end);
		
		request.setAttribute("dto", dto);
		request.setAttribute("start", start);
		request.setAttribute("end", end);
		
		return "schedule/scheduleUpdated";
	}
	
	@RequestMapping(value = "/scheduleUpdated_ok", method={RequestMethod.GET,RequestMethod.POST})
	public String scheduleUpdated_ok(ScheduleDTO dto, HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		System.out.println("들어오니");
		
		String scheduleNum = request.getParameter("scheduleNum");
		String title = request.getParameter("title");
		String calendarSt = request.getParameter("calendarSt");
		String stH = request.getParameter("stH");
		String stMin = request.getParameter("stMin");
		String calendarEnd = request.getParameter("calendarEnd");
		String endH = request.getParameter("endH");
		String endMin = request.getParameter("endMin");
		String content = request.getParameter("content");
		
		dto.setScheduleNum(Integer.parseInt(scheduleNum));
		dto.setTitle(title);
		dto.setContent(content);
		dto.setStartDate(calendarSt +"-"+ stH +"-"+ stMin);
		dto.setEndDate(calendarEnd +"-"+ endH +"-"+ endMin);
		
		dao.updateData(dto);
		
		return "redirect:/schedule";
	}
	
	@RequestMapping(value = "/scheduleSave", method={RequestMethod.GET,RequestMethod.POST})
	public String scheduleSave(ScheduleDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception{

		HttpSession session = request.getSession();
	    
		MemberDTO mdto = (MemberDTO)session.getAttribute("dto");
		String title = request.getParameter("title");
		String calendarSt = request.getParameter("calendarSt");
		String stH = request.getParameter("stH");
		String stMin = request.getParameter("stMin");
		String calendarEnd = request.getParameter("calendarEnd");
		String endH = request.getParameter("endH");
		String endMin = request.getParameter("endMin");
		String content = request.getParameter("content");
		
		int maxNum = dao.getMaxNum();
		
		dto.setScheduleNum(maxNum+1);
		dto.setId(mdto.getId());
		dto.setTitle(title);
		dto.setContent(content);
		dto.setStartDate(calendarSt +"-"+ stH +"-"+ stMin);
		dto.setEndDate(calendarEnd +"-"+ endH +"-"+ endMin);
		
		dao.insertSchedule(dto);
		
		return "redirect:/schedule";
	}
}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	