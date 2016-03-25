package com.exe.erp;

import java.io.PrintWriter;
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

import com.exe.approval.ApprovalDAO;
import com.exe.approval.ApprovalDTO;
import com.exe.board.BoardDAO;
import com.exe.board.BoardDTO;
import com.exe.board.MyUtil;
import com.exe.insa.BuseoDTO;
import com.exe.insa.InsaDAO;
import com.exe.member.MemberDAO;
import com.exe.member.MemberDTO;
import com.exe.schedule.ScheduleDAO;

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
	@Qualifier("approvalDAO")
	ApprovalDAO approvalDAO;
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO Memberdao;
	
	@Autowired
	@Qualifier("NoteDAO")
	NoteDAO NoteDAO;
	
	@Autowired
	@Qualifier("scheduleDAO")
	ScheduleDAO dao;
	
	//메인 홈페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainboard(HttpServletRequest request,HttpServletResponse response) throws ParseException {
		
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
		List<NoteDTO> NoteList = NoteDAO.readList(Integer.toString(LoginDTO.getNum()));
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
		
		
		List<ApprovalDTO> approvalList = approvalDAO.approvalNextIngList(LoginDTO.getId());
		
		request.setAttribute("approvalList", approvalList);
		request.setAttribute("nextBirth", nextBirth);
		request.setAttribute("nowBirth", nowBirth);
		
	
		request.setAttribute("notice", lists);
		
		return "temp";
	}	
	
	
	@RequestMapping(value = "/NoteWrite",method = {RequestMethod.POST,RequestMethod.GET})
	public String NoteWrite(HttpServletRequest request,HttpServletResponse response) throws ParseException {
		
		HttpSession session = request.getSession();
		MemberDTO LoginDTO = (MemberDTO)session.getAttribute("dto");
		String noteNum = request.getParameter("noteNum");
		System.out.println("????"+noteNum);
		if(null!=noteNum){
			NoteDTO noteDTO = NoteDAO.ReadOne(Integer.parseInt(noteNum));
			int reader = Integer.parseInt(noteDTO.getWriter());
			MemberDTO memberDTO = Memberdao.readOne(reader);
			String dummy = memberDTO.getName();
			request.setAttribute("reader", Integer.toString(reader));
			request.setAttribute("dummy", dummy);
		}
		
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
		
		
		
		
		try {
            
			
            PrintWriter writer = response.getWriter();

            writer.println("<script type='text/javascript'>");

            writer.println(" window.opener.location.reload();");

            writer.println("window.close();");

            writer.println("</script>");

            writer.flush();
           
        	
           
            
         } catch (Exception e) {
         
         }
		
		
		
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
	      
	      
	      
	      int dataCount = NoteDAO.getCount(Integer.toString(LoginDTO.getNum()));
	      
	      int numPerPage = 13;
	      int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	      
	      if(currentPage>totalPage)
	         currentPage = totalPage;
	      
	      int start = (currentPage-1)*numPerPage +1;
	      int end = currentPage*numPerPage;
	      
	      List<NoteDTO> lists = NoteDAO.readList(start, end, Integer.toString(LoginDTO.getNum()));
	     
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
		System.out.println("값확인" + dto.getWriter());
		MemberDTO mDTO =  Memberdao.readOne(Integer.parseInt(dto.getWriter()));
		dto.setWriter(mDTO.getName());
		NoteDAO.ReadTime(noteNum);
		request.setAttribute("NoteDTO",dto );
		return "note/article";
	}
	@RequestMapping(value = "/note/delete",method = {RequestMethod.POST,RequestMethod.GET})
	public void NoteDelete(HttpServletRequest request,NoteDTO dto,HttpServletResponse response) throws ParseException {
		
		int noteNum = Integer.parseInt(request.getParameter("noteNum")) ;
		
		NoteDAO.deleteData(noteNum);
		
	}
	@RequestMapping(value = "/note/find", method = {RequestMethod.GET,RequestMethod.POST})
	public String searchPop(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(null==searchKey){
			
			searchKey="usernum";
			searchValue="";
			
			return "note/searchPop";
		}
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("searchKey", searchKey);
		hMap.put("searchValue", searchValue);
		
		
		
		List<MemberDTO> searchlists = Memberdao.memberList(hMap);
		
		
		
		request.setAttribute("searchlists", searchlists);
		
		
		
		
		
		return "note/searchPop";
	}
	@RequestMapping(value = "/note/search_ok", method = {RequestMethod.GET,RequestMethod.POST})
	public String search_ok(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		/*String checked = request.getParameter("checked");
		
		if(null!=checked){
			System.out.println("확인2" + checked);
			request.setAttribute("checked", checked);
			
		}*/
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		String imagePath = request.getContextPath() + "/resources/memberImage";
		
		MemberDTO Mdto = Memberdao.readOne(num);
		
		//주민번호로 나이 구하기
		Calendar cal = Calendar.getInstance();
		
		String age = Mdto.getJumin();
		age.trim(); //불러온 주민번호 앞뒤 공백제거
		age = age.substring(0, 2); // 주민번호에서 앞자리 2자리만 추출
		
		int ageOk = Integer.parseInt(age);
		String year = Integer.toString(cal.get(Calendar.YEAR)); //현재년도 불러옴
		year = year.substring(2, 4);// 년도에서 뒤에 2자리 추출
		int yearOk = Integer.parseInt(year);
		
		ageOk = (yearOk + 100) - ageOk;//만 나이 구해짐
		ageOk = ageOk + 1; //한국나이로 바꾸기위해 +1 해줌
		
		
		//주민번호로 성별 구하기
		
		String sex = Mdto.getJumin();
		sex.trim();
		int sexOk = Integer.parseInt(sex.substring(7, 8));
		
		if(sexOk==1 || sexOk==3){
			sex = "남";
		}
		
		if(sexOk==2 || sexOk==4){
			sex = "여";
		}
		
		//주민 번호로 생년월일 구하기
		
		String birth = Mdto.getJumin();
		sex.trim();
		
		birth = birth.substring(2, 4) + "월"+ birth.substring(4, 6) + "일";
		
		//부서 출력
		
		String depth = null;
		
		BuseoDTO bdto = null;
		
		if(!Mdto.getDepth1().equals("no")){
			
			bdto = insaDAO.readBuseo(Integer.parseInt(Mdto.getDepth1()));
			
			depth = bdto.getBuseoName();
			
			if(!Mdto.getDepth2().equals("no")){
				
				bdto = insaDAO.readBuseo(Integer.parseInt(Mdto.getDepth2()));
				
				depth += " ▶ " + bdto.getBuseoName();
				
				if(!Mdto.getDepth3().equals("no")){
					
					bdto = insaDAO.readBuseo(Integer.parseInt(Mdto.getDepth3()));
					
					depth += " ▶ " + bdto.getBuseoName();
					
					if(!Mdto.getDepth4().equals("no")){
						
						bdto = insaDAO.readBuseo(Integer.parseInt(Mdto.getDepth4()));
						
						depth += " ▶ " + bdto.getBuseoName();
						
						if(!Mdto.getDepth5().equals("no")){
							
							bdto = insaDAO.readBuseo(Integer.parseInt(Mdto.getDepth5()));
							
							depth += " ▶ " + bdto.getBuseoName();
						}

					}

				}

			}

		}
		
		
		
		
		request.setAttribute("depth", depth);
		request.setAttribute("birth", birth);
		request.setAttribute("sex", sex);
		request.setAttribute("ageOk", ageOk);
		request.setAttribute("Mdto", Mdto);
		request.setAttribute("imagePath", imagePath);
		
		
		
		return "note/searchView";
	}
	
	
		
		
		
		
		
	
	
	
}
