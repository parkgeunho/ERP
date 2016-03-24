package com.exe.member;


import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	@RequestMapping(value = "/login_ok.action")
	public String login_ok(HttpServletRequest request,HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		
		String id= request.getParameter("userId");
		String pwd= request.getParameter("userPwd");
		
		System.out.println(id);
		System.out.println(pwd);
		
		MemberDTO dto = new MemberDTO();
		
		
		
		dto.setId(id);
		dto.setPwd(pwd);
		
		dto = dao.login(dto);
		
		if(dto==null){
			
			try {
				
				PrintWriter writer = response.getWriter();

				writer.println("<script type='text/javascript'>");

				writer.println("alert('아이디와 비밀번호를 정확히 입력하세요');");

				writer.println("history.back();");

				writer.println("</script>");

				writer.flush();
				
				return "member/login";
				
			} catch (Exception e) {
			
			}
			
		}
		
		
		if(dto.getId().equals(id) && dto.getPwd().equals(pwd)){
			
			session.setAttribute("dto", dto);
			System.out.println("여기 들어와서 dto 올렷음");
			return "redirect:/main";
			
		}
	
			
			
				
		
		
		
		
		
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
		
		response.setCharacterEncoding("UTF-8");
				
		MultipartFile file = request.getFile("file");
		
	
			
		
		int maxNum = dao.maxNum();
		System.out.println("depth3 화긴:"+dto.getDepth3());
		System.out.println("dpehth2 확인:"+dto.getDepth2());
		
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
	
	
	@RequestMapping(value = "/buseoChange", method = {RequestMethod.POST})
	public String buseoChange(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String depth1S = request.getParameter("depth1");
		String depth2S = request.getParameter("depth2");
		String depth3S = request.getParameter("depth3");
		String depth4S = request.getParameter("depth4");
		String depth5S = request.getParameter("depth5");

		List<BuseoDTO> lists = dao.depth1(); //뎁스1

		request.setAttribute("lists", lists);

		if (depth1S != null && !depth1S.equals("")) {

			if (depth1S != "no" && !depth1S.equals("no")) {

				int depth1 = Integer.parseInt(depth1S);
				request.setAttribute("depth1", depth1);

				List<BuseoDTO> buseoChange1 = dao.buseo2(depth1);
				request.setAttribute("buseoChange1", buseoChange1); //뎁스2

				request.setAttribute("depth1Size", buseoChange1.size());
				System.out.println("뎁스1 : " + depth1S);

				String preDepth1 = request.getParameter("preDepth1");

				if (!preDepth1.equals("") && preDepth1 != null) {

					if (!preDepth1.equals(depth1S)) {

						depth2S = "no";
						depth3S = "no";
						depth4S = "no";
						depth5S = "no";
					}

				}

				if (depth2S != null && !depth2S.equals("")) {

					if (depth2S != "no" && !depth2S.equals("no")) {

						int depth2 = Integer.parseInt(depth2S);
						request.setAttribute("depth2", depth2);
						List<BuseoDTO> buseoChange2 = dao.buseo3(depth2);
						request.setAttribute("buseoChange2", buseoChange2);
						request.setAttribute("depth2Size", buseoChange2.size());//뎁스3

						String preDepth2 = request.getParameter("preDepth2");

						if (!preDepth2.equals("") && preDepth2 != null) {

							if (!preDepth2.equals(depth2S)) {

								depth3S = "no";
								depth4S = "no";
								depth5S = "no";
							}

						}

						if (depth3S != null && !depth3S.equals("")) {
							if (depth3S != "no" && !depth3S.equals("no")) {

								int depth3 = Integer.parseInt(depth3S);

								List<BuseoDTO> buseoChange3 = dao
										.buseo4(depth3);

								request.setAttribute("buseoChange3",
										buseoChange3);
								request.setAttribute("depth3", depth3);//뎁스4
								request.setAttribute("depth3Size",
										buseoChange3.size());

								String preDepth3 = request
										.getParameter("preDepth3");

								if (!preDepth3.equals("")
										&& preDepth3 != null) {

									if (!preDepth3.equals(depth3S)) {

										depth4S = "no";
										depth5S = "no";
									}

								}

								if (depth4S != null && !depth4S.equals("")) {
									if (depth4S != "no"
											&& !depth4S.equals("no")) {

										int depth4 = Integer.parseInt(depth4S);
										List<BuseoDTO> buseoChange4 = dao
												.buseo5(depth4);

										request.setAttribute("buseoChange4",
												buseoChange4);
										request.setAttribute("depth4", depth4);//뎁스5
										request.setAttribute("depth4Size",
												buseoChange4.size());

										String preDepth4 = request
												.getParameter("preDepth4");

										if (!preDepth4.equals("")
												&& preDepth4 != null) {

											if (!preDepth4.equals(depth4S)) {

												depth5S = "no";
											}

										}

										if (depth5S != null
												&& !depth5S.equals("")) {
											if (depth5S != "no"
													&& !depth5S.equals("no")) {

												int depth5 = Integer
														.parseInt(depth5S);
												request.setAttribute("depth5",
														depth5);
												

											}
										}

									}
								}

							}
						}

					}
				}

			}

		}

		return "member/buseoChange";
	}
	
	@RequestMapping(value = "/updated_ok", method = {RequestMethod.POST})
	public String updated_ok(MultipartHttpServletRequest request,
			HttpServletResponse response, MemberDTO dto) throws Exception {
		
		String path = request.getSession().getServletContext().getRealPath("/resources/memberImage");
		
		int num = Integer.parseInt( request.getParameter("num"));
		
		
		MemberDTO dto2 = dao.readOne(num);
		
		
		MultipartFile file = request.getFile("file");
		
		System.out.println("파일확인 : " + file);
		
		if(file.getName().equals("") || file==null || file.getSize()==0){
			
			dto.setUpload(dto2.getUpload());
			
		}
		
		
		
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
		
		dto.setNum(num);
		
		//폴더 생성
		File f = new File(path);
		if(!f.exists())
			f.mkdirs();
		
		if(file!=null && file.getSize()>0){
			
			//save 파일 이름 만들어주는 부분
			String fileExt =  file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			String newFileName = dto.getNum() + dto.getName() + fileExt;
			String fullFileName = path + File.separator + newFileName;
			
			//파일이 이미 있으면 물리적 위치 삭제
			MemberDTO dto1 = dao.readOne(num);
			
			if(dto1.getUpload().equals(fullFileName) || dto1.getUpload()==fullFileName){
				
				File d = new File(path + "/" + fullFileName);
				d.delete();
				
			}
			
			
			
			
			//폴더에 업로드
			f = new File(fullFileName);
			file.transferTo(f);
			
			
			dto.setUpload(newFileName);
			
		}
		
		//DB에 저장
	
		
		
		
		dao.updatedData(dto);
		
		
		
		
		
		return "redirect:/insaView.action?num=" + dto.getNum();
	}
	
	@RequestMapping(value = "/deleted_ok.action", method = {RequestMethod.GET})
	public String deleted_ok(HttpServletRequest request,
			HttpServletResponse response,MemberDTO dto) throws Exception {
		
		String path = request.getSession().getServletContext().getRealPath("/resources/memberImage/");
		
		String upload = request.getParameter("upload");
		int num =Integer.parseInt(request.getParameter("num"));
		
		//파일삭제
		
		
		File d = new File(path + "/" + upload);
		System.out.println("이게뭔지1:" + d);
		
		if(d.exists()){
		 d.delete();
		}
		
		
		
		//db삭제
		
		dao.deleteData(num);
		
		
		return "redirect:/insa";
	}
	
	@RequestMapping(value = "/logout.action", method = {RequestMethod.GET})
	public String logout(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		
		
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/searchPop.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String searchPop(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String checked = request.getParameter("checked");
		
		if(null!=checked){
			System.out.println("확인" + checked);
			request.setAttribute("checked", checked);
			
		}
		
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(null==searchKey){
			
			searchKey="usernum";
			searchValue="";
			
			return "member/searchPop";
		}
		
		Map<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("searchKey", searchKey);
		hMap.put("searchValue", searchValue);
		
		
		
		List<MemberDTO> lists = dao.memberList(hMap);
		
		
		
		request.setAttribute("lists", lists);
		
		
		
		
		
		return "member/searchPop";
	}
	

	@RequestMapping(value = "/search_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String search_ok(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String checked = request.getParameter("checked");
		
		if(null!=checked){
			System.out.println("확인2" + checked);
			request.setAttribute("checked", checked);
			
		}
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		String imagePath = request.getContextPath() + "/resources/memberImage";
		
		MemberDTO dto = dao.readOne(num);
		
		//주민번호로 나이 구하기
		Calendar cal = Calendar.getInstance();
		
		String age = dto.getJumin();
		age.trim(); //불러온 주민번호 앞뒤 공백제거
		age = age.substring(0, 2); // 주민번호에서 앞자리 2자리만 추출
		
		int ageOk = Integer.parseInt(age);
		String year = Integer.toString(cal.get(Calendar.YEAR)); //현재년도 불러옴
		year = year.substring(2, 4);// 년도에서 뒤에 2자리 추출
		int yearOk = Integer.parseInt(year);
		
		ageOk = (yearOk + 100) - ageOk;//만 나이 구해짐
		ageOk = ageOk + 1; //한국나이로 바꾸기위해 +1 해줌
		
		
		//주민번호로 성별 구하기
		
		String sex = dto.getJumin();
		sex.trim();
		int sexOk = Integer.parseInt(sex.substring(7, 8));
		
		if(sexOk==1 || sexOk==3){
			sex = "남";
		}
		
		if(sexOk==2 || sexOk==4){
			sex = "여";
		}
		
		//주민 번호로 생년월일 구하기
		
		String birth = dto.getJumin();
		sex.trim();
		
		birth = birth.substring(2, 4) + "월"+ birth.substring(4, 6) + "일";
		
		//부서 출력
		
		String depth = null;
		
		BuseoDTO bdto = null;
		
		if(!dto.getDepth1().equals("no")){
			
			bdto = insaDAO.readBuseo(Integer.parseInt(dto.getDepth1()));
			
			depth = bdto.getBuseoName();
			
			if(!dto.getDepth2().equals("no")){
				
				bdto = insaDAO.readBuseo(Integer.parseInt(dto.getDepth2()));
				
				depth += " ▶ " + bdto.getBuseoName();
				
				if(!dto.getDepth3().equals("no")){
					
					bdto = insaDAO.readBuseo(Integer.parseInt(dto.getDepth3()));
					
					depth += " ▶ " + bdto.getBuseoName();
					
					if(!dto.getDepth4().equals("no")){
						
						bdto = insaDAO.readBuseo(Integer.parseInt(dto.getDepth4()));
						
						depth += " ▶ " + bdto.getBuseoName();
						
						if(!dto.getDepth5().equals("no")){
							
							bdto = insaDAO.readBuseo(Integer.parseInt(dto.getDepth5()));
							
							depth += " ▶ " + bdto.getBuseoName();
						}

					}

				}

			}

		}
		
		
		
		
		request.setAttribute("depth", depth);
		request.setAttribute("birth", birth);
		request.setAttribute("sex", sex);
		request.setAttribute("ageOk", ageOk);
		request.setAttribute("dto", dto);
		request.setAttribute("imagePath", imagePath);
		
		
		
		return "member/smallView";
	}
	
	@RequestMapping(value = "/smallUpdated.action", method = {RequestMethod.GET,RequestMethod.POST})
	public String smallUpdated(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("dto");
		
		request.setAttribute("dto", dto);
		
		return "member/smallUpdated";
	}
	
	@RequestMapping(value = "/smallUpdated_ok.action", method = {RequestMethod.GET,RequestMethod.POST})
	public void smallUpdated_ok(HttpServletRequest request,
			HttpServletResponse response,MemberDTO dto) throws Exception {
		
		HttpSession session = request.getSession();
		
		
		
		dao.smallUpdatedData(dto); //업데이트
		
		session.invalidate();//세션값 지워서 강제 로그아웃
		
	}
	
	
	
	
	
	
	
}
