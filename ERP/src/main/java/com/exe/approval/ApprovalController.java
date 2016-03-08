package com.exe.approval;

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

import com.exe.insa.BuseoDTO;
import com.exe.insa.InsaDAO;


@Controller
public class ApprovalController {

	@Autowired
	@Qualifier("insaDAO")
	InsaDAO insaDAO;
	
	@RequestMapping(value = "/approval", method=RequestMethod.GET)
	public String scheduleMain() {
		
		return "approvalTile";
	}
	
	@RequestMapping(value = "/approvalArticle", method = RequestMethod.GET)
	public String approvalArticle() {

		return "approval/approvalArticle";
	}

	@RequestMapping(value = "/approvalCreated", method = RequestMethod.GET)
	public String approvalCreated() {
		
		return "approval/approvalCreated";
	}	

	@RequestMapping(value="/approvalCreated_ok", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalCreated_ok(ApprovalDTO dto, HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		return "ok";	
		
	}

	@RequestMapping(value = "/approvalTest", method = RequestMethod.GET)
	public String approvalTest(HttpServletRequest request) {
		


		return "approval/approvalTest";
	}	
	
	//
	@RequestMapping(value = "/approvalLine", method = RequestMethod.GET)
	public String approvalLine(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
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
	
		return "approval/approvalLine";
		
	}		
	
	
	@RequestMapping(value = "/approvalPop", method = RequestMethod.GET)
	public String approvalPop(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		System.out.println("approvalPop.Controller");
		
		
		return "approval/approvalPop";
	}
	
	//HttpSession session = request.getSession();

	
	
}
