package com.exe.insa;

import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scripting.bsh.BshScriptUtils;
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
		
		return "project/buseoList";
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

		
		
		return "project/buseoManagement";
	}	
	
	//리스트 아작스로출력
	@RequestMapping(value = "/buseoList", method = {RequestMethod.POST,RequestMethod.GET})
	public String buseolist(HttpServletRequest request,HttpServletResponse response) {
		
		List<BuseoDTO> lists = insaDAO.buseoList();
		
		ListIterator<BuseoDTO> it = lists.listIterator();
		
		int depth = -1;
		int n =0;
		Map<String, Object> hMap = new HashMap<String, Object>();
		while(it.hasNext()){
			
			BuseoDTO vo = it.next();
			
			vo.setDepthGap(depth - vo.getDepth() + 1);
	         
	        depth = vo.getDepth();
			n++;
			hMap.put("groupNum", Integer.toString(vo.getGroupNum()));
			hMap.put("depth", Integer.toString(vo.getDepth()));
			hMap.put("buseoNum",Integer.toString(vo.getBuseoNum()));
			
			vo.setReplyNum(insaDAO.replyNum(hMap));
			System.out.println(vo.getReplyNum());
			
			hMap.put("replyNum", vo.getReplyNum());
			insaDAO.updateReply(hMap);
			
			
		}
		
		
		
		
		request.setAttribute("restDiv",n);
		request.setAttribute("lists", lists);
		
		return "project/list";
	}
	
	@RequestMapping(value = "/buseocreated", method = {RequestMethod.GET,RequestMethod.POST})
	public String buseoCreate(HttpServletRequest request,HttpServletResponse response,BuseoDTO dto) {
	
		
		int buseoNum = Integer.parseInt(request.getParameter("num"));
		
		if(buseoNum==0){		
			int maxNum = insaDAO.maxNum();
			dto.setBuseoNum(maxNum+1);
			dto.setGroupNum(dto.getBuseoNum());
			dto.setDepth(0);
			dto.setOrderNo(0);
			dto.setParent(0);
			insaDAO.buseoCreated(dto);
		}
			
		else{
			
			dto = insaDAO.readData(buseoNum);
			System.out.println(dto.getGroupNum());
			Map<String, Object> hMap = new HashMap<String, Object>();
		      hMap.put("groupNum", dto.getGroupNum());
		      hMap.put("orderNo", dto.getOrderNo());
		      insaDAO.updateOrder(hMap);
		      
		      dto.setParent(dto.getBuseoNum());
		      int maxNum = insaDAO.maxNum();
		      dto.setBuseoNum(maxNum+1);
		      dto.setBuseoName("수정해주세요");
		      dto.setDepth(dto.getDepth()+1);
		      dto.setOrderNo(dto.getOrderNo()+1);
		      
		      insaDAO.buseoCreated(dto);
		      
			
		}
		
		return buseolist(request, response);
		
	}
	
	@RequestMapping(value = "/te", method = {RequestMethod.GET,RequestMethod.POST})
	public String te(HttpServletRequest request,HttpServletResponse response,BuseoDTO dto) {
		
	return "project/test";
	}
	
	

}