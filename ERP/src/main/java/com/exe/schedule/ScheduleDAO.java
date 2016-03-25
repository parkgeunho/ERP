package com.exe.schedule;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.exe.board.BoardDTO;

public class ScheduleDAO {
	
	private SqlSessionTemplate sessionTemplate;
	   
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public int getMaxNum(){
	      
		int result = 0;

		result = sessionTemplate.selectOne("ScheduleMapper.maxNum");
	      
		return result;
	}
	
	public void insertSchedule(ScheduleDTO dto){
	      
		sessionTemplate.insert("ScheduleMapper.insertData",dto);
	}
	
	public List<ScheduleDTO> getList(String id){
	      
		List<ScheduleDTO> lists = sessionTemplate.selectList("ScheduleMapper.getLists", id);
	      
		return lists;
	}
	
	public List<ScheduleDTO> getListsMain(String id){
	      
		List<ScheduleDTO> lists = sessionTemplate.selectList("ScheduleMapper.getListsMain", id);
	      
		return lists;
	}
	   
	   //전체 데이터수 구하기
	public int getDataCount(String id){
	      
		int result = 0;
	      
		result = sessionTemplate.selectOne("ScheduleMapper.getDataCount",id);
	      
		return result;
	}
	
	public ScheduleDTO getReadData(String scheduleNum){
	      
		ScheduleDTO dto = sessionTemplate.selectOne("ScheduleMapper.getReadData", scheduleNum);
	      
		return dto;
	}

	public void updateData(ScheduleDTO dto){

		sessionTemplate.update("ScheduleMapper.updateData",dto);
	}

	public void dropData(ScheduleDTO dto){

		sessionTemplate.update("ScheduleMapper.dropData",dto);
	}

	public void deleteData(String ScheduleNum){

		sessionTemplate.delete("ScheduleMapper.deleteData",ScheduleNum);
	}
}






















