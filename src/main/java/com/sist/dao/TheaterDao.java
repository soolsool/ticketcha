package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.sist.Vo.AreaVo;
import com.sist.Vo.TheaterDetailVo;


public class TheaterDao {
	
	private static TheaterDao dao;
	private TheaterDao() {
		
	}
	
	public static TheaterDao getInstance() {
		if (dao == null) {
			dao = new TheaterDao();
			
		}
		return dao;
	}
	public String showing_date() {
		String sql = "select sysdate from dual";
		String url ="jdbc:oracle:thin:@localhost:1521:XE";
		String user="c##passa";
		String pwd = "passa";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String date="";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				date=rs.getString("sysdate");
			}
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return date;
	}
	public ArrayList<AreaVo> areainfo(){
		ArrayList<AreaVo> list = new ArrayList<AreaVo>();
		String sql = "SELECT DISTINCT AREA_NAME FROM THEATER ORDER BY AREA_NAME";
		String url ="jdbc:oracle:thin:@localhost:1521:XE";
		String user="c##passa";
		String pwd = "passa";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				AreaVo tv = new AreaVo();
				tv.setArea_name(rs.getString(1));
				list.add(tv);
			}	
		}catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return list;
	};
	
	
	public ArrayList<AreaVo> getTheater(String area_name) {
		ArrayList<AreaVo> list = new ArrayList<AreaVo>();
		String sql = "SELECT THEATER_NAME FROM THEATER WHERE AREA_NAME=?";
		String url ="jdbc:oracle:thin:@localhost:1521:XE";
		String user="c##passa";
		String pwd = "passa";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, area_name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AreaVo tv = new AreaVo();
				tv.setTheater_name(rs.getString("theater_name"));
				list.add(tv);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
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
	
	public String Theater_code(String Theater_name){
		String sql = "select Theater_code from Theater where Theater_name = ?";
		String Theater_code = null;
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
			pstmt.setString(1, Theater_name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				Theater_code=rs.getString("Theater_code");
				
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
		return Theater_code;
	}
	
	public ArrayList<TheaterDetailVo> findDetail(String movie_idex){
		ArrayList<TheaterDetailVo> list = new ArrayList<TheaterDetailVo>();
		String sql = "SELECT THEATER_NO, ROUND, START_TIME"
				+ "	FROM THEATER_DETAIL"
				+ "	WHERE IDX_MOVIE=?"
				+ "	AND START_TIME > (SELECT TO_CHAR(SYSDATE + 3/24, 'HH24MI') TIME"
				+ "					FROM DUAL)"
				+ "	ORDER BY START_TIME";
		String url ="jdbc:oracle:thin:@localhost:1521:XE";
		String user="c##passa";
		String pwd = "passa";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie_idex);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TheaterDetailVo td = new TheaterDetailVo();
				td.setTheater_no(rs.getString("theater_no"));
				td.setRound(rs.getInt("round"));
				td.setStart_time(rs.getString("start_time"));
				list.add(td);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
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
