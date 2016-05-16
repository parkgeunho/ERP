package com.exe.board;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;


import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;

import java.util.List;
import java.util.ListIterator;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.exe.approval.ApprovalDAO;
import com.exe.erp.NoteDAO;
import com.exe.insa.ListDAO;
import com.exe.insa.ListDTO;
import com.exe.member.MemberDAO;
import com.exe.member.MemberDTO;
import com.exe.schedule.ScheduleDAO;


@Controller
public class BoardController {
	
	@Autowired
	@Qualifier("boardDAO")
	BoardDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@Autowired
	@Qualifier("ListDAO")
	ListDAO listDAO;
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO memberDAO;
	
	@Autowired
	@Qualifier("NoteDAO")
	NoteDAO NoteDAO;
	
	
	
	@Autowired
	@Qualifier("scheduleDAO")
	ScheduleDAO ScheduleDAO;
	

	/*@Autowired
	@Qualifier("BoardFileDAO")
	BoardFileDAO boardfileDAO;*/

	@Autowired
	@Qualifier("boardFileDAO")
	BoardFileDAO boardfileDAO;
	
	@Autowired
	@Qualifier("approvalDAO")
	ApprovalDAO approvalDAO;
	

	
	@RequestMapping(value="/board/created.action")
	  public String created(HttpServletRequest request, HttpServletResponse response) throws Exception{
	      
		int listNum= Integer.parseInt(request.getParameter("listNum"));

		response.setCharacterEncoding("UTF-8");	
		

		ListDTO lDTO = listDAO.readData(listNum);		
	      
	      String listsNum = request.getParameter("listNum");
	      ListDTO listDTO = listDAO.readData(Integer.parseInt(listsNum));
	  	
	      request.setAttribute("listDTO", listDTO);
	      

	  	HttpSession session = request.getSession();


	  	MemberDTO mDTO = (MemberDTO)session.getAttribute("dto");

		 
	  	
	  	request.setAttribute("dto", mDTO);

	  	
		  String read[] = null;
		  List<String> Rlist = new ArrayList<String>();
		  String check = lDTO.getBuseoW();
		  boolean buseoCheck = false;
		 
		  
		  if(null!=check){
			  read = lDTO.getBuseoW().split(",");
				
			  Collections.addAll(Rlist, read);
			  
			  buseoCheck = Rlist.contains(mDTO.getDepth1());
			  
			  if(!buseoCheck){				  
				  buseoCheck = Rlist.contains(mDTO.getDepth2());
				  
				  if(!buseoCheck){
					  buseoCheck = Rlist.contains(mDTO.getDepth3());
					  
					  if(!buseoCheck){
						  buseoCheck = Rlist.contains(mDTO.getDepth4());
						  
						  if(buseoCheck){							  
							  buseoCheck = Rlist.contains(mDTO.getDepth5());
						  }
					  }
				  }
			  }			  
		  }
		  	
		  Rlist.removeAll(Rlist);
		  read = lDTO.getMemberW().split(",");
		  Collections.addAll(Rlist, read);
		  boolean memberCheck = Rlist.contains(Integer.toString(mDTO.getNum()));
		 
		  System.out.println("쓰기권한확인 사람" + memberCheck);
	      System.out.println("쓰기권한 부서" + buseoCheck);		 
		 
	      if(!buseoCheck && !memberCheck){			  
				 
				  try {

			            PrintWriter writer = response.getWriter();

			            writer.println("<script type='text/javascript'>");

			            writer.println("alert('쓰기권한이없습니다.');");
			            writer.println("window.close();");
			            writer.println("</script>");

			            writer.flush();			            

			         } catch (Exception e) {
			         
			         }
				  
			  }		  

		request.setAttribute("listNum", listNum);
	      return "board/created";    
	      
	      
	   }
	
	/*@RequestMapping(value="")*/	
	
	 @RequestMapping(value="/board/created_ok.action",method={RequestMethod.GET,RequestMethod.POST})
     public String created_ok(BoardFileDTO fdto,BoardDTO dto, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{
      
		String ckNum = request.getParameter("listNum");
		
		int listNum = Integer.parseInt(ckNum);
		int maxNum = dao.getMaxNum();
		
        HttpSession session = request.getSession();
        
        MemberDTO mdto = (MemberDTO) session.getAttribute("dto");
        
        System.out.println(mdto.getId());        
                
        dto.setBoardNum(maxNum + 1);     
        dto.setListNum(listNum);
        dto.setId(mdto.getId());
          
        //디비 저장
        dao.insertData(dto);
        
        //파일 저장경로
        String path = request.getSession().getServletContext().getRealPath("/resources/boardFile");
        
        //파일 받아옴
        MultipartFile file = request.getFile("file");
        
        //경로로 폴더 생성
        File f = new File(path);
        if(!f.exists())
           f.mkdirs();
        
        
       //파일 이름 만들고 물리적 위치에 파일업로드
        if(file!=null && file.getSize()>0){
           
           //save 파일 이름 만들어주는 부분
           String fileExt =  file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
           String newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar
                 .getInstance()) + fileExt;
           String fullFileName = path + File.separator + newFileName;
           
           fdto.setOriginalFileName(file.getOriginalFilename());
           fdto.setSaveFileName(newFileName);
           
           
           //폴더에 업로드
           f = new File(fullFileName);
           file.transferTo(f);
           
           //파일 db저장
           fdto.setBoardNum(dto.getBoardNum());
           boardfileDAO.insertData(fdto);
        }
        
        
                
        
        
        session.setAttribute("cklistNum", ckNum);
        
        return "redirect:/board/list.action";
     }
	 
	 
	 @RequestMapping(value="/board/list.action",method={RequestMethod.GET,RequestMethod.POST})
	   public String list(HttpServletRequest request, HttpServletResponse response) throws Exception{
	      
		  
		 
	      String cp = request.getContextPath();
	      
	      String pageNum = request.getParameter("pageNum");
	      int currentPage = 1;
	      
	      if(pageNum != null)
	         currentPage = Integer.parseInt(pageNum);
	      
	      String searchKey = request.getParameter("searchKey");
	      String searchValue = request.getParameter("searchValue");
	      
	      if(searchKey==null){
	         
	         searchKey = "subject";
	         searchValue = "";
	      }else {
	         
	         if(request.getMethod().equalsIgnoreCase("GET"))
	            searchValue = URLDecoder.decode(searchValue, "UTF-8");
	      }
	      
	      int dataCount = dao.getDataCount(searchKey, searchValue);
	      
	      int numPerPage = 20;
	      int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	      
	      if(currentPage>totalPage)
	         currentPage = totalPage;
	      
	      int start = (currentPage-1)*numPerPage +1;
	      int end = currentPage*numPerPage;
	      
	      List<BoardDTO> lists = dao.getList(start, end, searchKey, searchValue);
	      
	      String param = "";
	      
	      if(!searchValue.equals("")){
	         
	         param = "searchKey=" + searchKey;
	         param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
	      }
	      
	      String listUrl = cp + "/board/list.action";
	      
	      if(!param.equals(""))
	         listUrl = listUrl + "?" + param;
	      
	      String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	      
	      String articleUrl = cp + "/board/article.action?pageNum=" + currentPage;
	      
	      if(!param.equals(""))
	         articleUrl = articleUrl + "&" + param;
	      
	     
	      request.setAttribute("lists", lists);
	      request.setAttribute("pageIndexList", pageIndexList);
	      request.setAttribute("dataCount", dataCount);
	      request.setAttribute("articleUrl", articleUrl);
	      
	      return "board/list";
	   }
	
	 @RequestMapping(value="/board/article.action",method={RequestMethod.GET,RequestMethod.POST})
	  //public String article(HttpServletRequest request, HttpServletResponse response) throws Exception{
	   
	  public ModelAndView article(HttpServletRequest request, HttpServletResponse response) throws Exception{
		    	      
	      String cp = request.getContextPath();
	      
	      int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	      String pageNum = request.getParameter("pageNum");
	      
	      String searchKey = request.getParameter("searchKey");
	      String searchValue = request.getParameter("searchValue");
	      
	      if(searchKey!=null)
	         searchValue = URLDecoder.decode(searchValue, "UTF-8");
	      
	      dao.updateHitCount(boardNum);
	      
	      BoardDTO dto = dao.getReadData(boardNum);
	      
	      if(dto==null){
	         
	         String url = cp + "/board/list.action";
	         response.sendRedirect(url);
	      }
	      
	      int lineSu = dto.getContent().split("\n").length;
	      
	      dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
	      
	      String param = "pageNum=" + pageNum;
	      
	      if(searchKey!=null){
	         
	         param += "&searchKey=" + searchKey;
	         param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
	      }
	      
	      ModelAndView mav = new ModelAndView();
	      
	      String listNum = request.getParameter("listNum");
	      ListDTO listDTO = listDAO.readData(Integer.parseInt(listNum));
	      
	      HttpSession session = request.getSession();
	      session.setAttribute("cklistNum", listNum);
	      
	      BoardFileDTO fdto = boardfileDAO.selectData(boardNum);
	      
	      

	      mav.setViewName("/board/article");
	      mav.addObject("listDTO",listDTO);
	      mav.addObject("listNum",listNum);
	      mav.addObject("dto", dto);
	      mav.addObject("param", param);
	      mav.addObject("lineSu", lineSu);
	      mav.addObject("pageNum", pageNum);
	      mav.addObject("fdto",fdto);
	      
	     return mav; 	      
	      
	   }
	 
	 @RequestMapping(value="/board/update.action",method={RequestMethod.GET,RequestMethod.POST})
	  public String update(HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
		  String cp = request.getContextPath();
		  
		  HttpSession session = request.getSession();
		  	MemberDTO mDTO = (MemberDTO)session.getAttribute("dto");
			
		  	request.setAttribute("dto", mDTO);		  	
		  	
		      
		      String listNum = request.getParameter("listNum");
		      System.out.println("listNum"  + listNum);
		      ListDTO listDTO = listDAO.readData(Integer.parseInt(listNum));		      
		     
		      session.setAttribute("cklistNum", listNum);
		  	
		    request.setAttribute("listDTO", listDTO);
		  
		  int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	      String pageNum = request.getParameter("pageNum");
	      
	      BoardDTO dto = dao.getReadData(boardNum);
	      
	      if(dto==null){
	    	  String url = cp + "board/list.action";
	    	  response.sendRedirect(url);
	    	  
	      }
	      
	      request.setAttribute("dto", dto);
	      request.setAttribute("pageNum", pageNum);
	      
		  return "board/update";
	  
	}
	 
	 
	 @RequestMapping(value="/board/update_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	  public void updated_ok(BoardDTO dto, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception{
	  
		 String path = request.getSession().getServletContext().getRealPath("/resources/boardFile");
		 
		  String pageNum = request.getParameter("pageNum");
		 		 	  
		  dto.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
		  dto.setSubject(request.getParameter("subject"));
		  dto.setName(request.getParameter("name"));
		  dto.setContent(request.getParameter("content"));
		  
		  BoardFileDTO fdto = boardfileDAO.selectData(Integer.parseInt(request.getParameter("boardNum")));
		  
		  	
		  MultipartFile file = request.getFile("file");
		  
		  System.out.println("이름확인:" + fdto.getOriginalFileName());
		  
		  if(file.getName().equals("") || file==null || file.getSize()==0){
				
			}
		  
		  File f = new File(path);
			if(!f.exists())
				f.mkdirs();
		  
		  if(file!=null && file.getSize()>0){
			  
			  //save 파일 이름 만들어주는 부분
	           String fileExt =  file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
	           String newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar
	                 .getInstance()) + fileExt;
	           String fullFileName = path + File.separator + newFileName;
			  
	           //파일이 이미 있으면 물리적 위치 삭제
	           
	           if(dto.getBoardNum()==fdto.getBoardNum()){
	           File d = new File(path + "/" + fdto.getSaveFileName());
	           d.delete();
	           }
	           
	           
	 		  //폴더에 업로드
	 		  f = new File(fullFileName);
	 		  
	 		  file.transferTo(f);
	 		  
	 		 fdto.setOriginalFileName(file.getOriginalFilename());
	         fdto.setSaveFileName(newFileName);
	         
	         
	         //파일 db저장
	           fdto.setBoardNum(dto.getBoardNum());
	           boardfileDAO.insertData(fdto);
			  
		  }
		
		  
		  
		  dao.updateData(dto);
	  

		  
	  }
	  
	  @RequestMapping(value="/board/delete.action",method={RequestMethod.GET,RequestMethod.POST})
	  public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
		  int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		/*  String pageNum = request.getParameter("pageNum");*/
		  
			  

		  dao.deleteFileData(boardNum);
	  

		  dao.deleteData(boardNum);
		  
		  
		  
		   try {
	
	          PrintWriter writer = response.getWriter();
	
	          writer.println("<script type='text/javascript'>");
	
	         
	     
	          writer.println("window.opener.location.reload();");
	          writer.println("window.close();");
	          writer.println("</script>");
	
	          writer.flush();
	
	       } catch (Exception e) {
	       
	       }
		  
		  
		  
		  
		  
		  
		  
		  
		  
	  
		/*  return "redirect:/board/list.action?pageNum=" + pageNum;*/
		  
	 
	  }
	  
	  @RequestMapping(value = "/boardMain", method = {RequestMethod.GET,RequestMethod.POST})
		public String boardMain(HttpServletRequest request,HttpServletResponse response,String ckpoint) throws IOException {
		  			  

			
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
			
			int scheduleCount = ScheduleDAO.getDataCount(LoginDTO.getId());
			request.setAttribute("scheduleCount",scheduleCount);
			
			//상단 메뉴바 관련 
			
		  
		  
		  
		  
		  
		  
		  
		  	
			List<ListDTO> boardlist = listDAO.boardList();
			List<ListDTO> parent = listDAO.getGroup();
			List<ListDTO> depths = listDAO.getDepth();
			int maxNum = listDAO.maxNum();			
  
			request.setAttribute("maxNum", maxNum);
			request.setAttribute("depths", depths);
			request.setAttribute("parent", parent);
			request.setAttribute("boardlist", boardlist);
			

		  return "boardMain";
	  }
	  @RequestMapping(value = "/ajaxBoardList", method = {RequestMethod.GET,RequestMethod.POST})
		public String ajaxBoardList(HttpServletRequest request,HttpServletResponse response) throws IOException {
		  
		  HttpSession session = request.getSession();
		  		String cp = request.getContextPath();
		  		response.setCharacterEncoding("UTF-8");
		      String pageNum = request.getParameter("pageNum");
		      int currentPage = 1;
		      
		      String num = request.getParameter("listNum");
			  String cklistNum = (String) session.getAttribute("cklistNum");
			  
			  int listNum = 1;
		      if(num!=null){
		    	  listNum = Integer.parseInt(num);  
		      }
		      if(cklistNum!=null){
		    	  listNum = Integer.parseInt(cklistNum);
		      }
			  

		      
		      session.removeAttribute("cklistNum");
			ListDTO lDTO = listDAO.readData(listNum);

		  	MemberDTO mDTO = (MemberDTO)session.getAttribute("dto");
			  
			  String read[] = null;
			  List<String> Rlist = new ArrayList<String>();
			  String check = lDTO.getBuseoR();
			  boolean buseoCheck = false;
			 
			  
			  if(null!=check){
				  read = lDTO.getBuseoR().split(",");
					
				  Collections.addAll(Rlist, read);
				  
				  buseoCheck = Rlist.contains(mDTO.getDepth1());
				  
				  if(!buseoCheck){
					  
					  buseoCheck = Rlist.contains(mDTO.getDepth2());
					  
					  if(!buseoCheck){
						  buseoCheck = Rlist.contains(mDTO.getDepth3());
						  
						  if(!buseoCheck){
							  buseoCheck = Rlist.contains(mDTO.getDepth4());
							  
							  if(buseoCheck){
								  
								  buseoCheck = Rlist.contains(mDTO.getDepth5());
							  }
						  }
					  }
				  }
				  
			  }
			  
		
			  Rlist.removeAll(Rlist);
			  read = lDTO.getMemberR().split(",");
			  Collections.addAll(Rlist, read);

			  boolean memberCheck = Rlist.contains(Integer.toString(mDTO.getNum()));
			 
			  System.out.println("memberCheck" + memberCheck);
		      System.out.println("buseoCheck" + buseoCheck);
			 
			  if(!buseoCheck && !memberCheck){
				  return "read-error";

			            

			  }

			  
			  
			  
		      if(pageNum != null)
		         currentPage = Integer.parseInt(pageNum);
		      
		      String searchKey = request.getParameter("searchKey");
		      String searchValue = request.getParameter("searchValue");
		      
		      System.out.println("searchKey"+searchKey);
		      System.out.println("searchValue"+searchValue);
		      if(searchKey==null){
		         
		         searchKey = "subject";
		         searchValue = "";
		      }else {
		         
		         if(request.getMethod().equalsIgnoreCase("GET"))
		            searchValue = URLDecoder.decode(searchValue, "UTF-8");
		      }
		      

		     
		      

		      
		      
		      int dataCount = dao.getDataCountTest(searchKey, searchValue, listNum);
		      
		      int numPerPage = 20;
		      int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		      
		      if(currentPage>totalPage)
		         currentPage = totalPage;
		      
		      int start = (currentPage-1)*numPerPage;
		      int end = currentPage*numPerPage;
		     
		      
		      
		      List<BoardDTO> lists = dao.getListTest(start, end, searchKey, searchValue, listNum);
		      

		      
		      String param = "";
		      
		      if(!searchValue.equals("")){
		         
		         param = "searchKey=" + searchKey;
		         param += "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		      }
		      
		      String listUrl = cp + "/board/list.action";
		      
		      if(!param.equals(""))
		         listUrl = listUrl + "?" + param;
		      
		      String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
		      
		      String articleUrl = cp + "/board/article.action?pageNum=" + currentPage;
		      
		      if(!param.equals(""))
		         articleUrl = articleUrl + "&" + param;
		      
		      
		      List<BoardFileDTO> fileList = new ArrayList<BoardFileDTO>();
		      ListIterator<BoardDTO> it = lists.listIterator();
		      
		      int num1 =0;
		      
		      System.out.println("바보:");
		      while(it.hasNext()){
		    	  
		    	  BoardDTO vo = it.next();
		    	  
		    	  num1 = vo.getBoardNum();
		    	  
		    	  System.out.println("들어오는 숫자 확인: " + num1);
		    	  
		    	  BoardFileDTO fdto = boardfileDAO.selectData(num1);
		    	 
		    	  fileList.add(fdto);
		    	  
		      }
		      
		      
		      
		      
		      request.setAttribute("fileList", fileList);
		      
		      
		      
		      
		      
		      
		      request.setAttribute("listNum", listNum);

		      request.setAttribute("LDTO", lDTO);
		      
		      
		      request.setAttribute("buseoCheck", buseoCheck);
		      request.setAttribute("memberCheck", memberCheck);
		      
		    
		      request.setAttribute("lists", lists);
		      request.setAttribute("pageIndexList", pageIndexList);
		      request.setAttribute("dataCount", dataCount);
		      request.setAttribute("articleUrl", articleUrl);
		      
		      return "board/list";
		  
	  }
	  
	  @RequestMapping(value = "/download.action", method = {RequestMethod.GET,RequestMethod.POST})
		public void download(HttpServletRequest request,HttpServletResponse response) throws IOException {
		  
		
		  
		 int boardNum= Integer.parseInt(request.getParameter("boardNum"));
		 
		
		 
		 
		 BoardFileDTO fdto = boardfileDAO.selectData(boardNum);
		 
		 String originalFileName = fdto.getOriginalFileName();
		 String saveFileName = fdto.getSaveFileName();
		 
		 try {
			
		
		 
		
		 // MIME Type 을 application/octet-stream 타입으로 변경
	     // 무조건 팝업(다운로드창)이 뜨게 된다.
		 response.setContentType("application/octet-stream");
		 
		 // 브라우저는 ISO-8859-1을 인식하기 때문에
	     // UTF-8 -> ISO-8859-1로 디코딩, 인코딩 한다(한글이름의 파일을 다운받을때 파일 이름을 깨지지 않게하기 위해서
		 originalFileName = new String(originalFileName.getBytes("euc-kr"), "iso-8859-1");
		 
		 String path = request.getSession().getServletContext().getRealPath("/resources/boardFile");
		 String pathOk= path + File.separator + saveFileName;
		 
		 
		 File f = new File(pathOk);
			
			if(!f.exists())
				return;
		 
		 
		 
		 //파일명 지정
		 response.setHeader("Content-Disposition", "attachment; filename=\""+ originalFileName+"\"");
			
		 OutputStream os = response.getOutputStream();
		 // String path = servletContext.getRealPath("/resources/boardFile"); 경로설정
	     // server에 clean을 하면 resources 경로의 것이 다 지워지기 때문에
	     // 다른 경로로 잡는다(실제 서버에서는 위의 방식으로)
		  
		 
		 
		 
		 
		 FileInputStream fis = new FileInputStream(pathOk);
		 
		 if(fis!=null ){
		 
		 int n = 0;
		 byte[] b = new byte[4096];
		 while((n = fis.read(b)) != -1){
			 
			 os.write(b,0,n);
			 
		 }
		 fis.close();
		 os.close();
		 }
		 
		 
		} catch (Exception e) {
			System.out.println(e);
			return;
		}


	}
	  
	  

	  
	  
	  

}



