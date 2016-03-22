package com.exe.erp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.exe.board.BoardDAO;
import com.exe.board.BoardDTO;
import com.exe.member.MemberDTO;

@Controller
public class HomeController {

	
	
	@Autowired
	@Qualifier("boardDAO")
	BoardDAO BoardDAO;
	
	//메인 홈페이지 이동
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainboard(HttpServletRequest request,HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		MemberDTO LoginDTO = (MemberDTO)session.getAttribute("dto");
		request.setAttribute("LoginDTO", LoginDTO);
		
		String imagePath = request.getContextPath() + "/resources/memberImage";
		List<BoardDTO> lists = BoardDAO.getNotice();
		
		request.setAttribute("dto", LoginDTO);
		request.setAttribute("imagePath",imagePath);
		request.setAttribute("notice", lists);
		
		return "temp";
	}	
	
}
