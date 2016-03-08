package com.exe.board;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Qualifier;


public class BoardFileController {

	@Qualifier("BoardFileDAO")
	BoardFileDAO filedao;		  
		  
		 /* @RequestMapping("BoardFileController")
		  public String fileUpload(@RequestParam("fileup")BoardFile file){
			  
			  
			  
		  }
		  
		  private BoardFile boardFile;
		  public BoardFile getBoardFile() {
			  
			  
			  return boardFile;
			  
		  }
		  
		  public void setBoardFile(BoardFile boardFile)
		  */
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		 
		 
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
				
				if(uri.indexOf("write.action")!=-1){
					
					url = "/board/write.action";
					forward(req, resp, url);	
					
				}else if(uri.indexOf("/board/write_ok.do")!=-1){
			  
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
		 
			}else if(uri.indexOf("list.do")!=-1){*/
				
				//첫 페이지에선 필요하지 않고 그 후에 필요
				String pageNum = req.getParameter("pageNum");
				
				//현재 페이지는 1
				int currentPage = 1;
				
				//첫 페이지에선 pageNum 이 널 값이기때문에 패스
				if(pageNum!=null){
					currentPage = Integer.parseInt(pageNum);
				}
				
				//전체데이터 갯수
				//int dataCount = dao.getDataCount();
				
				//한페이지에 표시할 레코드 갯수
				//int numPerPage = 5;
				
				//int totalPage = myUtil.getPageCount(numPerPage, dataCount);
				
				//삭제를 할 경우 IF: 전체페이지가 표시할 페이지보다 큰 경우
				//if(currentPage>totalPage)
					//currentPage = totalPage;
				
				//가져올 rownum의 start와 end값 (공식)
				//int start = (currentPage-1)*numPerPage+1; //예:현재 페이지2, 5개   start = 6
				//int end = currentPage*numPerPage;         //예:                    end = 10
				
				//List<BoardFileDTO> lists = dao.getList(start, end);
				
				///////////////////////////////////////다운로드/////////////////////////////////////
				////////////////////////파일명에 링크를 거는데 서블릿에선 경로를 넘겨줘야한다//////
				String downloadPath = cp + "/file/download.do";
				String deletePath = cp + "/file/delete.do";
				
				
				//이미지 넣기
				String imagePath = cp + "/pds/saveFile";
				req.setAttribute("imagePath", imagePath);
				
			
				//페이징 처리
				/*String listUrl = "list.do";
				String pageIndexList = 
						myUtil.pageIndexList(currentPage, totalPage, listUrl);
				
				req.setAttribute("lists", lists);
				req.setAttribute("dataCount", dataCount);
				req.setAttribute("pageIndexList", pageIndexList);
				req.setAttribute("downloadPath", downloadPath);
				req.setAttribute("deletePath", deletePath);
				
				url = "/fileTest/list.jsp";
				forward(req, resp, url);*/
				
			/*}else if(uri.indexOf("delete.do")!=-1){
				
				int BoardNum = Integer.parseInt(req.getParameter("BoardNum")); //Integer.parseInt 숫자로 바꿔줌 "num"문자값을 num숫자 형태로
				
				BoardFileDTO dto = dao.getReadData(BoardNum);
				*/
				
				//파일삭제
				//FileManager.doFileDelete(filedto.getSaveFileName(), path);
										
				//DB삭제
				//filedao.deleteData(BoardNum);			
						
				url = cp + "/file/list.do";
				resp.sendRedirect(url);
				
				
				//파일 다운로드
			/*}else if(uri.indexOf("download.do")!=-1){
							
				int BoardNum = Integer.parseInt(req.getParameter("BoardNum")); //
				
				BoardFileDTO dto = dao.getReadData(BoardNum); //한 사람의 데이터
				
				if(dto==null)
					return;*/
		 
		 
		 
		 
		 
			}
		  }
		 
		 
		
		

	}

}
