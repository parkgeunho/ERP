package com.exe.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class NoteDAO {
	
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertData(NoteDTO dto){
		
		sessionTemplate.insert("com.exe.note.insertData", dto);
		
	}
	
	public int maxNum(){
		
		int result = sessionTemplate.selectOne("com.exe.note.maxNum");
		return result;
		
		
	}
	
	public void deleteData(int noteNum){
		
		sessionTemplate.delete("com.exe.note.deleteData", noteNum);
	}
	
	public List<NoteDTO> readList(int start,int end,String reader){
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("reader", reader);
		List<NoteDTO> lists = sessionTemplate.selectList("com.exe.note.readlist", params);
		return lists;
	}
	
	public int getCount(){
		
		int result = sessionTemplate.selectOne("com.exe.note.getCount");
		return result;
		
		
	}

}
