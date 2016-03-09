package com.exe.approval;

import org.mybatis.spring.SqlSessionTemplate;

public class ApprovalDAO {

	private SqlSessionTemplate sessionTemplate;
	
	
	//approvalForm--------------------------------------------
	
	public int approvalFormMaxNum(){
			
		int num = sessionTemplate.selectOne("com.exe.approval.approvalFormMaxNum");
		
		return num;
	}

	//approvalForm--------------------------------------------
	
	
	
}
