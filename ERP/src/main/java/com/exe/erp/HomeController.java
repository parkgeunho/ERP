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

import com.exe.member.MemberDAO;
import com.exe.member.MemberDTO;

@Controller
public class HomeController {

	
	
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
		Iterator<MemberDTO> it = mlists.iterator();
		
		List<MemberDTO> brithlist = new ArrayList<MemberDTO>();
			
		Calendar cal = Calendar.getInstance();
		String noe = test.format(new Date());
		
		

	
		
		cal.add(Calendar.MONTH, 1);
		String next = test.format(cal.getTime());
		
		System.out.println("next=" + next);
		
		
		
		while(it.hasNext()){
			
			MemberDTO mdto = it.next();
			
			String date = mdto.getJumin();
			/*System.out.println("?"+date);*/
			date = date.substring(2, 6);
			System.out.println("짤린거확인" + date);
			
			
		}
		
		
		
		
		
		
		request.setAttribute("brithlist", brithlist);
		request.setAttribute("dto", LoginDTO);
	
		request.setAttribute("notice", lists);
		
		return "temp";
	}	
	
}
