package com.exe.member;


import java.io.File;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.exe.insa.BuseoDTO;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	
	
	@RequestMapping(value = "/login.action")
	public String loginView() {
		
		return "member/login";
		
	}
	
	@RequestMapping(value = "/join.action")
	public String joinView(HttpServletRequest request,HttpServletResponse response) {
		
		//이부분에서 부서명(depth1~5 셋어드리뷰트하기)
		
		List<BuseoDTO> depth1 = dao.depth1();
		List<BuseoDTO> depth2 = dao.depth2();
		List<BuseoDTO> depth3 = dao.depth3();
		List<BuseoDTO> depth4 = dao.depth4();
		List<BuseoDTO> depth5 = dao.depth5();
		
		request.setAttribute("depth1", depth1);
		request.setAttribute("depth2", depth2);
		request.setAttribute("depth3", depth3);
		request.setAttribute("depth4", depth4);
		request.setAttribute("depth5", depth5);
		
		
		
		return "info";
	}
	
	
	@RequestMapping(value = "/insaView.action" , method = {RequestMethod.POST,RequestMethod.GET})
	public String insaView() {
		
		
		return "member/insaView";
	}
	
	@RequestMapping(value = "/created_ok.action" , method = {RequestMethod.POST,RequestMethod.GET})
	public String upload(MultipartHttpServletRequest request,MemberDTO dto, HttpServletResponse response) throws Exception{
		
		String path = "D:\\ERPimage";
		
		MultipartFile file = request.getFile("file");
		
		//아이디 같으면 다시 돌아가라
		/*String id = dao.idOk(dto.getId());
		if(id==dto.getId() || id.equals(dto.getId()))
			return "member/join";*/
		
			
		
		int maxNum = dao.maxNum();
		
		dto.setNum(maxNum+1);
		
		
		//폴더 생성
		File f = new File(path);
		if(!f.exists())
			f.mkdirs();
		
		if(file!=null && file.getSize()>0){
			
			//save 파일 이름 만들어주는 부분
			String fileExt =  file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String newFileName = dto.getNum() + dto.getName() + fileExt;
			String fullFileName = path + File.separator + newFileName;
			
			//폴더에 업로드
			f = new File(fullFileName);
			file.transferTo(f);
			
			dto.setUpload(newFileName);
			
		}
		
		//DB에 저장
	
		
		
		
		dao.insertData(dto);
		
		return "redirect:/insa";
	}


	
	
}
