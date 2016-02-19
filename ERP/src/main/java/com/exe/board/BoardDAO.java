package com.exe.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;



public class BoardDAO {
	
	 private SqlSessionTemplate sessionTemplate;
	   
	   public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
	      this.sessionTemplate = sessionTemplate;
	   }
	   
	   //1.num의 최대값
	   public int getMaxNum(){
	      
	      int result = 0;
	      
	      result = sessionTemplate.selectOne("com.exe.board.BoardMapper.maxNum");
	      
	      return result;
	   }
	   
	   //입력(created.jsp->created_ok.jsp)
	   public void insertData(BoardDTO dto){
	      
	      sessionTemplate.insert("com.exe.board.BoardMapper.insertData",dto);
	   }
	   
	   //전체데이터
	   public List<BoardDTO> getList(int start, int end,String searchKey, String searchValue){
	      
	      HashMap<String, Object> params = new HashMap<String, Object>();
	      
	      params.put("start", start);
	      params.put("end", end);
	      params.put("searchKey", searchKey);
	      params.put("searchValue", searchValue);
	      
	      List<BoardDTO> lists = sessionTemplate.selectList("com.exe.board.BoardMapper.getLists",params);
	      
	      return lists;
	   }
	   
	   //전체 데이터수 구하기
	   public int getDataCount(String searchKey,String searchValue){
	      
	      int result = 0;
	      
	      HashMap<String, Object> params = new HashMap<String, Object>();
	      
	      params.put("searchKey", searchKey);
	      params.put("searchValue", searchValue);
	      
	      result = sessionTemplate.selectOne("com.exe.board.BoardMapper.getDataCount",params);
	      
	      return result;
	      
	   }
	   
	   //조회수증가
	   public void updateHitCount(int boardNum){
	      
	      sessionTemplate.update("com.exe.board.BoardMapper.updateHitCount",boardNum);
	   }
	   
	   //한명의 데이터 출력
	   public BoardDTO getReadData(int boardNum){
	      
	      BoardDTO dto = sessionTemplate.selectOne("com.exe.board.BoardMapper.getReadData",boardNum);
	      
	      return dto;
	   }
	   
	   //삭제
	   public void deleteData(int boardNum){
	      
	      sessionTemplate.delete("com.exe.board.BoardMapper.deleteData",boardNum);
	   }
	   
	   //수정
	   public void updateData(BoardDTO dto){

	      sessionTemplate.update("com.exe.board.BoardMapper.updateData",dto);
	   }
	   
	
	
	
	

}
