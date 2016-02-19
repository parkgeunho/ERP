package com.exe.insa;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;



public class InsaDAO {
	
	
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	
	
	public List<BuseoDTO> getBuseo(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.buseolist");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth1(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth1");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth1etc(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth1etc");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth2(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth2");
		
		return lists;
		
	}
	public List<BuseoDTO> depth2etc(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth2etc");
		
		return lists;
		
	}
	public List<BuseoDTO> depth3(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth3");
		
		return lists;
		
	}
	
	public List<BuseoDTO> depth3etc(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth3etc");
		
		return lists;
		
	}
	public List<BuseoDTO> depth4(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth4");
		
		return lists;
		
	}

	public List<BuseoDTO> depth4etc(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth4etc");
		
		return lists;
		
	}
	
	
	public List<BuseoDTO> depth5(){
		
		
		List<BuseoDTO> lists = sessionTemplate.selectList("com.exe.insa.depth5");
		
		return lists;
		
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


}
