package com.exe.insa;

import java.util.List;
import java.util.Map;



import org.mybatis.spring.SqlSessionTemplate;

import com.exe.member.MemberDTO;

public class ListDAO {
	
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public int maxNum(){
		
		int result = sessionTemplate.selectOne("com.exe.buseoControl.maxNum");
		return result;
	}
	
	public void boardCreated(ListDTO dto){
		
		sessionTemplate.insert("com.exe.buseoControl.boardCreated", dto);
		
	}
	
	public List<ListDTO> boardList(){
		
		List<ListDTO> lists = sessionTemplate.selectList("com.exe.buseoControl.list");
		
		return lists;
		
	}
	
	
	public ListDTO readData(int listNum){
		
		ListDTO dto = sessionTemplate.selectOne("com.exe.buseoControl.ReadData", listNum);
		return dto;
	}
	
	public void updateOrder(Map<String, Object> hMap){
		sessionTemplate.update("com.exe.buseoControl.orderNoUpdate",hMap);
		
	}
	
	public int replyNum(Map<String, Object> hMap){
		
		int result = sessionTemplate.selectOne("com.exe.buseoControl.replyNum",hMap);
		
		return result;
		
	}
	
	public void updateReply(Map<String, Object> hMap){
		
		sessionTemplate.update("com.exe.buseoControl.setReplyNum", hMap);
		
	}
	
	public List<ListDTO> getGroup(){
		List<ListDTO> lists = sessionTemplate.selectList("com.exe.buseoControl.group");
		return lists;
	}
	
	public List<ListDTO> getDepth(){
		List<ListDTO> lists = sessionTemplate.selectList("com.exe.buseoControl.depth");
		return lists;
		
	}
	
	public List<MemberDTO> memberList(){
		
		List<MemberDTO> lists = sessionTemplate.selectList("com.exe.buseoControl.memberList");
		return lists;
	}
	
	public void boardDelete(int listNum){
		sessionTemplate.delete("com.exe.buseoControl.boardDelete", listNum);
	}
	
	
	public void boardMember(ListDTO dto){
		
		sessionTemplate.update("com.exe.buseoControl.boardMember", dto);
		
	}
	
	public void boardBuseo(ListDTO dto){
		sessionTemplate.update("com.exe.buseoControl.boardBuseo",dto);
		
	}
	public void boardUpdate(ListDTO dto){
		sessionTemplate.update("com.exe.buseoControl.boardUpdate",dto);
		
	}
	
	public void boardListDelete(int listNum){
		sessionTemplate.delete("com.exe.buseoControl.boardListDelete", listNum);
	}
	
	public void boardReplyDelete(int parent){
		sessionTemplate.delete("com.exe.buseoControl.boardReplyDelete", parent);
	}
	
	
	

}
