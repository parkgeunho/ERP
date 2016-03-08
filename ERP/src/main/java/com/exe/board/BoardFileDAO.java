package com.exe.board;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardFileDAO {
	
	private Connection conn = null;
	
	public BoardFileDAO(Connection conn){
		this.conn = conn;		
	}	
	
public int getMaxNum(){
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "select nvl(max(num),0) from erpboardfile";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				result = rs.getInt(1);
			
			}
			
			pstmt.close();
			rs.close();		
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}	
	
		public int insertData(BoardFileDTO dto){
			
			int result = 0;
			PreparedStatement pstmt = null;
			String sql;
	
			try {
				
				sql = "insert into erpboardfile(boardnum, saveFileName,";
				sql+= "originalFileName) values(?,?,?)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, dto.getBoardNum());				
				pstmt.setString(2, dto.getSaveFileName());
				pstmt.setString(3, dto.getOriginalFileName());
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
							
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		
			return result;		
		}
	
	
		public List<BoardFileDTO> getList(int start, int end){
			
			List<BoardFileDTO> lists = new ArrayList<BoardFileDTO>();
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
	
			try {
				
				sql = "select * from (";
				sql+= "select rownum rnum,data.* from (";
				sql+= "select boardNum,saveFileName,originalFileName ";
				sql+= "from erpboardfile order by num desc) data) ";
				sql+= "where rnum>=? and rnum<=?";
				
				pstmt = conn.prepareStatement(sql);
				
				
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					
					BoardFileDTO dto = new BoardFileDTO();
					
					dto.setBoardNum(rs.getInt("boardNum"));					
					dto.setSaveFileName(rs.getString("saveFileName"));
					dto.setOriginalFileName(rs.getString("originalFileName"));
					
					lists.add(dto);				
					
				}
				
				rs.close();
				pstmt.close();			
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return lists;
			
		}	
	
		public BoardFileDTO getReadData(int boardNum){
			
			BoardFileDTO dto = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				
				sql = "select boardNum,saveFileName,originalFileName ";
				sql+= "from erpboardfile where boardNum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, boardNum);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()){
								
					dto = new BoardFileDTO();
					
					dto.setBoardNum(rs.getInt("boardNum"));					
					dto.setSaveFileName(rs.getString("saveFileName"));
					dto.setOriginalFileName(rs.getString("originalFileName"));
					
			}
				
				rs.close();
				pstmt.close();			
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return dto;
	}	
		
		public int deleteData(int BoardNum){
			
			int result = 0;
			
			PreparedStatement pstmt = null;
			String sql;
			
			try {
				
				sql = "delete erpboardfile where boardNum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, BoardNum);
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
				
				
				
				
				
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return result;
			
		}
		
		
		
		//전체 데이터 갯수 세는 메소드
		public int getDataCount(){  //String searchKey,String searchValue는 검색
			
			int totalData = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql;
			
			try {
				
							
				sql = "select nvl(count(*),0) from erpboardfile ";
							
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next())
					totalData = rs.getInt(1);
				
				pstmt.close();
				
				rs.close();
				
							
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			return totalData;
			
		}
			
		
		
	
	

}
