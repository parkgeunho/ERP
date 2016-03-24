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
		
		sessionTemplate.insert("com.exe.buseoControl.NoteinsertData", dto);
		
	}
	
	public int maxNum(){
		
		int result = sessionTemplate.selectOne("com.exe.buseoControl.NotemaxNum");
		return result;
		
		
	}
	
	public void deleteData(int noteNum){
		
		sessionTemplate.delete("com.exe.buseoControl.NotedeleteData", noteNum);
	}
	
	public List<NoteDTO> readList(int start,int end,String reader){
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("start", start);
		params.put("end", end);
		params.put("reader", reader);
		List<NoteDTO> lists = sessionTemplate.selectList("com.exe.buseoControl.Notereadlist", params);
		return lists;
	}
	
	public int getCount(String reader){
		
		int result = sessionTemplate.selectOne("com.exe.buseoControl.NotegetCount",reader);
		return result;
		
		
	}
	
	public int ReadCount(String reader){
		int result = sessionTemplate.selectOne("com.exe.buseoControl.NoteReadCount",reader);
		return result;
		
	}

}
