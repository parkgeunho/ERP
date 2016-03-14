package com.exe.board;


import java.net.URLDecoder;
import java.net.URLEncoder;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BoardController {
	
	@Autowired
	@Qualifier("BoardDAO")
	BoardDAO dao;
	
	
	
	@Autowired
	MyUtil myUtil;
	
	
	
	
	
	@RequestMapping(value="/board/created.action")
	   public ModelAndView created(){
	      
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("board/created");
	      
	      return mav;
	   }
	 @RequestMapping(value="/board/created_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	   public String created_ok(BoardDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception{
	     
	      int maxNum = dao.getMaxNum();
	      
	     
	      dto.setBoardNum(maxNum + 1);	  
	   
	      
	      dao.insertData(dto);
	      
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
	      
	      int start = (currentPage-1)*numPerPage;
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
	  public String delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
		  int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		  String pageNum = request.getParameter("pageNum");
	  
		  dao.deleteData(boardNum);
	  
		  return "redirect:/board/list.action?pageNum=" + pageNum;
	 
	  
	  
	 

	 
	
	 
	  }
	 
	  
	 

}

















