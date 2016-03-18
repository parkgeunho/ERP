package com.exe.board;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Member;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.exe.insa.ListDAO;
import com.exe.insa.ListDTO;
import com.exe.member.MemberDAO;
import com.exe.member.MemberDTO;


@Controller
public class BoardController {
	
	@Autowired
	@Qualifier("BoardDAO")
	BoardDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@Autowired
	@Qualifier("ListDAO")
	ListDAO listDAO;
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO memberDAO;
	
	
	
	@RequestMapping(value="/board/created.action")
	  public String created(HttpServletRequest request, HttpServletResponse response) throws Exception{
	      
		int listNum= Integer.parseInt(request.getParameter("listNum"));

		
		
		
		ListDTO lDTO = listDAO.readData(listNum);
	      
	  	HttpSession session = request.getSession();
	  	MemberDTO mDTO = (MemberDTO)session.getAttribute("dto");
		  
		  String read[] = null;
		  List<String> Rlist = new ArrayList<String>();
		  String check = lDTO.getBuseoW();
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
		  read = lDTO.getMemberW().split(",");
		  Collections.addAll(Rlist, read);
		  boolean memberCheck = Rlist.contains(Integer.toString(mDTO.getNum()));
		  

		 
		  System.out.println("쓰기권한확인 사람" + memberCheck);
	      System.out.println("쓰기권한 부서" + buseoCheck);
		 
		 
		 
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
		  
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	      

		request.setAttribute("listNum", listNum);
	      return "board/created";
	   }
	 @RequestMapping(value="/board/created_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	   public void created_ok(BoardDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception{
	     
		 int listNum = Integer.parseInt(request.getParameter("listNum"));
	      int maxNum = dao.getMaxNum();
	      	     
	      dto.setBoardNum(maxNum + 1);	  
	   	  dto.setListNum(listNum);
	      dao.insertData(dto);
	      
	     /* return "redirect:/board/list.action";*/
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
	      
	      mav.setViewName("/board/article");
	      
	      mav.addObject("dto", dto);
	      mav.addObject("param", param);
	      mav.addObject("lineSu", lineSu);
	      mav.addObject("pageNum", pageNum);
	      
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
	  public String updated_ok(BoardDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
		  String pageNum = request.getParameter("pageNum");
		 		 	  
		  dto.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
		  dto.setSubject(request.getParameter("subject"));
		  dto.setName(request.getParameter("name"));
		  dto.setContent(request.getParameter("content"));
		  
		  dao.updateData(dto);
	  
		  return "redirect:/board/list.action?pageNum=" + pageNum;
		  
	  }
	  
	  @RequestMapping(value="/board/delete.action",method={RequestMethod.GET,RequestMethod.POST})
	  public void delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
		  int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		/*  String pageNum = request.getParameter("pageNum");*/
	  
		  dao.deleteData(boardNum);
	  
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
		  
		  
		  		String cp = request.getContextPath();
		  		response.setCharacterEncoding("UTF-8");
		      String pageNum = request.getParameter("pageNum");
		      int currentPage = 1;
		      
		      String num = request.getParameter("listNum");
			  
			  
			  int listNum = 1;
		      if(num!=null){
		    	  listNum = Integer.parseInt(num);  
		      }
			  
			ListDTO lDTO = listDAO.readData(listNum);
		      
		  	HttpSession session = request.getSession();
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
		  
		  
	  
	  
	  
	  

	  
	  
	  

}



