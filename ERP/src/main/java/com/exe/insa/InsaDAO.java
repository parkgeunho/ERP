package com.exe.insa;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.member.MemberDTO;



public class InsaDAO {
	
	
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
		
	public int maxNum(){
		
		int result = sessionTemplate.selectOne("com.exe.insa.maxNum");
		return result;
	}
	
	public void buseoCreated(BuseoDTO dto){
		
		sessionTemplate.insert("com.exe.insa.buseoCreated", dto);
		
	}
	
	public List<BuseoDTO> buseoList(){
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.list");
		
		return lists;
		
	}
	public int replyNum(Map<String, Object> hMap){
		
		int result = sessionTemplate.selectOne("com.exe.insa.replyNum",hMap);
		
		return result;
		
	}
	
	public void updateReply(Map<String, Object> hMap){
		
		sessionTemplate.update("com.exe.insa.setReplyNum", hMap);
		
	}
	
	public BuseoDTO readData(int buseoNum){
		
		BuseoDTO dto = sessionTemplate.selectOne("com.exe.insa.ReadData", buseoNum);
		return dto;
	}
	
	public void updateOrder(Map<String, Object> hMap){
		sessionTemplate.update("com.exe.insa.orderNoUpdate",hMap);
		
	}
	
	public List<BuseoDTO> getGroup(){
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.group");
		return lists;
	}
	
	public List<BuseoDTO> getDepth(){
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth");
		return lists;
		
	}
	
	public void deleteBuseo(int buseoNum){
		sessionTemplate.delete("com.exe.insa.buseoDelete", buseoNum);
	}
	
	public void updateBuseo(BuseoDTO dto){
		
		sessionTemplate.update("com.exe.insa.buseoUpdate",dto);
	}
	
	public BuseoDTO readBuseo(int buseoNum){
		BuseoDTO dto =  sessionTemplate.selectOne("com.exe.insa.readBuseo", buseoNum);
		return dto;
		
	}
	
	public List<MemberDTO> getMemberList(int start, int end,String depth1,String depth2,String depth3,String depth4,String depth5,String searchValue){
		
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("depth1", depth1);
		params.put("depth2", depth2);
		params.put("depth3", depth3);
		params.put("depth4", depth4);
		params.put("depth5", depth5);
		params.put("searchValue", searchValue);
		
		
		List<MemberDTO> lists = sessionTemplate.selectList("com.exe.insa.memberList",params);
		return lists;
	}
	
	public int dataCount(String depth1,String depth2,String depth3,String depth4,String depth5,String searchValue){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("depth1", depth1);
		params.put("depth2", depth2);
		params.put("depth3", depth3);
		params.put("depth4", depth4);
		params.put("depth5", depth5);
		params.put("searchValue", searchValue);
		

		
		int result = sessionTemplate.selectOne("com.exe.insa.getDataCount",params);
		return result;
	}



}
