package com.exe.board;

import java.io.File;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.exe.board.DownloadView;

@Controller
public class BoardFileController {
	
	@Autowired
	@Qualifier("fileDAO")
	BoardFileDAO filedao;
	
	@Autowired
	@Qualifier("boadDAO")
	BoardDAO dao;
	
	
	//(File Upload)
		@RequestMapping(value="/created_ok.action",method={RequestMethod.POST,RequestMethod.GET})
		public String upload(MultipartHttpServletRequest request,BoardFileDTO filedto, HttpServletResponse response) throws Exception{
			
			String path = 
					request.getSession().getServletContext().getRealPath("/WEB-INF/files");
			
			MultipartFile file = request.getFile("file");
			
			//폴더 생성
			File f = new File(path);
			if(!f.exists())
				f.mkdir();
			if(file!=null && file.getSize()>0){
				
			
			
			
			//save 파일 이름 만들어주는 부분
			String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String saveFileName = filedto.getBoardNum() + filedto.getSaveFileName() + fileExt;
			String originalFileName = path + File.separator + saveFileName;
			
			//폴더에 업로드			
			f = new File(originalFileName);
			file.transferTo(f);
			
			//filedto.setUpload(saveFileName);
			
		
			
			
		}
			
		//DB 저장
		
		
		//dao.insertData(filedto);
		
		
		return "redirect:/board";
		
		}	
			
		
		//DownLoad
		
		@RequestMapping(value="/download.action")
		public ModelAndView download(){
			
			ModelAndView mav = new ModelAndView();
			
			mav.setView(new DownloadView());
			
			return mav;
			
		}
		
	  
		
	
	

}
