package com.exe.member;


import java.io.File;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

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

import com.exe.insa.BuseoDTO;
import com.exe.insa.InsaDAO;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	@Autowired
	@Qualifier("insaDAO")
	InsaDAO insaDAO;
	
	
	@RequestMapping(value = "/login.action")
	public String loginView() {
		
		return "member/login";
		
	}
	
	@RequestMapping(value = "/join.action")
	public String joinView(HttpServletRequest request,HttpServletResponse response) {
		
		//이부분에서 부서명(depth1~5 셋어드리뷰트하기)
		HttpSession session = request.getSession();
		
		int buseoNum = Integer.parseInt((String) session.getAttribute("buseoNum"));
		
		
		List<BuseoDTO> lists = dao.depth1();
		
		request.setAttribute("lists", lists);
		
		
		
		
		
		return "info";
	}
	
	
	@RequestMapping(value = "/insaView.action" , method = {RequestMethod.POST,RequestMethod.GET})
	public String insaView(HttpServletRequest request,HttpServletResponse response) {
		
		String imagePath = request.getContextPath() + "/resources/memberImage";
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		MemberDTO dto = dao.readOne(num);
		
	

			BuseoDTO bDto = null;
			if(dto.getDepth1()!="no" && !dto.getDepth1().equals("no")){
				bDto = insaDAO.readBuseo(Integer.parseInt(dto.getDepth1()));
			
				dto.setDepth1(bDto.getBuseoName()+" ▶ ");
			}else if(dto.getDepth1().equals("no")||dto.getDepth1()=="no"){
				dto.setDepth1("");
			}
			
			
			if(dto.getDepth2()!="no"&& !dto.getDepth2().equals("no")){
				bDto = insaDAO.readBuseo(Integer.parseInt(dto.getDepth2()));
				dto.setDepth2(bDto.getBuseoName()+" ▶ ");
				
			}else if(dto.getDepth2().equals("no")||dto.getDepth2()=="no"){
				dto.setDepth2("");
			}
			
			
			if(dto.getDepth3()!="no" && !dto.getDepth3().equals("no")){
				bDto = insaDAO.readBuseo(Integer.parseInt(dto.getDepth3()));
				dto.setDepth3(bDto.getBuseoName()+" ▶ ");
				
			}else if(dto.getDepth3().equals("no")||dto.getDepth3()=="no"){
				dto.setDepth3("");
			}
			
			
			if(dto.getDepth4()!="no" && !dto.getDepth4().equals("no")){
				bDto = insaDAO.readBuseo(Integer.parseInt(dto.getDepth4()));
				dto.setDepth4(bDto.getBuseoName()+" ▶ ");
				
			}else if(dto.getDepth4().equals("no")||dto.getDepth4()=="no"){
				dto.setDepth4("");
			}
			
			
			if(dto.getDepth5()!="no" &&  !dto.getDepth5().equals("no")){
				bDto = insaDAO.readBuseo(Integer.parseInt(dto.getDepth5()));
				dto.setDepth5(bDto.getBuseoName());
				
			}else if(dto.getDepth5().equals("no")||dto.getDepth5()=="no"){
				dto.setDepth5("");
			}	
		
		
		request.setAttribute("dto", dto);
		request.setAttribute("imagePath",imagePath);
		
		return "member/insaView";
	}
	
	@RequestMapping(value = "/created_ok.action" , method = {RequestMethod.POST,RequestMethod.GET})
	public String upload(MultipartHttpServletRequest request,MemberDTO dto, HttpServletResponse response) throws Exception{
		
		String path = request.getSession().getServletContext().getRealPath("/resources/memberImage");
		
		
		MultipartFile file = request.getFile("file");
		
		//아이디 같으면 다시 돌아가라
	/*	String id = dao.idOk(dto.getId());
		if(id==dto.getId() || id.equals(dto.getId()))
			return "member/join.action";*/
		
			
		
		int maxNum = dao.maxNum();
		System.out.println("depth3 화긴:"+dto.getDepth3());
		
		if(dto.getDepth1().equals("")){
			dto.setDepth1("no");
		}
		if(dto.getDepth2().equals("")){
			dto.setDepth2("no");
		}
		if(dto.getDepth3().equals("")){
			dto.setDepth3("no");
		}
		if(dto.getDepth4().equals("")){
			dto.setDepth4("no");
		}
		if(dto.getDepth5().equals("")){
			dto.setDepth5("no");
		}
		
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
	
	@RequestMapping(value = "/compareID" , method = {RequestMethod.POST})
	public String compareID(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		
		String compID = request.getParameter("compID");
		System.out.println(compID);
		
		String id = dao.idOk(compID);
		
		
		
		
		if(id==null || id.equals("")){
		String result = "ok";
			
		request.setAttribute("result", result);
			
			
			return "member/compareID";
		}
		
		

		if (dao.idOk(compID).equals(compID)) {

			String result = "no";

			request.setAttribute("result", result);

			return "member/compareID";
		}
		
		return "member/compareID";

	}
	
	@RequestMapping(value = "/updated.action" , method = {RequestMethod.POST,RequestMethod.GET})
	public String updated(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		MemberDTO dto = dao.readOne(num);
		
		
		
		
		
		request.setAttribute("dto", dto);
		
		
		return "member/updated";
	}
	
	
	@RequestMapping(value = "/buseoChange" , method = {RequestMethod.POST})
	public String buseoChange(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		String depth1S = request.getParameter("depth1");
		String depth2S = request.getParameter("depth2");
		String depth3S = request.getParameter("depth3");
		String depth4S = request.getParameter("depth4");
		
		List<BuseoDTO> lists = dao.depth1();
		
		
		
		
		
		System.out.println("뎁스1 : " + depth1S);
		System.out.println("뎁스2 : " + depth2S);
		System.out.println("뎁스3 : " + depth3S);
		System.out.println("뎁스4 : " + depth4S);
		
		
		if(depth1S!=null && !depth1S.equals("")){
			
			
			int depth1 = Integer.parseInt(depth1S);
			
			
			List<BuseoDTO> buseoChange1 = dao.buseo1(depth1);
			
			request.setAttribute("buseoChange1", buseoChange1);
			
			if(depth2S!=null && !depth2S.equals("")){
				
				
				int depth2 = Integer.parseInt(depth2S);
				
				List<BuseoDTO> buseoChange2 = dao.buseo2(depth2);
				
				
				request.setAttribute("buseoChange2", buseoChange2);
				
				if(depth3S!=null && !depth3S.equals("")){

					int depth3 = Integer.parseInt(depth3S);

					List<BuseoDTO> buseoChange3 = dao.buseo3(depth3);

					request.setAttribute("buseoChange3", buseoChange3);

				}

			}

		}
		
		
		
		
	
		request.setAttribute("lists", lists);
		
		
		
		return "member/buseoChange";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
