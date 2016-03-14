package com.exe.board;

import java.io.FileOutputStream;
import java.io.InputStream;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.exe.board.DownloadView;

public class BoardFileController {

	//(File Upload)
		@RequestMapping(value="/upload.action",method={RequestMethod.POST,RequestMethod.GET})
		public String upload(MultipartHttpServletRequest req, 
				String str) throws Exception{
			
			String path = 
					req.getSession().getServletContext().getRealPath("/WEB-INF/files");
			
			MultipartFile file = req.getFile("upload");
			
			if(file!=null && file.getSize()>0){
				
				try {
					
					FileOutputStream ostream = 
							new FileOutputStream(path + "/" + 
									file.getOriginalFilename());
					
					InputStream istream = file.getInputStream();
					
					byte[] buffer = new byte[512];
					
					while(true){
						
						int data = 
								istream.read(buffer,0,buffer.length);
						
						if(data==-1){						
							break;						
						}
						ostream.write(buffer,0,data);
					}
					istream.close();
					ostream.close();				
					
				} catch (Exception e) {
					System.out.println(e.toString());
				}			
			}		
			return "uploadResult";				
		}
		
		//DownLoad
		
		@RequestMapping(value="/download.action")
		public ModelAndView download(){
			
			ModelAndView mav = new ModelAndView();
			
			mav.setView(new DownloadView());
			
			return mav;
			
		}
		
	  
	
	
	

}
