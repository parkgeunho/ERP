package com.exe.insa;


import java.util.ArrayList;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
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

import com.exe.approval.ApprovalDAO;
import com.exe.erp.NoteDAO;
import com.exe.member.MemberDAO;
import com.exe.member.MemberDTO;
import com.exe.schedule.ScheduleDAO;



@Controller
public class ListController {
	
	@Autowired
	@Qualifier("ListDAO")
	ListDAO listDAO;
	
	@Autowired
	@Qualifier("insaDAO")
	InsaDAO insaDAO;
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO memberDAO;
	
	@Autowired
	@Qualifier("NoteDAO")
	NoteDAO NoteDAO;
	
	@Autowired
	@Qualifier("approvalDAO")
	ApprovalDAO approvalDAO;
	
	@Autowired
	@Qualifier("scheduleDAO")
	ScheduleDAO dao;
	
	
	
	@RequestMapping(value = "/con", method = {RequestMethod.GET,RequestMethod.POST})
	public String controlMain(HttpServletRequest request,HttpServletResponse response) {
		
		
		//상단 메뉴바 관련 
		HttpSession session = request.getSession();
		MemberDTO LoginDTO = (MemberDTO)session.getAttribute("dto");
		
		int readCount = NoteDAO.ReadCount(Integer.toString(LoginDTO.getNum()));

		request.setAttribute("readCount", readCount);
		request.setAttribute("LoginDTO", LoginDTO);
		//상단바 개인 사진을 불러오기 위한 값
		String LoginimagePath = request.getContextPath() + "/resources/memberImage";
		request.setAttribute("LoginimagePath",LoginimagePath);
		//상단바 개인 사진을 불러오기 위한 값
		
		
		int approvalCount = approvalDAO.approvalNextIngCount(LoginDTO.getId());

	
		request.setAttribute("approvalCount", approvalCount);
		
		int scheduleCount = dao.getDataCount(LoginDTO.getId());
		request.setAttribute("scheduleCount",scheduleCount);
		
		
		//상단 메뉴바 관련 
		
		
		
		
		
		
		
		
		
		List<ListDTO> boardlists = listDAO.boardList();
		
		ListIterator<ListDTO> it = boardlists.listIterator();
		
		int depth = -1;
		int n =0;
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		while(it.hasNext()){
			
			ListDTO vo = it.next();
	
			
			vo.setDepthGap(depth - vo.getDepth() + 1);
	         
	        depth = vo.getDepth();
			n++;
		/*	hMap.put("groupNum", Integer.toString(vo.getGroupNum()));
			hMap.put("depth", Integer.toString(vo.getDepth()));
			hMap.put("listNum",Integer.toString(vo.getListNum()));
			
			vo.setReplyNum(listDAO.replyNum(hMap));

			hMap.put("replyNum", vo.getReplyNum());
			listDAO.updateReply(hMap);*/

		}
		
		int maxNum = listDAO.maxNum();
		List<ListDTO> parent = listDAO.getGroup();
		List<ListDTO> depths = listDAO.getDepth();
		request.setAttribute("maxNum", maxNum);
		request.setAttribute("depths", depths);
		request.setAttribute("parent", parent);
		request.setAttribute("restDiv",n);
		request.setAttribute("boardlists", boardlists);
		
		
		
		List<BuseoDTO> buseolists = insaDAO.buseoList();
		
		ListIterator<BuseoDTO> buseoit = buseolists.listIterator();
		
		int buseoDepth = -1;
		int buseoN =0;
		
		Map<String, Object> buseoMap = new HashMap<String, Object>();
		while(buseoit.hasNext()){
			
			BuseoDTO vo = buseoit.next();
	
			
			vo.setDepthGap(buseoDepth - vo.getDepth() + 1);
	         
			buseoDepth = vo.getDepth();
	        buseoN++;
	        buseoMap.put("groupNum", Integer.toString(vo.getGroupNum()));
	        buseoMap.put("depth", Integer.toString(vo.getDepth()));
	        buseoMap.put("buseoNum",vo.getBuseoNum());
			
			vo.setReplyNum(insaDAO.replyNum(buseoMap));
			
			
			buseoMap.put("replyNum", vo.getReplyNum());
			insaDAO.updateReply(buseoMap);
			
			
		}
		
		int buseoMaxNum = insaDAO.maxNum();
		List<BuseoDTO> buseoParent = insaDAO.getGroup();
		List<BuseoDTO> buseoDepths = insaDAO.getDepth();
		request.setAttribute("buseoMaxNum", buseoMaxNum);
		request.setAttribute("buseoDepths", buseoDepths);
		request.setAttribute("buseoParent", buseoParent);
		request.setAttribute("buseoN",buseoN);
		request.setAttribute("buseolists", buseolists);


		List<MemberDTO> memberList = listDAO.memberList();
		
		Iterator<MemberDTO> ck = memberList.iterator();
		while(ck.hasNext()){
			
			MemberDTO MemberDTO = ck.next();
			
			String ckdepth = null;
			
			if(!(MemberDTO.getDepth1().equals("no"))){
				ckdepth = MemberDTO.getDepth1();
			}
			if(!(MemberDTO.getDepth2().equals("no"))){
				ckdepth = MemberDTO.getDepth2();
			}
			if(!(MemberDTO.getDepth3().equals("no"))){
				ckdepth = MemberDTO.getDepth3();
			}
			if(!(MemberDTO.getDepth4().equals("no"))){
				ckdepth = MemberDTO.getDepth4();
			}
			if(!(MemberDTO.getDepth5().equals("no"))){
				ckdepth = MemberDTO.getDepth5();
			}
			
			MemberDTO.setCkdepth(ckdepth);
			
			System.out.println( MemberDTO.getName() + "이사람의 댑스=" + MemberDTO.getCkdepth());
		}
		
		int memberMaxNum = memberDAO.maxNum();
		request.setAttribute("memberMaxNum", memberMaxNum);
		request.setAttribute("memberList", memberList);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		return "boardtest";
	}
	
	@RequestMapping(value = "/boardListCreate", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardCreate(HttpServletRequest request,HttpServletResponse response,ListDTO dto) {
		
		Integer listNum = Integer.parseInt(request.getParameter("num"));
		if(listNum.equals(0) || listNum.equals(null)){
			
			
			
			int maxNum = listDAO.maxNum();
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
	
	
	@RequestMapping(value = "/boardListDelete", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardDeleted(HttpServletRequest request,HttpServletResponse response,ListDTO dto) {
		
		int listNum = Integer.parseInt(request.getParameter("num"));
		
		dto =  listDAO.readData(listNum);
				
		if(dto.getReplyNum()!=0){
			
			listDAO.boardReplyDelete(dto.getListNum()); //하위 게시판의 게시물 삭제
			
		}
			
		
		listDAO.boardListDelete(listNum); //게시판 안에 있는 게시물들 지우기
		
		listDAO.boardDelete(listNum); //하위 게시판까지 삭제 시키기
		
		return boardList(request, response);
	}
	
	@RequestMapping(value = "/boardUpdate", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardUpdate(HttpServletRequest request,HttpServletResponse response,String ck) {
		
		
		List<BuseoDTO> buseoWlist = new ArrayList<BuseoDTO>();
		List<BuseoDTO> buseoRlist = new ArrayList<BuseoDTO>();
		List<MemberDTO> memberRlist = new ArrayList<MemberDTO>();
		List<MemberDTO> memberWlist = new ArrayList<MemberDTO>();
		String listNum = request.getParameter("listNum");
		if(listNum==null || listNum.equals("")){
			
			if(ck!=null){
				listNum=ck;
			}
			else{
				return "control/boardUpdate";
			}
			
		}

		
		int listNumber = Integer.parseInt(listNum);
		
		ListDTO dto = listDAO.readData(listNumber);
		if(dto.getBuseoW()!=null){
			String buseoWs[] = dto.getBuseoW().split(",");
		
		
			for(String i : buseoWs){
				
				int j = Integer.parseInt(i);
				BuseoDTO bDTO = insaDAO.readBuseo(j);
				buseoWlist.add(bDTO);
				if(buseoWlist!=null)
					request.setAttribute("buseoWlist", buseoWlist);
				
			}
		}
		
		if(dto.getBuseoR()!=null){
			String buseoRs[] = dto.getBuseoR().split(",");
			
			for(String i : buseoRs){
				
				int j = Integer.parseInt(i);
				BuseoDTO bDto = insaDAO.readBuseo(j);
				buseoRlist.add(bDto);
				if(buseoRlist!=null)
					request.setAttribute("buseoRlist", buseoRlist);
				
			}
		}
		
		if(dto.getMemberR()!=null){
			String memberRs[] =  dto.getMemberR().split(",");
			
			for(String i : memberRs){
				int j = Integer.parseInt(i);
				MemberDTO mDTO = memberDAO.readOne(j);
				memberRlist.add(mDTO);
				if(memberRlist!=null)
					request.setAttribute("memberRlist", memberRlist);
			}
			
		}
		
		if(dto.getMemberW()!=null){
			String memberWs[] = dto.getMemberW().split(",");
			
			for(String i : memberWs){
				int j = Integer.parseInt(i);
				MemberDTO mDTO = memberDAO.readOne(j);
				memberWlist.add(mDTO);
				if(memberWlist!=null)
					request.setAttribute("memberWlist", memberWlist);
			}
			
		}
		
		
		
		request.setAttribute("boardData", dto);
		
		return "control/boardUpdate";
	}
	
	
	//왼쪽에 있는 리스트 에서 권한 추가할때 사용하는 메소드 읽기 쓰기 에 모두 추가
	@RequestMapping(value = "/boardAdd", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardAdd(HttpServletRequest request,HttpServletResponse response) {
		
		String group = request.getParameter("group");
		String num = request.getParameter("num");
		
		String date = group.substring(4);
		String sort = group.substring(0, 3);
		
		String arrayW = "";
		String arrayR = "";
		if(sort.equals("Bus")){
			int listNum = Integer.parseInt(num);
			
			ListDTO dto = listDAO.readData(listNum);
			dto.setListNum(listNum);
			
			String BuseoW = dto.getBuseoW() ;
			String BuseoR = dto.getBuseoR() ;
			
			if(BuseoR==null||BuseoR.equals("")){
				arrayR = date+",";
			}else{
				String BuseoRs[] = BuseoR.split(",");
				
				for(String i : BuseoRs){
					if(i.equals(date)){
						return "read-error";
					}
				
					arrayR += i +",";
				}
				arrayR += date + ",";
				
			}
			if(BuseoW==null || BuseoW.equals("")){
				arrayW = date+",";
			}else{
				String BuseoWs[] = BuseoW.split(",");
				
				for(String i :BuseoWs){
					
					if(i.equals(date)){
						return "read-error";
					}
					arrayW += i + ",";
				}
				arrayW += date + ",";
			}
			
			dto.setBuseoR(arrayR);
			dto.setBuseoW(arrayW);
			
			listDAO.boardBuseo(dto);
			
		}
		
		if(sort.equals("Mem")){

			int listNum = Integer.parseInt(num);
			ListDTO dto = listDAO.readData(listNum);
			String MemberW = dto.getMemberW() ;
			String MemberR = dto.getMemberR() ;
			
			
			if(MemberR==null || MemberR.equals("")){
				arrayR = date+",";
			}else{
				
				
				String memberRs[] = MemberR.split(",");
				
				for(String i : memberRs){
					if(i.equals(date)){
						return "read-error";
					}
					
					arrayR += i +",";
				}
				arrayR += date + ",";
				
				
				
				
			}
			
			if(MemberW==null || MemberW.equals("")){
				arrayW = date+",";
			}else{
				String memberWs[] = MemberW.split(",");
				
				for(String i :memberWs){
					
					if(i.equals(date)){
						return "read-error";
					}
					arrayW += i + ",";
				}
				arrayW += date + ",";
				
				
			}
			
			
			dto.setMemberR(arrayR);
			dto.setMemberW(arrayW);
			listDAO.boardMember(dto);
			
		}
		
		
		return boardUpdate(request, response,num);
	}
	
	@RequestMapping(value = "/boardSideUpdate", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardSideUpdate(HttpServletRequest request,HttpServletResponse response) {
		
		String ckNum = request.getParameter("ckNum");
		String num = request.getParameter("num");
		String change = request.getParameter("change");
		
		String date = ckNum.substring(4); //숫자확인
		String sort = ckNum.substring(0, 3); //어디껀지 확인하는용
		
		
		int listNum = Integer.parseInt(num);
		
		ListDTO dto = listDAO.readData(listNum);
		
		if(sort.equals("Bus")){
			
			if(change.equals("write")){
				
				if(dto.getBuseoW()==null){
					dto.setBuseoW(date+",");
				}
				String buseoWs[] = dto.getBuseoW().split(",");
				List<String> list = new ArrayList<String>();
				Collections.addAll(list, buseoWs);
				boolean isFind = list.contains(date);
				if(isFind){
					System.out.println("중복값있음");
				}else{
					System.out.println("중복값없어서 내려옴");
				list.add(date);
				Iterator<String> it = list.iterator();
				String buseoW="";
					while(it.hasNext()){
						
						buseoW += it.next()+",";
						
					}
				dto.setBuseoW(buseoW);
				}
				
			}
			
			if(change.equals("non")){
				
				if(dto.getBuseoW()==null){
					
					return boardUpdate(request, response, num);
				}
				
				List<String> list = new ArrayList<String>();
				String buseoWs[] = dto.getBuseoW().split(",");
				Collections.addAll(list, buseoWs);
				list.remove(date);
				Iterator<String> it = list.iterator();
				String buseoW ="";
				
				while(it.hasNext()){
					buseoW += it.next()+",";
					
					
				}
				dto.setBuseoW(buseoW);
				
			}
				listDAO.boardBuseo(dto);
			
		}
		if(sort.equals("Mem")){
			
			if(change.equals("write")){
				
				if(dto.getMemberW()==null){
					dto.setMemberW(date+",");
				}
					String MemberWs[] = dto.getMemberW().split(",");
					List<String> list = new ArrayList<String>();
					Collections.addAll(list, MemberWs);
					boolean isFind = list.contains(date);
					if(isFind){
						System.out.println("중복값있음");
					}else{
						System.out.println("중복값없어서 내려옴");
					list.add(date);
					Iterator<String> it = list.iterator();
					String memberW="";
						while(it.hasNext()){
							
							memberW += it.next()+",";
							
						}
					dto.setMemberW(memberW);
					}
				
			}
			
			if(change.equals("non")){
				
				if(dto.getMemberW()==null){
					
					return boardUpdate(request, response, num);
				}
				
				List<String> list = new ArrayList<String>();
				String memberWs[] = dto.getMemberW().split(",");
				Collections.addAll(list, memberWs);
				list.remove(date);
				Iterator<String> it = list.iterator();
				String memberW ="";
				
				while(it.hasNext()){
					memberW += it.next()+",";
					
					
				}
				dto.setMemberW(memberW);
				
			}
				listDAO.boardMember(dto);
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		return boardUpdate(request, response, num);
	}
	
	
	
	@RequestMapping(value = "/boardSide", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardSide(HttpServletRequest request,HttpServletResponse response) {
		
		String ckNum = request.getParameter("ckNum");
		String boardNum = request.getParameter("num");
		
		int listNum = Integer.parseInt(boardNum);
		
		String date = ckNum.substring(4); //숫자확인
		String sort = ckNum.substring(0, 3); //어디껀지 확인하는용
		String ck = null;
		request.setAttribute("sort", sort);
		ListDTO dto = listDAO.readData(listNum);
		
		if(sort.equals("Bus")){
			
			BuseoDTO bDTO = insaDAO.readBuseo(Integer.parseInt(date));
			
			int depth = bDTO.getDepth();
			
			String depth1 = "";
			String depth2 = "";
			String depth3 = "";
			String depth4 = "";
			String depth5 = "";
			String depth1s =date;
			String depth2s =date;
			String depth3s =date;
			String depth4s =date;
			String depth5s =date;
			
			
			
			
			for(int i = depth; i>=0 ; i--){
				
				if(i==4){
					
					depth5 = bDTO.getBuseoName();
				}
				if(i==3){
					
					depth4 = bDTO.getBuseoName() +"▶";
				}
				if(i==2){
				
					depth3 = bDTO.getBuseoName() +"▶";
				}
				if(i==1){
					
					depth2 = bDTO.getBuseoName() +"▶";
				}
				if(i==0){
					
					depth1 = bDTO.getBuseoName() +"▶";
				}
				bDTO = insaDAO.readBuseo(bDTO.getParent());
			}
			
			
			
			
			int count = insaDAO.deletecheck(depth1s, depth2s, depth3s, depth4s, depth5s);
			
			String lastDepth1 = depth1 + depth2;
			String lastDepth2 =  depth3 + depth4 + depth5;
			request.setAttribute("count", count);
			request.setAttribute("lastDepth1", lastDepth1);
			request.setAttribute("lastDepth2", lastDepth2);
			
			

			if(dto.getBuseoW()!=null){
			String buseoWs[] = dto.getBuseoW().split(",");
			
				for(String i : buseoWs){
					if(i.equals(date)){
						ck ="ok";
					}	
				}
			}
		}
		
		if(sort.equals("Mem")){
			
			MemberDTO mDto = memberDAO.readOne(Integer.parseInt(date));
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
			
			
					
			request.setAttribute("mDTO",mDto);
			
			
			
			
			
			if(dto.getMemberW()!=null){
				String memberWs[] = dto.getMemberW().split(",");
				
				for(String i:memberWs){
					
					if(i.equals(date))
						ck ="ok";
					
				}
			}
			
		}
		
			
		
		request.setAttribute("ck", ck);
		return "control/boardUpdateSide";
	}
	//게시판 이름 바꾸기 
	@RequestMapping(value = "/boardChange", method = {RequestMethod.GET,RequestMethod.POST})
	public void boardChange(HttpServletRequest request,HttpServletResponse response) {
		
		String boardName = request.getParameter("boardName");
		int listNum = Integer.parseInt(request.getParameter("num"));
		
		ListDTO dto = listDAO.readData(listNum);
		dto.setBoardName(boardName);
		
		listDAO.boardUpdate(dto);
		
	
	}
	@RequestMapping(value = "/boardDeleteControl", method = {RequestMethod.GET,RequestMethod.POST})
	public void boardControlDelete(HttpServletRequest request,HttpServletResponse response) {
		
		
		String ckNum = request.getParameter("ckNum");
		String num = request.getParameter("num");
		
		
		String date = ckNum.substring(4); //숫자확인
		String sort = ckNum.substring(0, 3); //어디껀지 확인하는용
		
		
		int listNum = Integer.parseInt(num);
		
		ListDTO dto = listDAO.readData(listNum);
		
		
		if(sort.equals("Bus")){
			
				
				List<String> list = new ArrayList<String>();
				String buseoWs[] = dto.getBuseoW().split(",");
				Collections.addAll(list, buseoWs);
				list.remove(date);
				Iterator<String> it = list.iterator();
				String buseoW ="";
				
				while(it.hasNext()){
					buseoW += it.next()+",";
					
				}				
				
				List<String> Rlist = new ArrayList<String>();
				String buseoRs[] = dto.getBuseoR().split(",");
				Collections.addAll(Rlist, buseoRs);
				Rlist.remove(date);
				Iterator<String> itR = Rlist.iterator();
				String buseoR="";
				while(itR.hasNext()){
					buseoR += itR.next()+",";
				}

				dto.setBuseoR(buseoR);
				dto.setBuseoW(buseoW);
				listDAO.boardBuseo(dto);
				
		}
				
			
		
		if(sort.equals("Mem")){

			
				List<String> list = new ArrayList<String>();
				String memberWs[] = dto.getMemberW().split(",");
				Collections.addAll(list, memberWs);
				list.remove(date);
				Iterator<String> it = list.iterator();
				String memberW ="";
				
				while(it.hasNext()){
					memberW += it.next()+",";
					
					
			}
				
				List<String> Rlist = new ArrayList<String>();
				String memberRs[] = dto.getMemberR().split(",");
				Collections.addAll(Rlist, memberRs);
				Rlist.remove(date);
				Iterator<String> itR = Rlist.iterator();
				String memberR ="";
				
				while(itR.hasNext()){
					memberR += itR.next()+",";
					
					
			}
				
				
				dto.setMemberR(memberR);
				dto.setMemberW(memberW);
				listDAO.boardMember(dto);
		}
				
			

	}
	
	
	
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
