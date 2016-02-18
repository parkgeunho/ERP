package com.exe.member;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAO {
	
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertData(MemberDTO dto){
		
		sessionTemplate.insert("com.exe.member.insertData",dto);
		
		
		
	}
	
	
	
	
	
	

}
