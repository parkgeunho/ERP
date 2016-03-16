package com.exe.insa;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
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

import com.exe.member.MemberDTO;

import oracle.security.o5logon.b;

@Controller
public class ListController {
	
	@Autowired
	@Qualifier("ListDAO")
	ListDAO listDAO;
	
	@Autowired
	@Qualifier("insaDAO")
	InsaDAO insaDAO;
	
	@RequestMapping(value = "/con", method = {RequestMethod.GET,RequestMethod.POST})
	public String controlMain(HttpServletRequest request,HttpServletResponse response) {
		
		System.out.println("리스트컨트롤옴?옵니까");
		List<ListDTO> lists = listDAO.boardList();
		System.out.println("어디에러임 ㅅㅂ");
		
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
	        buseoMap.put("buseoNum",Integer.toString(vo.getBuseoNum()));
			
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
		
		request.setAttribute("memberList", memberList);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
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
	
	
	@RequestMapping(value = "/boardListDelete", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardDeleted(HttpServletRequest request,HttpServletResponse response,ListDTO dto) {
		
		int listNum = Integer.parseInt(request.getParameter("num"));
		
		//원래 여기에 조건을 줘서 인사쪽을 확인하고 나서 있냐 없냐 여부 확인 후 없으면 삭제를 진행
		//아니면 에러 처리를 실행해서 삭제가 안되게 해야됨
		listDAO.boardListDelete(listNum);
		
		return boardList(request, response);
	}
	
	@RequestMapping(value = "/boardUpdate", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardUpdate(HttpServletRequest request,HttpServletResponse response,String ck) {
		
		List<ListDTO> lists = new ArrayList<ListDTO>();
		List<BuseoDTO> buseoWlist = new ArrayList<BuseoDTO>();
		List<BuseoDTO> buseoRlist = new ArrayList<BuseoDTO>();
		String listNum = request.getParameter("listNum");
		System.out.println("ck확인 " + ck);
		if(listNum==null || listNum.equals("")){
			
			if(ck!=null){
				listNum=ck;
			}
			else{
				return "control/boardUpdate";
			}
			
		}

		
		System.out.println("listNum확인"+ listNum);
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
				System.out.println("디티오확인" + bDto.getBuseoNum());
				buseoRlist.add(bDto);
				if(buseoRlist!=null)
					request.setAttribute("buseoRlist", buseoRlist);
				
			}
		}
		
		
		request.setAttribute("boardData", dto);
		
		return "control/boardUpdate";
	}
	
	
	//왼쪽에 있는 리스트 에서 권한 추가할때 사용하는 메소드
	@RequestMapping(value = "/boardAdd", method = {RequestMethod.GET,RequestMethod.POST})
	public String boardAdd(HttpServletRequest request,HttpServletResponse response) {
		
		String group = request.getParameter("group");
		String num = request.getParameter("num");
		
		System.out.println("group 확인"  + group);
		System.out.println("num" + num);
		String date = group.substring(4);
		String sort = group.substring(0, 3);
		
		System.out.println("date 확인 " +  date);
		System.out.println("sort확인" + sort);
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
					System.out.println("i확인" 
							+ i);
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
			
			
			if(MemberR.equals("")||MemberR==null){
				MemberR = date + ",";
			}else{
				MemberR = MemberR + date+",";
			}
			
			if(MemberW==null || MemberW.equals("")){
				MemberW = date + ",";
			}else{
				MemberW = MemberW + date+",";
			}
			
			dto.setListNum(listNum);
			dto.setMemberR(MemberR);
			dto.setMemberW(MemberW);
			listDAO.boardBuseo(dto);
			
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
		String buseoWs[] = dto.getBuseoW().split(",");
		
		if(sort.equals("Bus")){
			
			if(change.equals("write")){
				
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
				
				List<String> list = new ArrayList<String>();
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
		
		ListDTO dto = listDAO.readData(listNum);
		
		if(sort.equals("Bus")){
			
			String buseoWs[] = dto.getBuseoW().split(",");
			
			for(String i : buseoWs){
				System.out.println("I값확인"+i);
				System.out.println("date확인" + date);
				if(i.equals(date)){
					ck ="ok";
					System.out.println("먼데 ck값학인" + ck);
				}	
			}
			
		}
		System.out.println("ck값 확인"+ ck);
		request.setAttribute("ck", ck);
		return "control/boardUpdateSide";
	}
	
	
	
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
