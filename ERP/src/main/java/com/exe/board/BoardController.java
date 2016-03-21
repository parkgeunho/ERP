package com.exe.board;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;


import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;

import java.util.List;

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

import com.exe.insa.ListDAO;
import com.exe.insa.ListDTO;
import com.exe.member.MemberDAO;
import com.exe.member.MemberDTO;


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
	@Qualifier("boardFileDAO")
	BoardFileDAO boardfileDAO;
	
	@RequestMapping(value="/board/created.action")
	  public String created(HttpServletRequest request, HttpServletResponse response) throws Exception{
	      
		int listNum= Integer.parseInt(request.getParameter("listNum"));


		response.setCharacterEncoding("UTF-8");

	
		
		ListDTO lDTO = listDAO.readData(listNum);
	      
	  	HttpSession session = request.getSession();
	  	MemberDTO mDTO = (MemberDTO)session.getAttribute("dto");
		  
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
	  public void updated_ok(BoardDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
		  String pageNum = request.getParameter("pageNum");
		 		 	  
		  dto.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
		  dto.setSubject(request.getParameter("subject"));
		  dto.setName(request.getParameter("name"));
		  dto.setContent(request.getParameter("content"));
		  
		  dao.updateData(dto);
	  
		  /*return "redirect:/board/list.action?pageNum=" + pageNum;*/
		  
	  }
	  
	  @RequestMapping(value="/board/delete.action",method={RequestMethod.GET,RequestMethod.POST})
	  public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
		  int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		/*  String pageNum = request.getParameter("pageNum");*/
		  
			  
		  
	  
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
		  			  
		  	HttpSession session = request.getSession();
			MemberDTO LoginDTO = (MemberDTO)session.getAttribute("dto");
			request.setAttribute("LoginDTO", LoginDTO);		  
		  	
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
				 /* try {
			            
			            PrintWriter writer = response.getWriter();

			            writer.println("<script type='text/javascript'>");

			            writer.println("alert('권한없단다~');");

			            writer.println("history.go()");

			            writer.println("</script>");

			            writer.flush();
			            
			            
			            
			         } catch (Exception e) {
			         
			         }*/
				  
				  
				  
				  
				  
				  
			  }
			  	  
			  
			  
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
		public String download(HttpServletRequest request,HttpServletResponse response) throws IOException {
		  
		 int boardNum= Integer.parseInt(request.getParameter("boardNum"));
		 int listNum= Integer.parseInt(request.getParameter("listNum"));
		 
		 BoardFileDTO fdto = boardfileDAO.selectData(boardNum);
		 
		 
		  
		  
		  
		  return "redirect:/board/article.action?boardNum="+boardNum+"&listNum="+listNum;
	  }
		  
		  
	  
	  
	  
	  

	  
	  
	  

}



