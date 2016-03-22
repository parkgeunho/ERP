package com.exe.approval;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.exe.board.MyUtil;
import com.exe.insa.BuseoDTO;
import com.exe.insa.InsaDAO;
import com.exe.member.MemberDTO;

@Controller
public class ApprovalController {

	@Autowired
	@Qualifier("approvalDAO")
	ApprovalDAO approvalDAO;
	
	@Autowired
	@Qualifier("insaDAO")
	InsaDAO insaDAO;
	
	@Autowired
	@Qualifier("myUtil")
	MyUtil myUtil;
	
	@RequestMapping(value = "/approval", method={RequestMethod.GET,RequestMethod.POST})
	public String approval(HttpServletRequest request,HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		MemberDTO LoginDTO = (MemberDTO)session.getAttribute("dto");
		
		String userId = LoginDTO.getId();
		
		List<ApprovalDTO> listDTO = approvalDAO.approvalList(userId);
		
		request.setAttribute("LoginDTO", LoginDTO);
		request.setAttribute("listDTO", listDTO);
		
		return "approvalTile";
	}
	
	@RequestMapping(value = "/approvalArticle", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalArticle() {

		return "approval/approvalArticle";
	}

	@RequestMapping(value = "/approvalCreated", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalCreated(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		System.out.println("approvalCreated.Controller");
		
		HttpSession session = request.getSession();
		
		MemberDTO LoginDTO = (MemberDTO)session.getAttribute("dto");
				
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(num);
		
		ApprovalFormDTO dto = approvalDAO.getApprovalForm(num);
						
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
			hMap.put("buseoNum",vo.getBuseoNum());
			
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
		request.setAttribute("LoginDTO", LoginDTO);
		request.setAttribute("dto", dto);
		
		return "approval/approvalCreated";
	}	

	@RequestMapping(value="/approvalCreated_ok", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalCreated_ok(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		ApprovalDTO dto = new ApprovalDTO();
		
		System.out.println("approvalCreated_ok.Controller");
		
		response.setCharacterEncoding("UTF-8");

		SimpleDateFormat formatter = new SimpleDateFormat ("yyyy.MM.dd-");
		Date currentTime = new Date();
		String approvalNum = formatter.format ( currentTime );
		int approvalMax = approvalDAO.getApprovalMax(approvalNum)+1;
			
		approvalNum += approvalMax;
			
		System.out.println(approvalNum);
		
		String approvalType = request.getParameter("type");
		String subject = request.getParameter("subject");
		String content = request.getParameter("contentArea");		
				
		int approvalDepth = Integer.parseInt(request.getParameter("approvalDepth"));
				
		for(int i = 2; i < 8; i++ ){
			
			String approval = request.getParameter("depth"+i);
			
			System.out.println(approval);
			
			if(i==2){
				if(approval==null){
					dto.setApproval2("X");
				}else{
					dto.setApproval2(approval);
				}
			}
			if(i==3){
				if(approval==null){
					dto.setApproval3("X");
				}else{
					dto.setApproval3(approval);
				}
			}
			if(i==4){
				if(approval==null){
					dto.setApproval4("X");
				}else{
					dto.setApproval4(approval);
				}
			}
			if(i==5){
				if(approval==null){
					dto.setApproval5("X");
				}else{
					dto.setApproval5(approval);
				}
			}
			if(i==6){
				if(approval==null){
					dto.setApproval6("X");
				}else{
					dto.setApproval6(approval);
				}
			}			
		}
		
		SimpleDateFormat TimeFormat = new SimpleDateFormat ("yyyy-MM-dd_HH.mm.ss");
		Date createdTime = new Date();
		String created = TimeFormat.format (createdTime);
		dto.setCreated(created);
		dto.setId(request.getParameter("depth1"));
		dto.setType(approvalType);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setApprovalNum(approvalNum);
				
		approvalDAO.insertApproval(dto);
		
		return null;	
	}

	@RequestMapping(value = "/approvalTest", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalTest(HttpServletRequest request) {
		


		return "approval/approvalTest";
	}	
	
	@RequestMapping(value = "/approvalLine", method=RequestMethod.GET)
	public String approvalLine(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		System.out.println("approvalLine.Controller");
		
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
			hMap.put("buseoNum",vo.getBuseoNum());
			
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
	
	@RequestMapping(value = "/approvalPop", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalPop(HttpServletRequest request , HttpServletResponse response) throws Exception{
			
		System.out.println("approvalPop.Controller");
				
		List<ApprovalFormDTO> lists = approvalDAO.approvalFormList();
		List<ApprovalFormDTO> Typelists = approvalDAO.getApprovalFormType();
				
		request.setAttribute("Typelists", Typelists);
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
	
	@RequestMapping(value = "/approvalMemberList", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalMemberList(HttpServletRequest request , HttpServletResponse response) throws Exception{
		
		System.out.println("approvalMemberList.Controller");

		String cp = request.getContextPath();
		String num = request.getParameter("num");
		
		BuseoDTO dto = new BuseoDTO();		
		
		int max = 15;
		
		if(num == null){
			
			num="1";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("buseoNum", num);
		
		int buseoNum = Integer.parseInt(num);
		int currentPage = 1;
		
		String searchValue = request.getParameter("searchValue");
				
		dto = insaDAO.readBuseo(buseoNum);
		
		if(dto==null){
			request.setAttribute("max", max);
			return "approval/approvalMemberList";
		}
		
		int depth = dto.getDepth();
		
		String depth1 = "";
		String depth2 = "";
		String depth3 = "";
		String depth4 = "";
		String depth5 = "";
		
		for(int i = depth; i>=0 ; i--){
			
			if(i==4){
				
				depth5 = dto.getBuseoNum();
			}
			if(i==3){
				
				depth4 = dto.getBuseoNum();
			}
			if(i==2){
			
				depth3 = dto.getBuseoNum();
			}
			if(i==1){
				
				depth2 = dto.getBuseoNum();
			}
			if(i==0){
				
				depth1 = dto.getBuseoNum();
			}
			dto = insaDAO.readBuseo(dto.getParent());
		}
	
		if(searchValue==null){
			searchValue="";
		}else{
			if(request.getMethod().equalsIgnoreCase("GET"))
		
			searchValue = URLDecoder.decode(searchValue,"UTF-8");
		}				
		
		int dataCount = insaDAO.dataCount(depth1,depth2,depth3,depth4,depth5,searchValue);
				
		int numPerPage = 99;
		
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage>totalPage)
			currentPage=totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<MemberDTO> lists = insaDAO.getMemberList(start,end,depth1,depth2,depth3,depth4,depth5,searchValue);
		
		ListIterator<MemberDTO> it = lists.listIterator();
		while(it.hasNext()){
			MemberDTO mDto = it.next();
			BuseoDTO bDto = null;

			if(mDto.getDepth1()!="no" && !mDto.getDepth1().equals("no")){

				bDto = insaDAO.readBuseo(Integer.parseInt(mDto.getDepth1()));
			
				mDto.setDepth1(bDto.getBuseoName()+" ▶ ");
			}else if(mDto.getDepth1().equals("no") || mDto.getDepth1()=="no"){

				mDto.setDepth1("");

			}
			
			
			
			if(mDto.getDepth2()!="no" && !mDto.getDepth2().equals("no")){
	
				bDto = insaDAO.readBuseo(Integer.parseInt(mDto.getDepth2()));
				mDto.setDepth2(bDto.getBuseoName()+" ▶ ");
				
			}else if(mDto.getDepth2().equals("no") || mDto.getDepth2()=="no"){
	
				mDto.setDepth2("");

			}
			
			
			if(mDto.getDepth3()!="no" && !mDto.getDepth3().equals("no") ){
			
				bDto = insaDAO.readBuseo(Integer.parseInt(mDto.getDepth3()));
				mDto.setDepth3(bDto.getBuseoName()+" ▶ ");
				
			}else if(mDto.getDepth3().equals("no") || mDto.getDepth3()=="no"){

				mDto.setDepth3("");
		
			}
			
			
			
			if(mDto.getDepth4()!="no" && !mDto.getDepth4().equals("no")){
				bDto = insaDAO.readBuseo(Integer.parseInt(mDto.getDepth4()));
				mDto.setDepth4(bDto.getBuseoName()+" ▶ ");
				
			}else if(mDto.getDepth4().equals("no") || mDto.getDepth4()=="no"){

				mDto.setDepth4("");
		
			}
			
			
			
			if(mDto.getDepth5()!="no" && !mDto.getDepth5().equals("no")){
				bDto = insaDAO.readBuseo(Integer.parseInt(mDto.getDepth5()));
				mDto.setDepth5(bDto.getBuseoName());
			}else if(mDto.getDepth5().equals("no") || mDto.getDepth5()=="no"){
				mDto.setDepth5("");
			}
			
		}
				
		String listUrl = cp +"/approvalMemberList";
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		int size = lists.size();
				
		request.setAttribute("max", max);
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("size", size);
		request.setAttribute("dataCount", dataCount);
		
						
		return "approval/approvalMemberList";
		
	}
	
	@RequestMapping(value = "/approvalOptionList", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalOptionList(HttpServletRequest request , HttpServletResponse response) throws Exception{
				
		String id = request.getParameter("id");
		id = id.substring(1, id.length()-1);
		
		MemberDTO dto = new MemberDTO();
		
		dto = approvalDAO.getApprovalMember(id);
				
		request.setAttribute("dto", dto);
		
		return "approval/approvalOptionList";
	}

	@RequestMapping(value = "/approvalLineOK_Ajax", method={RequestMethod.GET,RequestMethod.POST})
	public String approvalLineOK_Ajax(HttpServletRequest request , HttpServletResponse response) throws Exception{
				
		int num = Integer.parseInt(request.getParameter("num"))-1;
			
		List<MemberDTO> lists = new ArrayList<MemberDTO>();
						
		for(int i = num; i > 0; i--){
			System.out.println(i);
			lists.add(approvalDAO.getApprovalMember(request.getParameter("id"+i)));	
		}
		
		request.setAttribute("num", num);
		request.setAttribute("lists", lists);
		
		return "approval/approvalLine";
	}

	@RequestMapping(value = "/aptest", method={RequestMethod.GET,RequestMethod.POST})
	public String aptest(HttpServletRequest request , HttpServletResponse response) throws Exception{
				
		String haha = "haha";
		
		request.setAttribute("haha", haha);
		
		return "approval/approvalRight";
	}
	
	
	
	//HttpSession session = request.getSession();

}
