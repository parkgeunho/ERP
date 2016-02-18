package com.exe.insa;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class InsaController {
	
	
	@Autowired
	@Qualifier("insaDAO")
	InsaDAO insaDAO;
	
	
	//메인 홈페이지 이동
	@RequestMapping(value = "/insa", method = RequestMethod.GET)
	public String mainboard(HttpServletRequest request,HttpServletResponse response) {
		
		
		List<BuseoDTO> buseoLists = insaDAO.getBuseo();
		List<BuseoDTO> depth1 = insaDAO.depth1();
		List<BuseoDTO> depth2 = insaDAO.depth2();
		List<BuseoDTO> depth3 = insaDAO.depth3();
		
		List<BuseoDTO> depth4 = insaDAO.depth4();
		List<BuseoDTO> depth5 = insaDAO.depth5();
		List<BuseoDTO> depth1etc = insaDAO.depth1etc();
		List<BuseoDTO> depth2etc = insaDAO.depth2etc();
		List<BuseoDTO> depth3etc = insaDAO.depth3etc();
		List<BuseoDTO> depth4etc = insaDAO.depth4etc();

		request.setAttribute("buseoLists", buseoLists);
		request.setAttribute("depth1", depth1);
		request.setAttribute("depth2", depth2);
		request.setAttribute("depth3", depth3);
	
		request.setAttribute("depth4", depth4);
		request.setAttribute("depth5", depth5);
		request.setAttribute("depth1etc", depth1etc);
		request.setAttribute("depth2etc", depth2etc);
		request.setAttribute("depth3etc", depth3etc);
		request.setAttribute("depth4etc", depth4etc);
		
		
		return "insa";
	}
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		
		return "project/test";
	}
	
	@RequestMapping(value = "/buseoManagement", method = RequestMethod.GET)
	public String test2(HttpServletRequest request,HttpServletResponse response) {
		
		
		List<BuseoDTO> buseoLists = insaDAO.getBuseo();
		List<BuseoDTO> depth1 = insaDAO.depth1();
		List<BuseoDTO> depth2 = insaDAO.depth2();
		List<BuseoDTO> depth3 = insaDAO.depth3();
		List<BuseoDTO> depth4 = insaDAO.depth4();
		List<BuseoDTO> depth5 = insaDAO.depth5();
		List<BuseoDTO> depth1etc = insaDAO.depth1etc();
		List<BuseoDTO> depth2etc = insaDAO.depth2etc();
		List<BuseoDTO> depth3etc = insaDAO.depth3etc();
		List<BuseoDTO> depth4etc = insaDAO.depth4etc();

		request.setAttribute("buseoLists", buseoLists);
		request.setAttribute("depth1", depth1);
		request.setAttribute("depth2", depth2);
		request.setAttribute("depth3", depth3);
		request.setAttribute("depth4", depth4);
		request.setAttribute("depth5", depth5);
		request.setAttribute("depth1etc", depth1etc);
		request.setAttribute("depth2etc", depth2etc);
		request.setAttribute("depth3etc", depth3etc);
		request.setAttribute("depth4etc", depth4etc);
		
		List<BuseoDTO> test = insaDAO.depth3();
		request.setAttribute("test", test);
		
		
		return "project/buseoManagement";
	}	
	
	@RequestMapping(value = "/buseoManagement", method = RequestMethod.POST)
	public String buseoManagemenet(HttpServletRequest request,HttpServletResponse response) {
		
		
		return "project/buseoManagement";
	}
	

}
