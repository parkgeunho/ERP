package com.exe.board;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;




//-------------- 게시판 -------------

@Controller
public class BoardController {
	
	@Autowired
	@Qualifier("BoardDAO")
	BoardDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	
	/*@RequestMapping(value = "/board/list", method = RequestMethod.GET)
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
	
	
	@RequestMapping(value = "/board/test", method = RequestMethod.GET)
	public String test() {
		
		return "board/test";
		
	}
	*/
	
	
	
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
	      
	      return "redirect:/list.action";
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
	   /*public String article(HttpServletRequest request, HttpServletResponse response) throws Exception{*/
	   
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
	 
	 @RequestMapping(value="/board/updated.action",method={RequestMethod.GET,RequestMethod.POST})
	  public String updated(HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
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
	      
		  return "board/updated";
	  
	}
	 
	 
	 @RequestMapping(value="/board/updated_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	  public String updated_ok(BoardDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
		  String pageNum = request.getParameter("pageNum");
		 		 	  
		  dto.setBoardNum(Integer.parseInt(request.getParameter("boardNum")));
		  dto.setSubject(request.getParameter("subject"));
		  dto.setName(request.getParameter("name"));		  
		  dto.setContent(request.getParameter("content"));
		  
		  dao.updateData(dto);
	  
		  return "redirect:/board/list.action?pageNum=" + pageNum;
		  
	  }
	  
	  @RequestMapping(value="/board/deleted.action",method={RequestMethod.GET,RequestMethod.POST})
	  public String deleted(HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
		  int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		  String pageNum = request.getParameter("pageNum");
	  
		  dao.deleteData(boardNum);
	  
		  return "redirect:/board/list.action?pageNum=" + pageNum;
	 
	  
	  }
	 
	 
	 //--------------- 파일 ------------------
	 
	 
	  public class BoardFile extends HttpServlet{
		
		private static final long serialVersionUID = 1L;
		  
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			doPost(req, resp);
		}
		
		protected void forward(HttpServletRequest req, HttpServletResponse resp,
				String url) throws ServletException, IOException {
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);
		} 
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			
			req.setCharacterEncoding("UTF-8");
		
			Connection conn = DBConn.getConnection();
			BoardFileDAO dao = new BoardFileDAO(conn);
		
			MyUtil myUtil = new MyUtil();
			
			String cp = req.getContextPath();
			String uri = req.getRequestURI();
			String url;
			  
			//파일을 저장할 경로
			String root = getServletContext().getRealPath("/");
			String path = root + File.separator + "pds" + 
								File.separator + "saveFile";
			
			File f = new File(path);
			if(!f.exists())
				f.mkdirs(); //directory 여러개일경우  ..  s안붙은건 한개만 올리때인데 잘 안쓴다
			
			if(uri.indexOf("write.do")!=-1){
				
				url = "//write.jsp";
				forward(req, resp, url);	
				
			}else if(uri.indexOf("write_ok.do")!=-1){
		  
			//파일 업로드
			/*String encType = "UTF-8";
			int maxFileSize = 10*1024*1024;
				
			MultipartRequest mr = new MultipartRequest(req,
					path, maxFileSize, encType,
					new DefaultFileRenamePolicy());
		  */
			//DB에 저장
			/*if(mr.getFile("upload")!=null){
				
				int maxNum = dao.getMaxNum();
				
				BoardFileDTO dto = new BoardFileDTO();
				
				dto.setBoardNum(maxNum + 1);				
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				dto.setOriginalFileName(mr.getOriginalFileName("upload"));
				
				dao.insertData(dto);
				
			}
			
			url = cp + "/file/list.do";
			resp.sendRedirect(url);
			  
		  
	  }
	 
		}else if(uri.indexOf("list.do")!=-1){
			
			//첫 페이지에선 필요하지 않고 그 후에 필요
			String pageNum = req.getParameter("pageNum");
			
			//현재 페이지는 1
			int currentPage = 1;
			
			//첫 페이지에선 pageNum 이 널 값이기때문에 패스
			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}
			
			//전체데이터 갯수
			int dataCount = dao.getDataCount();
			
			//한페이지에 표시할 레코드 갯수
			int numPerPage = 5;
			
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			//삭제를 할 경우 IF: 전체페이지가 표시할 페이지보다 큰 경우
			if(currentPage>totalPage)
				currentPage = totalPage;
			
			//가져올 rownum의 start와 end값 (공식)
			int start = (currentPage-1)*numPerPage+1; //예:현재 페이지2, 5개   start = 6
			int end = currentPage*numPerPage;         //예:                    end = 10
			
			List<BoardFileDTO> lists = dao.getList(start, end);
			
			///////////////////////////////////////다운로드/////////////////////////////////////
			////////////////////////파일명에 링크를 거는데 서블릿에선 경로를 넘겨줘야한다//////
			String downloadPath = cp + "/file/download.do";
			String deletePath = cp + "/file/delete.do";
			
			
			//이미지 넣기
			String imagePath = cp + "/pds/saveFile";
			req.setAttribute("imagePath", imagePath);
			
		
			//페이징 처리
			String listUrl = "list.do";
			String pageIndexList = 
					myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			req.setAttribute("lists", lists);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("deletePath", deletePath);
			
			url = "/fileTest/list.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("delete.do")!=-1){
			
			int BoardNum = Integer.parseInt(req.getParameter("BoardNum")); //Integer.parseInt 숫자로 바꿔줌 "num"문자값을 num숫자 형태로
			
			BoardFileDTO dto = dao.getReadData(BoardNum);
			
			//파일삭제
			FileManager.doFileDelete(dto.getSaveFileName(), path);
									
			//DB삭제
			dao.deleteData(BoardNum);			
					
			url = cp + "/file/list.do";
			resp.sendRedirect(url);
			
			
			//파일 다운로드
		}else if(uri.indexOf("download.do")!=-1){
						
			int BoardNum = Integer.parseInt(req.getParameter("BoardNum")); //
			
			BoardFileDTO dto = dao.getReadData(BoardNum); //한 사람의 데이터
			
			if(dto==null)
				return;
	 
	 
	 
	 
	 */
		}
	  }
	 
	 
	 
	 
	 
	  }
	 

}

















