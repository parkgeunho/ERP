package com.exe.insa;

import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ListController {
	
	@Autowired
	@Qualifier("ListDAO")
	ListDAO listDAO;
	
	@RequestMapping(value = "/con", method = {RequestMethod.GET,RequestMethod.POST})
	public String controlMain(HttpServletRequest request,HttpServletResponse response) {
		
		System.out.println("리스트컨트롤옴?옵니까");
		List<ListDTO> lists = listDAO.boardList();
		
		ListIterator<ListDTO> it = lists.listIterator();
		
		int depth = -1;
		int n =0;
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		while(it.hasNext()){
			
			ListDTO vo = it.next();
	
			
			vo.setDepthGap(depth - vo.getDepth() + 1);
	         
	        depth = vo.getDepth();
			n++;
			hMap.put("groupNum", Integer.toString(vo.getGroupNum()));
			hMap.put("depth", Integer.toString(vo.getDepth()));
			hMap.put("listNum",Integer.toString(vo.getListNum()));
			
			vo.setReplyNum(listDAO.replyNum(hMap));
			
			
			hMap.put("replyNum", vo.getReplyNum());
			listDAO.updateReply(hMap);
			
			
		}
		
		int maxNum = listDAO.maxNum();
		List<ListDTO> parent = listDAO.getGroup();
		List<ListDTO> depths = listDAO.getDepth();
		request.setAttribute("maxNum", maxNum);
		request.setAttribute("depths", depths);
		request.setAttribute("parent", parent);
		request.setAttribute("restDiv",n);
		request.setAttribute("lists", lists);
		
		System.out.println("어디서워프하는겨 ㅋㅋ");
		
		return "boardtest";
	}
	
	@RequestMapping(value = "/boardListCreate", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardCreate(HttpServletRequest request,HttpServletResponse response,ListDTO dto) {
		
		Integer listNum = Integer.parseInt(request.getParameter("num"));
		System.out.println("확인합니다" + listNum);
		if(listNum.equals(0) || listNum.equals(null)){
			
			
			
			int maxNum = listDAO.maxNum();
			System.out.println("맥스넘확인" + maxNum);
			dto.setListNum(maxNum+1);
			dto.setGroupNum(dto.getListNum());
			dto.setDepth(0);
			dto.setOrderNo(0);
			dto.setParent(0);
			listDAO.boardCreated(dto);
		}else{
			dto = listDAO.readData(listNum);
			if(dto.getDepth()==1){
				return "read-error";
			}
			dto = listDAO.readData(listNum);
	
			Map<String, Object> hMap = new HashMap<String, Object>();
		      hMap.put("groupNum", dto.getGroupNum());
		      hMap.put("orderNo", dto.getOrderNo());
		      listDAO.updateOrder(hMap);
		      
		      dto.setParent(dto.getListNum());
		      int maxNum = listDAO.maxNum();
		      dto.setListNum(maxNum+1);
		      
		      dto.setDepth(dto.getDepth()+1);
		      dto.setOrderNo(dto.getOrderNo()+1);
		      
		      listDAO.boardCreated(dto);
		      
			
		}
		
		return boardList(request, response);
	}
	
	@RequestMapping(value = "/boardControlList", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardList(HttpServletRequest request,HttpServletResponse response) {
		
		System.out.println("옵니까");
		List<ListDTO> lists = listDAO.boardList();
		
		ListIterator<ListDTO> it = lists.listIterator();
		
		int depth = -1;
		int n =0;
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		while(it.hasNext()){
			
			ListDTO vo = it.next();
	
			
			vo.setDepthGap(depth - vo.getDepth() + 1);
	         
	        depth = vo.getDepth();
			n++;
			hMap.put("groupNum", Integer.toString(vo.getGroupNum()));
			hMap.put("depth", Integer.toString(vo.getDepth()));
			hMap.put("listNum",Integer.toString(vo.getListNum()));
			
			vo.setReplyNum(listDAO.replyNum(hMap));
			
			
			hMap.put("replyNum", vo.getReplyNum());
			listDAO.updateReply(hMap);
			
			
		}
		
		int maxNum = listDAO.maxNum();
		List<ListDTO> parent = listDAO.getGroup();
		List<ListDTO> depths = listDAO.getDepth();
		request.setAttribute("maxNum", maxNum);
		request.setAttribute("depths", depths);
		request.setAttribute("parent", parent);
		request.setAttribute("restDiv",n);
		request.setAttribute("lists", lists);
		
		
		
		
		
		return "control/boardControlList";
	}
	
	
	
	
	
	
	
	
	
	
	

}
