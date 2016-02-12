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
	
	/*@Autowired
	@Qualifier("boardDAO")
	BoardDAO dao;
	
	@Autowired
	MyUtil myUtil;*/
	
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list() {
		
		return "board/list";
		
	}
	
	@RequestMapping(value = "/board/created", method = RequestMethod.GET)
	public String created() {
		
		return "board/created";
		
	}
	
	@RequestMapping(value = "/board/article", method = RequestMethod.GET)
	public String article() {
		
		return "board/article";
		
	}
	
	
	
	
	
	/*@RequestMapping(value="/created.action")
	   public ModelAndView created(){
	      
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("board/created");
	      
	      return mav;
	   }
	 @RequestMapping(value="/created_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	   public String created_ok(BoardDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception{
	      
	      int maxNum = dao.getMaxNum();
	      
	      dto.setBoardNum(maxNum + 1);	      
	      
	      dao.insertData(dto);
	      
	      return "redirect:/list.action";
	   }
	 
	 
	 @RequestMapping(value="/list.action",method={RequestMethod.GET,RequestMethod.POST})
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
	      
	      int numPerPage = 10;
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
	      
	      String listUrl = cp + "/list.action";
	      
	      if(!param.equals(""))
	         listUrl = listUrl + "?" + param;
	      
	      String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	      
	      String articleUrl = cp + "/article.action?pageNum=" + currentPage;
	      
	      if(!param.equals(""))
	         articleUrl = articleUrl + "&" + param;
	      
	      request.setAttribute("lists", lists);
	      request.setAttribute("pageIndexList", pageIndexList);
	      request.setAttribute("dataCount", dataCount);
	      request.setAttribute("articleUrl", articleUrl);
	      
	      return "board/list";
	   }
	*/

}

















