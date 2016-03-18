package com.exe.insa;


import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import com.exe.member.MemberDTO;




@Controller
public class InsaController {
	
	
	@Autowired
	@Qualifier("insaDAO")
	InsaDAO insaDAO;
	
	@Autowired
	MyUtil myUtil;
	
	
	//메인 홈페이지 이동
	@RequestMapping(value = "/insa", method = {RequestMethod.GET,RequestMethod.POST})
	public String mainboard(HttpServletRequest request,HttpServletResponse response) {
	
		
		
		HttpSession session = request.getSession();
		session.setAttribute("buseoNum", "1");
		
		MemberDTO LoginDTO = (MemberDTO)session.getAttribute("dto");
		
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
			hMap.put("buseoNum",(vo.getBuseoNum()));
			
			vo.setReplyNum(insaDAO.replyNum(hMap));
			
			
			hMap.put("replyNum", vo.getReplyNum());
			insaDAO.updateReply(hMap);
			
			
		}
		
		List<BuseoDTO> parent = insaDAO.getGroup();
		List<BuseoDTO> depths = insaDAO.getDepth();
		
		
		request.setAttribute("LoginDTO", LoginDTO);
		request.setAttribute("depths", depths);
		request.setAttribute("parent", parent);
		request.setAttribute("restDiv",n);
		request.setAttribute("lists", lists);
		
		
		
		
		
		return "buseo";
	}
	
	

	
	@RequestMapping(value = "/extest", method = RequestMethod.GET)
	public String test(HttpServletRequest request,HttpServletResponse response) {
		
	
		

	
		return "ex";
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
			hMap.put("buseoNum",(vo.getBuseoNum()));
			
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
		
		if(buseoNum.equals(0) || buseoNum.equals(null)){
			
			
			
			int maxNum = insaDAO.maxNum()+1;
			dto.setBuseoNum(Integer.toString(maxNum));
			dto.setGroupNum(Integer.parseInt(dto.getBuseoNum()));
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
	
			Map<String, Object> hMap = new HashMap<String, Object>();
		      hMap.put("groupNum", dto.getGroupNum());
		      hMap.put("orderNo", dto.getOrderNo());
		      insaDAO.updateOrder(hMap);
		      
		      dto.setParent(Integer.parseInt(dto.getBuseoNum()));
		      int maxNum = insaDAO.maxNum()+1;
		      dto.setBuseoNum(Integer.toString(maxNum));
		      dto.setBuseoName("수정해주세요");
		      dto.setDepth(dto.getDepth()+1);
		      dto.setOrderNo(dto.getOrderNo()+1);
		      
		      insaDAO.buseoCreated(dto);
		      
			
		}
		
		return buseolist(request, response);
		
	}
	
	
	
	@RequestMapping(value = "/buseodeleted", method = {RequestMethod.GET,RequestMethod.POST})
	public String buseoDeleted(HttpServletRequest request,HttpServletResponse response,BuseoDTO dto) {
		
		
		String num = request.getParameter("num");
		int buseoNum = Integer.parseInt(num);
		response.setCharacterEncoding("UTF-8");
		
		
		//원래 여기에 조건을 줘서 인사쪽을 확인하고 나서 있냐 없냐 여부 확인 후 없으면 삭제를 진행
		String depth1 = num;
		String depth2 = num;
		String depth3 = num;
		String depth4 = num;
		String depth5 = num;
		
		
		int count = insaDAO.deletecheck(depth1, depth2, depth3, depth4, depth5);
		if(count>0){
			try {
	            
				
	            PrintWriter writer = response.getWriter();

	            writer.println("<script type='text/javascript'>");

	            writer.println("alert('부서에 사원이 존재합니다.');");

	            writer.println("history.back();");

	            writer.println("</script>");

	            writer.flush();
	            
	            return buseolist(request, response);
	            
	         } catch (Exception e) {
	         
	         }
		}
		
		
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
				dto.setBuseoNum(Integer.toString(buseoNum));
				dto.setChecked("ok");
				insaDAO.updateBuseo(dto);
			}
		}
		
		return buseolist(request, response);
	}
	
	
	//사원정보 아작스 리스트로 출력하기 위한것
	@RequestMapping(value = "/memberList", method = {RequestMethod.GET,RequestMethod.POST})
	public String memberList(HttpServletRequest request,HttpServletResponse response,BuseoDTO dto) throws UnsupportedEncodingException {
		
		String cp = request.getContextPath();
		String num = request.getParameter("num");
		
		
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
			return "project/memberList";
			
			
			
			
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
		
		int numPerPage = 15;
		
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
	;
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
		
		
		
		
		
		
		String listUrl = cp +"/memberList";
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		int size = lists.size();
		
		
		request.setAttribute("max", max);
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("size", size);
		request.setAttribute("dataCount", dataCount);
		
		
		
		return "project/memberList";
	}
	
	

}