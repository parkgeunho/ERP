package com.exe.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.insa.BuseoDTO;

public class MemberDAO {
	
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertData(MemberDTO dto){
		
		sessionTemplate.insert("com.exe.member.insertData",dto);
		
		
		
	}
	
	public int maxNum(){
		
		int result = sessionTemplate.selectOne("com.exe.member.maxNum");
		
		return result;
		
	}
	
	public String idOk(String id){
		
		String result = sessionTemplate.selectOne("com.exe.member.idOk",id);
		
		return result;
		
	}
	
	public List<BuseoDTO> depth1(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.depth1");
		
		return lists;
		
	}
	
	
	public List<BuseoDTO> depth2(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.depth2");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth3(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.depth3");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth4(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.depth4");
		
		return lists;
		
	}

	
	public List<BuseoDTO> depth5(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.depth5");
		
		return lists;
		
	}
	
	
	
	
	
	

}
