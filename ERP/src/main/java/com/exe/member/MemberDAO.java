package com.exe.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

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
		
		String result = sessionTemplate.selectOne("com.exe.member.idOK",id);
		
		return result;
		
	}
	
	public List<BuseoDTO> depth1(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.depth0");
		
		return lists;
		
	}
	
	
	public List<BuseoDTO> depth2(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.depth1");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth3(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.depth2");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth4(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.depth3");
		
		return lists;
		
	}

	
	public List<BuseoDTO> depth5(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.depth4");
		
		return lists;
		
	}
	
	public MemberDTO readOne(int num){
		
		
		MemberDTO dto = sessionTemplate.selectOne("com.exe.member.readOne",num);
		
		return dto;
		
	}
	
	public MemberDTO readOne(String id){
		
		
		MemberDTO dto = sessionTemplate.selectOne("com.exe.member.readTwo",id);
		
		return dto;
		
	}
	
	public MemberDTO login(MemberDTO dto){
		
		MemberDTO result = sessionTemplate.selectOne("com.exe.member.login",dto);
		
		return result;
		
		
	}
	
	
	public List<BuseoDTO> buseo2(int num){
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.buseo2",num);
		
		return lists;
	}
	
	public List<BuseoDTO> buseo3(int num){
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.buseo3",num);
		
		return lists;
	}
	
	public List<BuseoDTO> buseo4(int num){
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.buseo4",num);
		
		return lists;
	}
	
	public List<BuseoDTO> buseo5(int num){
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.member.buseo5",num);
		
		return lists;
	}
	
	public void updatedData(MemberDTO dto) {
		
		sessionTemplate.selectOne("com.exe.member.updatedData",dto);
		
	}
	
	public void deleteData(int num){
		
		sessionTemplate.delete("com.exe.member.deleteData", num);
	}
	
	public List<MemberDTO> memberList(Map<String, Object> hmap){
		
		List<MemberDTO> lists = sessionTemplate.selectList("com.exe.member.memberList",hmap);
		
		return lists;
		
	}
	
	
	
	
	
	
	
	

}
