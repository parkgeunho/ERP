package com.exe.erp;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.board.BoardDAO;
import com.exe.board.BoardDTO;
import com.exe.insa.BuseoDTO;
import com.exe.insa.InsaDAO;
import com.exe.member.MemberDAO;
import com.exe.member.MemberDTO;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("insaDAO")
	InsaDAO insaDAO;
	
	@Autowired
	@Qualifier("boardDAO")
	BoardDAO BoardDAO;
	
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO Memberdao;
	
	//메인 홈페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainboard(HttpServletRequest request,HttpServletResponse response) throws ParseException {
		
		HttpSession session = request.getSession();
		MemberDTO LoginDTO = (MemberDTO)session.getAttribute("dto");
		
		
		//상단바 개인 사진을 불러오기 위한 값
		String imagePath = request.getContextPath() + "/resources/memberImage";
		request.setAttribute("imagePath",imagePath);
		//상단바 개인 사진을 불러오기 위한 값
		
		//공지사항 에 필요한 값
		List<BoardDTO> lists = BoardDAO.getNotice();
		//공지사항 에 필요한 값
		
		String searchKey = "usernum";
		String searchValue = "";
		
		Map<String,Object> hmap = new HashMap<String,Object>();
		hmap.put("searchKey", searchKey);
		hmap.put("searchValue", searchValue);
		
		List<MemberDTO> mlists = Memberdao.memberList(hmap);
		
		SimpleDateFormat test = new SimpleDateFormat("yyMMdd");
		SimpleDateFormat births = new SimpleDateFormat("MM월dd일");
		Iterator<MemberDTO> it = mlists.iterator();
		
		List<MemberDTO> nowBirth = new ArrayList<MemberDTO>();
		List<MemberDTO> nextBirth = new ArrayList<MemberDTO>();	
		Calendar cal = Calendar.getInstance();
		String nowMonth = test.format(new Date()).substring(2, 4);
		
		System.out.println("확인 +"+births.format(new Date()));

		System.out.println("noe = "+nowMonth);
		
		cal.add(Calendar.MONTH, 1);
		String nextMonth = test.format(cal.getTime()).substring(2, 4);
		
		System.out.println("next=" + nextMonth);
		
		
		
		while(it.hasNext()){
			
			MemberDTO mdto = it.next();
			
			String date = mdto.getJumin();
			System.out.println("?"+date);
			String month = date.substring(2,4) + "월";
			String day = date.substring(4,6) + "일";
			String birth = month + day;
			
			mdto.setSeatPoint(birth);
			date = date.substring(2, 4);
			
			if(date.equals(nowMonth)){
		
				nowBirth.add(mdto);
			}
			
			if(date.equals(nextMonth)){
				nextBirth.add(mdto);
			}
			
			
		}
		BuseoDTO bdto = insaDAO.readBuseo(Integer.parseInt(LoginDTO.getDepth1()));
		String buseo = bdto.getBuseoName();
		
		if(!LoginDTO.getDepth2().equals("no")){
			bdto = insaDAO.readBuseo(Integer.parseInt(LoginDTO.getDepth2()));
			buseo =bdto.getBuseoName();
		}
		if(!LoginDTO.getDepth3().equals("no")){
			bdto = insaDAO.readBuseo(Integer.parseInt(LoginDTO.getDepth3()));
			buseo =bdto.getBuseoName();
		}
		if(!LoginDTO.getDepth4().equals("no")){
			bdto = insaDAO.readBuseo(Integer.parseInt(LoginDTO.getDepth4()));
			buseo =bdto.getBuseoName();
		}
		if(!LoginDTO.getDepth5().equals("no")){
			bdto = insaDAO.readBuseo(Integer.parseInt(LoginDTO.getDepth5()));
			buseo =bdto.getBuseoName();
		}
			
		
		
		request.setAttribute("buseo", buseo);
		request.setAttribute("nextBirth", nextBirth);
		request.setAttribute("nowBirth", nowBirth);
		request.setAttribute("LoginDTO", LoginDTO);
	
		request.setAttribute("notice", lists);
		
		return "temp";
	}	
	
	
	@RequestMapping(value = "/NoteWrite", method = RequestMethod.GET)
	public String NoteWrite(HttpServletRequest request,HttpServletResponse response) throws ParseException {
		
		
		
		
		
		return "note/write";
		
	}
	
}
