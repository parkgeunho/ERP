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

import com.exe.member.MemberDTO;

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
	public String boardUpdate(HttpServletRequest request,HttpServletResponse response,ListDTO dto) {
		
		System.out.println("애당초 여긴옴?");
		String listNum = request.getParameter("listNum");
		
		if(listNum==null || listNum.equals("")){
			return "control/boardUpdate";
		}
		
		int num = Integer.parseInt(listNum);
		
		dto = listDAO.readData(num);
		System.out.println("값이 잘 왓는지 확인하빈다." +dto.getBoardName());
		
		request.setAttribute("boardData", dto);
		
		return "control/boardUpdate";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
