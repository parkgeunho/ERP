package com.exe.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ApprovalDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
		
	//approvalForm--------------------------------------------
	
	public int approvalFormMaxNum(){			
		int num = sessionTemplate.selectOne("com.exe.approval.approvalFormMaxNum");
		return num;
	}

	public List<ApprovalFormDTO> approvalFormList(){
		
		List<ApprovalFormDTO> lists = sessionTemplate.selectList("com.exe.approval.approvalFormList");
		
		return lists;
	}
	
	public ApprovalFormDTO getApprovalForm(int num){
		
		ApprovalFormDTO dto = sessionTemplate.selectOne("com.exe.approval.getApprovalForm",num);
		
		return dto;
	}
	
	public void approvalFormInsert(ApprovalFormDTO dto){
		
		sessionTemplate.insert("com.exe.approval.insertApprovalForm", dto);
		
		return ;
	}
	
	//approvalForm--------------------------------------------
	
	
	
}
