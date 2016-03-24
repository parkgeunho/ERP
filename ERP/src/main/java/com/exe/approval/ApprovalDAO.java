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
	
	public List<ApprovalDTO> approvalSuccessList(String id){
		
		List<ApprovalDTO> lists = sessionTemplate.selectList("com.exe.approval.approvalSuccessList",id);
		
		return lists;
	}
	
	public List<ApprovalDTO> approvalNextIngList(String id){
		
		List<ApprovalDTO> lists = sessionTemplate.selectList("com.exe.approval.approvalNextIngList",id);
		
		return lists;
	}
	
	public List<ApprovalDTO> approvalNextList(String id){
		
		List<ApprovalDTO> lists = sessionTemplate.selectList("com.exe.approval.approvalNextList",id);
		
		return lists;
	}
	
	public List<ApprovalDTO> approvalAgreementList(String id){
		
		List<ApprovalDTO> lists = sessionTemplate.selectList("com.exe.approval.approvalAgreementList",id);
		
		return lists;
	}
	
	public List<ApprovalDTO> approvalReturnList(String id){
		
		List<ApprovalDTO> lists = sessionTemplate.selectList("com.exe.approval.approvalReturnList",id);
		
		return lists;
	}
	
	
	public List<ApprovalDTO> approvalIngList(String id){
		
		List<ApprovalDTO> lists = sessionTemplate.selectList("com.exe.approval.approvalIngList",id);
		
		return lists;
	}
	
	public ApprovalDTO getLeadData(String approvalNum){
		
		ApprovalDTO dto = sessionTemplate.selectOne("com.exe.approval.getLeadData",approvalNum);
		
		return dto;
	}
	
	public String getName(String id){
		
		String returnId = sessionTemplate.selectOne("com.exe.approval.getName",id);
		
		return returnId;
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
	
	public void approvalOK(String approvalNum, String created, int mydepth, String nextUser){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		String mapperAddress = "com.exe.approval.approvalOK";
		mapperAddress += mydepth;
		
		params.put("approvalNum", approvalNum);
		params.put("created", created);
		params.put("nextUser", nextUser);
			
		sessionTemplate.update(mapperAddress, params);
		
	}
	
	public String approvalChk(String approvalNum, int mydepth){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		String mapperAddress = "com.exe.approval.approvalChk";
		mydepth++;
		mapperAddress += mydepth;
				
		params.put("approvalNum", approvalNum);
						
		String nextUser = sessionTemplate.selectOne(mapperAddress, params);
		
		return nextUser;
		
	}
	
	public void approvalSuccess(String approvalNum, String created, int mydepth, String info){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		String mapperAddress = "com.exe.approval.approvalSuccess";
		mapperAddress += mydepth;
		
		params.put("approvalNum", approvalNum);
		params.put("created", created);
		params.put("info", info);
		
		sessionTemplate.update(mapperAddress, params);
				
	}
	
	public void approvalReturn(String approvalNum, int mydepth){
		
		String mapperAddress = "com.exe.approval.approvalReturn";
		mapperAddress += mydepth;
				
		sessionTemplate.update(mapperAddress, approvalNum);
				
	}
	
	
	
}
