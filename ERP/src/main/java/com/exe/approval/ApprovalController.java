package com.exe.approval;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ApprovalController {

	@Autowired
	@Qualifier("approvalDAO")
	ApprovalDAO approvalDAO;
	
	@RequestMapping(value = "/approval", method={RequestMethod.GET,RequestMethod.POST})
	public String scheduleMain() {
		
		return "approvalTile";
	}
	
	@RequestMapping(value = "/approvalArticle", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalArticle() {

		return "approval/approvalArticle";
	}

	@RequestMapping(value = "/approvalCreated", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalCreated(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		System.out.println("approvalCreated.Controller");
				
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(num);
		
		ApprovalFormDTO dto = approvalDAO.getApprovalForm(num);
				
		request.setAttribute("dto", dto);
		
		return "approval/approvalCreated";
	}	

	@RequestMapping(value="/approvalCreated_ok", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalCreated_ok(ApprovalDTO dto, HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		return "ok";	
		
	}

	@RequestMapping(value = "/approvalTest", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalTest(HttpServletRequest request) {
		


		return "approval/approvalTest";
	}	
	
	//
	@RequestMapping(value = "/approvalLine.action", method=RequestMethod.GET)
	public String approvalLine(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		System.out.println("approvalLine.Controller");
		
		/*List<BuseoDTO> lists = insaDAO.buseoList();
		
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
	
		 */
	
		return "approval/approvalLine";
		
	}		
	
	@RequestMapping(value = "/approvalPop", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalPop(HttpServletRequest request , HttpServletResponse response) throws Exception{
			
		System.out.println("approvalPop.Controller");
				
		List<ApprovalFormDTO> lists = approvalDAO.approvalFormList();
				
		request.setAttribute("lists", lists);
						
		return "approval/approvalPop";
	}
	
	@RequestMapping(value = "/approvalFormCreated", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalFormCreated(HttpServletRequest request , HttpServletResponse response) throws Exception{
		return "approval/approvalFormCreated";
	}
	
	
	
	@RequestMapping(value = "/approvalForm_ok", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalForm_ok(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		int approvalMaxnum = approvalDAO.approvalFormMaxNum(); 
		
		approvalMaxnum++;
		
		String message = "";
		String content,name,type;
				
		ApprovalFormDTO dto = new ApprovalFormDTO(); 
				
		name = request.getParameter("approvalFormName");
		content = request.getParameter("approvalFormContent");
		type = request.getParameter("approvalFormType");
			
		dto.setApprovalFormContent(content);
		dto.setApprovalFormName(name);
		dto.setApprovalFormNum(approvalMaxnum);
		dto.setApprovalFormType(type);
		
		approvalDAO.approvalFormInsert(dto);
	
		request.setAttribute("message", message);
		
		return "close"; 
		
	}
	
	
	
	//HttpSession session = request.getSession();

}
