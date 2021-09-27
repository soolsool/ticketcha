package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.sist.Vo.Reserved_SeatsVo;


public class Reserved_SeatsDao {
	private static Reserved_SeatsDao dao;
	private Reserved_SeatsDao() {
	}
	
	public static Reserved_SeatsDao getInstance() {
		if(dao == null) {
			dao = new Reserved_SeatsDao();
		}
		return dao;
	}
	
	public ArrayList<String> Reserved_Seats_info(String showingDate,int times,String movieTitle){
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select seat from reserved_seats rs, ticketing t where rs.theater_code=t.theater_code and t.showing_date=? and t.round=? and t.movie_title=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pwd = "passa";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, showingDate);
			pstmt.setInt(2, times);
			pstmt.setString(3, movieTitle);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("seat"));
			}
			
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(pstmt != null) {
					pstmt.close();
				}
				
				if(conn != null) {
					conn.close();
				}
				
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
}
