package com.exe.board;

import org.mybatis.spring.SqlSessionTemplate;

public class BoardFileDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public void insertData(BoardFileDTO filedto){
		
		sessionTemplate.insert("com.exe.board.BoardFileMapper.insertData", filedto);
		
	}
	public int boardFileMaxNum(){
		
		int result = sessionTemplate.selectOne("com.exe.board.BoardFileMapper.maxNum");
		return result;
		
	}
	public BoardFileDTO selectData(int num){
		
		BoardFileDTO dto = sessionTemplate.selectOne("com.exe.board.BoardFileMapper.selectData",num);
		
		return dto;
	}
	

}
