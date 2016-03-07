package com.exe.insa;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
		
		List<BuseoDTO> parent = insaDAO.getGroup();
		List<BuseoDTO> depths = insaDAO.getDepth();
		
		request.setAttribute("depths", depths);
		request.setAttribute("parent", parent);
		request.setAttribute("restDiv",n);
		request.setAttribute("lists", lists);
		
		
		
		
		
		return "insa";
	}
	
	

	
	@RequestMapping(value = "/buseoManagement", method = RequestMethod.GET)
	public String test2(HttpServletRequest request,HttpServletResponse response) {
		
	

		
		
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
			
			
			hMap.put("replyNum", vo.getReplyNum());
			insaDAO.updateReply(hMap);
			
			
		}
		
		int maxNum = insaDAO.maxNum();
		List<BuseoDTO> parent = insaDAO.getGroup();
		List<BuseoDTO> depths = insaDAO.getDepth();
		request.setAttribute("maxNum", maxNum);
		request.setAttribute("depths", depths);
		request.setAttribute("parent", parent);
		request.setAttribute("restDiv",n);
		request.setAttribute("lists", lists);
		
		return "project/list";
	}
	
	@RequestMapping(value = "/buseocreated", method = {RequestMethod.GET,RequestMethod.POST})
	public String buseoCreate(HttpServletRequest request,HttpServletResponse response,BuseoDTO dto) {
	
		
		Integer buseoNum = Integer.parseInt(request.getParameter("num"));
		System.out.println(buseoNum);
		if(buseoNum.equals(0) || buseoNum.equals(null)){
			
			
			
			int maxNum = insaDAO.maxNum();
			dto.setBuseoNum(maxNum+1);
			dto.setGroupNum(dto.getBuseoNum());
			dto.setDepth(0);
			dto.setOrderNo(0);
			dto.setParent(0);
			insaDAO.buseoCreated(dto);
		}else{
			dto = insaDAO.readData(buseoNum);
			if(dto.getDepth()==4){
				return "read-error";
			}
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
	
	
	
	@RequestMapping(value = "/buseodeleted", method = {RequestMethod.GET,RequestMethod.POST})
	public String buseoDeleted(HttpServletRequest request,HttpServletResponse response,BuseoDTO dto) {
		
		int buseoNum = Integer.parseInt(request.getParameter("num"));
		
		//원래 여기에 조건을 줘서 인사쪽을 확인하고 나서 있냐 없냐 여부 확인 후 없으면 삭제를 진행
		//아니면 에러 처리를 실행해서 삭제가 안되게 해야됨
		insaDAO.deleteBuseo(buseoNum);
		
		return buseolist(request, response);
	}
	
	

	@RequestMapping(value = "/buseoUpdated", method = {RequestMethod.GET,RequestMethod.POST})
	public String updated(HttpServletRequest request,HttpServletResponse response,BuseoDTO dto) throws UnsupportedEncodingException {
		
		int maxNum = insaDAO.maxNum();
				
		for(int i=1 ; i<maxNum+1; i++){
			
			String buseoName = request.getParameter("buseo"+i);
			
			if(buseoName!=null){
				int buseoNum = i;
				dto.setBuseoName(buseoName);
				dto.setBuseoNum(buseoNum);
				dto.setChecked("ok");
				insaDAO.updateBuseo(dto);
			}
		}
		
		return buseolist(request, response);
	}
	
	

}