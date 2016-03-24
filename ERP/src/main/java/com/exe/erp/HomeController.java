package com.exe.erp;

import java.net.URLDecoder;
import java.net.URLEncoder;
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
import com.exe.board.MyUtil;
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
	MyUtil myUtil;
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO Memberdao;
	
	@Autowired
	@Qualifier("NoteDAO")
	NoteDAO NoteDAO;
	
	//메인 홈페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainboard(HttpServletRequest request,HttpServletResponse response) throws ParseException {
		
		HttpSession session = request.getSession();
		MemberDTO LoginDTO = (MemberDTO)session.getAttribute("dto");
		
		int readCount = NoteDAO.ReadCount(LoginDTO.getName());

		request.setAttribute("readCount", readCount);
		request.setAttribute("LoginDTO", LoginDTO);
		//상단바 개인 사진을 불러오기 위한 값
		String imagePath = request.getContextPath() + "/resources/memberImage";
		request.setAttribute("imagePath",imagePath);
		//상단바 개인 사진을 불러오기 위한 값
		
		
		
		
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
		
		
		
		
		//여기 까지가 기본적으로 메인 바에 필요한 것들 넘겨주는것
		
		
		
		
		
		
		
		//공지사항 에 필요한 값
		List<BoardDTO> lists = BoardDAO.getNotice();
		//공지사항 에 필요한 값
		
		//안읽은쪽지
		List<NoteDTO> NoteList = NoteDAO.readList(LoginDTO.getName());
		request.setAttribute("NoteList", NoteList);
		//안읽은쪽지
		
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
		
		

		
		
		cal.add(Calendar.MONTH, 1);
		String nextMonth = test.format(cal.getTime()).substring(2, 4);
		
		
		
		
		
		while(it.hasNext()){
			
			MemberDTO mdto = it.next();
			
			String date = mdto.getJumin();
			
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
		
		request.setAttribute("nextBirth", nextBirth);
		request.setAttribute("nowBirth", nowBirth);
		
	
		request.setAttribute("notice", lists);
		
		return "temp";
	}	
	
	
	@RequestMapping(value = "/NoteWrite",method = {RequestMethod.POST,RequestMethod.GET})
	public String NoteWrite(HttpServletRequest request,HttpServletResponse response) throws ParseException {
		
		HttpSession session = request.getSession();
		MemberDTO LoginDTO = (MemberDTO)session.getAttribute("dto");
		
		
		request.setAttribute("LoginDTO", LoginDTO);
		return "note/write";
		
	}
	@RequestMapping(value = "/note/Write_ok",method = {RequestMethod.POST,RequestMethod.GET})
	public void NoteWrite_ok(HttpServletRequest request,NoteDTO dto,HttpServletResponse response) throws ParseException {
		
		int maxNum = NoteDAO.maxNum();
		System.out.println("값확인2"  + dto.getWriter());
		System.out.println("값확인" + dto.getReader());
		dto.setNoteNum(maxNum+1);
		System.out.println("숫자" + dto.getNoteNum());
		System.out.println("내용확인" + dto.getContent());
		NoteDAO.insertData(dto);
		
		
		
	}
	
	@RequestMapping(value = "/note/readList",method = {RequestMethod.POST,RequestMethod.GET})
	public String NotereadList(HttpServletRequest request,NoteDTO dto,HttpServletResponse response) throws ParseException {
		
		HttpSession session = request.getSession();
		MemberDTO LoginDTO = (MemberDTO)session.getAttribute("dto");
		
		  String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
	      int currentPage = 1;
	      
	      if(pageNum != null)
	         currentPage = Integer.parseInt(pageNum);
	      
	      
	      
	      int dataCount = NoteDAO.getCount(LoginDTO.getName());
	      
	      int numPerPage = 13;
	      int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	      
	      if(currentPage>totalPage)
	         currentPage = totalPage;
	      
	      int start = (currentPage-1)*numPerPage +1;
	      int end = currentPage*numPerPage;
	      
	      List<NoteDTO> lists = NoteDAO.readList(start, end, LoginDTO.getName());
	     
	      Iterator<NoteDTO> it = lists.iterator();
	      
	      while(it.hasNext()){
	    	  NoteDTO vo = it.next();
	    	  MemberDTO mdto = Memberdao.readOne(Integer.parseInt(vo.getWriter()));
	    	  vo.setWriter(mdto.getName());
	    	  
	      }
	      
	      String listUrl = cp + "/note/readList";
	      
	     
	      int max = 13;
	      String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	      
	      String articleUrl = cp + "/note/article?noteNum=";
	      request.setAttribute("listSize", lists.size());
	      request.setAttribute("max", max);
	      request.setAttribute("lists", lists);
	      request.setAttribute("pageIndexList", pageIndexList);
	      request.setAttribute("articleUrl", articleUrl);
		
		return "note/list";
	}
	
	
	@RequestMapping(value = "/note/article",method = {RequestMethod.POST,RequestMethod.GET})
	public String NoteArticle(HttpServletRequest request,NoteDTO dto,HttpServletResponse response) throws ParseException {
		
		int noteNum = Integer.parseInt(request.getParameter("noteNum")) ;
		
		dto = NoteDAO.ReadOne(noteNum);
		NoteDAO.ReadTime(noteNum);
		request.setAttribute("NoteDTO",dto );
		return "note/article";
	}
	@RequestMapping(value = "/note/delete",method = {RequestMethod.POST,RequestMethod.GET})
	public void NoteDelete(HttpServletRequest request,NoteDTO dto,HttpServletResponse response) throws ParseException {
		
		int noteNum = Integer.parseInt(request.getParameter("noteNum")) ;
		
		NoteDAO.deleteData(noteNum);
		
	}
	
	
		
		
		
		
		
	
	
	
}
