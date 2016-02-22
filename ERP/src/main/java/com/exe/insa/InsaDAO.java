package com.exe.insa;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;



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
	


}
