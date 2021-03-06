/*package com.exe.board;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView{


	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		//다운로드 처리
		
		//1.브라우져에게 처리할 수 없는 컨텐츠로 알려주어서 다운로드 처리하도록 지정
		//response.setContentType("application/octet-stream");
		response.setContentType("application/unknown");
		
		//2.다운로드 처리할 때 필요한 정보 제공
		response.addHeader("Content-Disposition",
				"attachment;fileName=\"shin.jpg\"");
		
		//3.파일은 응답 스트림에 기록하는 작업
		String file2 = request.getSession()
				.getServletContext()
				.getRealPath("WEB-INF/files/shin.jpg");
		
		BufferedInputStream istream = 
				new BufferedInputStream(new FileInputStream(file2));
		
		BufferedOutputStream ostream =
				new BufferedOutputStream(response.getOutputStream());
		
		while(true){
			
			int data = istream.read();
			
			if(data!=-1)
				ostream.write(data);
			else
				break;
			
		}
		
		
		istream.close();
		ostream.close();
		
		
		
	}

	
	
	
	
	
	
}
*/