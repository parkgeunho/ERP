package com.exe.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;



public class LoginInterceptor implements HandlerInterceptor{

	

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object object, ModelAndView mav) throws Exception {
	
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object object) throws Exception {
HttpSession session = request.getSession();
		
		
		//id라는 세션key를 가진 정보가 널일경우 로그인페이지로 이동
		if(session.getAttribute("dto")==null){
			System.out.println("없을떄 들어옴");
			response.sendRedirect("/erp/login.action");
			
			return false;
		}
		if(session.getAttribute("dto")!=null){
			System.out.println("있을때 들어옴");
			
			
			
			return true;
			
			
		}
		
	   return false;
		
	}
	
	
	
}
