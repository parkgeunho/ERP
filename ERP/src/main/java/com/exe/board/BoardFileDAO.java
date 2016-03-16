package com.exe.board;

import org.mybatis.spring.SqlSessionTemplate;

public class BoardFileDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	public int maxNum(){
		
		int result = sessionTemplate.selectOne("com.exe.board.boardNum");
		return result;
		
	}
	public void boardCreated(BoardFileDTO filedto){
		
		sessionTemplate.insert("com.exe.board.boardCreated", filedto);
		
	}

}
