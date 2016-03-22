package com.exe.approval;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.member.MemberDTO;

public class ApprovalDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public List<ApprovalDTO> approvalList(String id){
		
		List<ApprovalDTO> lists = sessionTemplate.selectList("com.exe.approval.approvalList",id);
		
		return lists;
	}
	
	
	public int approvalFormMaxNum(){			
		int num = sessionTemplate.selectOne("com.exe.approval.approvalFormMaxNum");
		return num;
	}

	public List<ApprovalFormDTO> approvalFormList(){
		
		List<ApprovalFormDTO> lists = sessionTemplate.selectList("com.exe.approval.approvalFormList");
		
		return lists;
	}
	
	public List<ApprovalFormDTO> getApprovalFormType(){
		
		List<ApprovalFormDTO> lists = sessionTemplate.selectList("com.exe.approval.getApprovalFormType");
		
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
	
	public List<MemberDTO> getApprovalMemberList(String depth1,String depth2,String depth3,String depth4,String depth5){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("depth1", depth1);
		params.put("depth2", depth2);
		params.put("depth3", depth3);
		params.put("depth4", depth4);
		params.put("depth5", depth5);
		
		List<MemberDTO> lists = sessionTemplate.selectList("com.exe.approval.getApprovalMemberList",params);
		return lists;
	}
	
	public MemberDTO getApprovalMember(String id){
		
		MemberDTO dto = sessionTemplate.selectOne("com.exe.approval.getApprovalOptionList",id);
		
		return dto;
	}
	
	public void insertApproval(ApprovalDTO dto){
		
		sessionTemplate.insert("com.exe.approval.insertApproval", dto);
		
		return ;
	}
	
	public int getApprovalMax(String approvalNum){

		int num = sessionTemplate.selectOne("com.exe.approval.getApprovalMax",approvalNum);
		
		return num;
	}
	
	
	
	
	
}
