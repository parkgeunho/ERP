package com.exe.insa;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;



public class InsaDAO {
	
	
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	
	
	public List<BuseoDTO> getBuseo(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.buseolist");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth1(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth1");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth1etc(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth1etc");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth2(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth2");
		
		return lists;
		
	}
	public List<BuseoDTO> depth2etc(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth2etc");
		
		return lists;
		
	}
	public List<BuseoDTO> depth3(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth3");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth3etc(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth3etc");
		
		return lists;
		
	}
	public List<BuseoDTO> depth4(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth4");
		
		return lists;
		
	}

	public List<BuseoDTO> depth4etc(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth4etc");
		
		return lists;
		
	}
	
	
	public List<BuseoDTO> depth5(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth5");
		
		return lists;
		
	}
	


}
