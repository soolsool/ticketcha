package com.sist.dao;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.sist.Vo.CustomerVo;
import com.sist.Vo.TicketVo;

public class TicketDao {
	private static TicketDao dao;
	private TicketDao() {}
	public static TicketDao getInstance() {
		if(dao==null)
			dao = new TicketDao();
		return dao;
	}
	
	public int insertCustomer(TicketVo t, CustomerVo c) {
		int re = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
				
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pw = "passa";
		String sql = "INSERT INTO CUSTOMER VALUES(?, ?, ?, ?, ?, ?, ?)";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTheater_code());
			pstmt.setString(2, t.getTicketing_date());
			pstmt.setString(3, t.getTicketing_no());
			pstmt.setString(4, c.getName());
			pstmt.setString(5, c.getBirthdate());
			pstmt.setString(6, c.getTicketing_pswd());
			pstmt.setString(7, c.getPhone());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.printf("예외발생: %s %n", e.getMessage());
		} finally {
			if(pstmt!=null || conn!=null) {
				try {
					pstmt.close();
					conn.close();
				}catch(Exception e) { }
			}
		}
		return re;
	}
	
	public int insertPaying(TicketVo t, String pay_method, String pay_code, int price) {
		int re = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pw = "passa";
		String sql = "INSERT INTO PAY VALUES(?, ?, ?, ?, ?, ?)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTheater_code());
			pstmt.setString(2, t.getTicketing_date());
			pstmt.setString(3, t.getTicketing_no());
			pstmt.setString(4, pay_code);
			pstmt.setString(5, pay_method);
			pstmt.setInt(6, price);
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.printf("예외발생: %s %n", e.getMessage());
		} finally {
			if(pstmt!=null || conn!=null) {
				try {
					pstmt.close();
					conn.close();
				}catch(Exception e) { }
			}
		}
		return re;
	}
	
	public int insertSeats(TicketVo t, String seat, String code) { //결제 완료 시 예약 좌석 입력
		int re = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pw = "passa";
		String sql = "INSERT INTO RESERVED_SEATS VALUES(SEQ_SEATS.NEXTVAL,?,?,?,?,?)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
				re = -1;
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, t.getTheater_code());
				pstmt.setString(2, t.getTicketing_date());
				pstmt.setString(3, t.getTicketing_no());
				pstmt.setString(4, seat);
				pstmt.setString(5, code);
				re = pstmt.executeUpdate();	

		} catch (Exception e) {
			System.out.printf("예외발생: %s %n", e.getMessage());
		} finally {
			if(pstmt!=null || conn!=null) {
				try {
					pstmt.close();
					conn.close();
				}catch(Exception e) { }
			}
		}
		return re;
	}
	
	public int insertTicketing(TicketVo t) { //결제 완료 시 티켓 예매내역 입력
		int re = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pw = "passa";
		String sql = "INSERT INTO TICKETING VALUES(?,?,?,?,?,?,?,?,?,?,?,0)";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTheater_code());
			pstmt.setString(2, t.getTicketing_date());
			pstmt.setString(3, t.getTicketing_no());
			pstmt.setString(4, t.getMovie_title());
			pstmt.setString(5, t.getShowing_date());
			pstmt.setString(6, t.getStart_time());
			pstmt.setString(7, t.getEnd_time());
			pstmt.setString(8, t.getRunning_time());
			pstmt.setString(9, t.getTheater_no());
			pstmt.setInt(10, t.getRound());
			pstmt.setInt(11, t.getQty());
			re = pstmt.executeUpdate();	
		} catch (Exception e) {
			System.out.printf("예외발생: %s %n", e.getMessage());
		} finally {
			if(pstmt!=null || conn!=null) {
				try {
					pstmt.close();
					conn.close();
				}catch(Exception e) { }
			}
		}
		return re;
	}
	
	public boolean findTicketInfo(String birthdate, String phone, String pswd) {//예매정보 입력하여 티켓 예매 여부 조회
		boolean re = false;
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pw = "passa";
		String sql = "SELECT COUNT(NAME) FROM CUSTOMER WHERE BIRTHDATE=? AND TICKETING_PASSWORD=? AND PHONE_NUMBER=?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, birthdate);
			pstmt.setString(2, pswd);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			if(rs.next())
				re=true;
		}catch (Exception e) {
			System.out.printf("예외발생: %s %n", e.getMessage());
		}finally {
			if(rs!=null||pstmt!=null||conn!=null) {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				}catch (Exception e) {
					System.out.printf("예외발생: %s %n %s %n", e.getMessage(), e.getStackTrace());
				}
			}
		}
		return re;
	}
	
	public ArrayList<TicketVo> getTicketInfo(String birthdate, String phone, String pswd) {//예매 완료 후 고객정보 입력하여 예매내역 조회
		ArrayList<TicketVo> list = new ArrayList<TicketVo>();
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pw = "passa";
		String sql = "select distinct t.theater_code, t.ticketing_date, t.ticketing_no, movie_title, showing_date, start_time, end_time, theater_no, round, qty, refund"
					+ " from ticketing t, customer c, reserved_seats rs "
					+ " where t.theater_code=c.theater_code and t.ticketing_date = c.ticketing_date and t.ticketing_no = c.ticketing_no "
					+ " and birthdate=? and phone_number=? and ticketing_password=?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, birthdate);
			pstmt.setString(2, phone);
			pstmt.setString(3, pswd);
			rs = pstmt.executeQuery();
				
			while(rs.next()) {
				list.add(new TicketVo(rs.getString("THEATER_CODE"), rs.getString("TICKETING_DATE"), rs.getString("TICKETING_NO"),
						rs.getString("MOVIE_TITLE"), rs.getString("SHOWING_DATE"), rs.getString("START_TIME"), rs.getString("END_TIME"),
						rs.getString("THEATER_NO"),rs.getInt("ROUND"), rs.getInt("QTY"), rs.getString("REFUND")));
			}
		}catch (Exception e) {
			System.out.printf("예외발생: %s %n", e.getMessage());
		}finally {
			if(rs!=null||pstmt!=null||conn!=null) {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				}catch (Exception e) {
					System.out.printf("예외발생: %s %n", e.getMessage());
				}
			}
		}
		return list;
	}
	
	public int cancelTicketing(String theater_code, String ticketing_date, String ticketing_no) {
		int re = -1;
		Connection conn = null;
		Statement stmt = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pw = "passa";
		String sql = "UPDATE TICKETING SET REFUND=1 WHERE THEATER_CODE='"+theater_code+"' AND TICKETING_DATE='"+ticketing_date+"' AND TICKETING_NO='"+ticketing_no+"'";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			stmt = conn.createStatement();
			re = stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.printf("예외발생: %s %n", e.getMessage());
		} finally {
			if(stmt!=null || conn!=null) {
				try {
					stmt.close();
					conn.close();
				}catch(Exception e) { }
			}
		}
		return re;
	}
	public int cancelPay(String theater_code, String ticketing_date, String ticketing_no) {
		int re = -1;
		Connection conn = null;
		Statement stmt = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pw = "passa";
		String sql = "UPDATE PAY SET TOTAL_PRICE = TOTAL_PRICE*-1 WHERE THEATER_CODE='"+theater_code+"' AND TICKETING_DATE='"+ticketing_date+"' AND TICKETING_NO='"+ticketing_no+"'";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			stmt = conn.createStatement();
			re = stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.printf("예외발생: %s %n", e.getMessage());
		} finally {
			if(stmt!=null || conn!=null) {
				try {
					stmt.close();
					conn.close();
				}catch(Exception e) { }
			}
		}
		return re;
	}
	public int cancelSeats(String theater_code, String ticketing_date, String ticketing_no) {
		int re = -1;
		Connection conn = null;
		Statement stmt = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pw = "passa";
		String sql = "DELETE RESERVED_SEATS WHERE THEATER_CODE='"+theater_code+"' AND TICKETING_DATE='"+ticketing_date+"' AND TICKETING_NO='"+ticketing_no+"'";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			stmt = conn.createStatement();
			re = stmt.executeUpdate(sql);		
		} catch (Exception e) {
			System.out.printf("예외발생: %s %n", e.getMessage());
		} finally {
			if(stmt!=null || conn!=null) {
				try {
					stmt.close();
					conn.close();
				}catch(Exception e) { }
			}
		}
		return re;
	}

	public int calcPrice(int a, int s, int y) { // 티켓 가격 계산
		int price = 0;
		a = a==0?0:a*10000;
		s = s==0?0:s*6000; 
		y = y==0?0:y*8000;
		price = a + s + y;
		return price;
	}
	
	public String getTicketingDate() {
		String re = "";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pw = "passa";
		String sql = "SELECT TO_CHAR(SYSDATE, 'YYMMDD') FROM DUAL";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next())
				re = rs.getString(1);
		} catch (Exception e) {
			System.out.printf("예외발생: %s %n", e.getMessage());
		} finally {
			if(rs!=null || stmt!=null || conn!=null) {
				try {
					rs.close();
					stmt.close();
					conn.close();
				}catch(Exception e) { }
			}
		}
		return re;
	}
	
	public String getNextNo() {
		String re = "";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##passa";
		String pw = "passa";
		String sql = "SELECT LPAD(MAX(TICKETING_NO)+1,4,0) FROM TICKETING";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
				re = rs.getString(1);
		} catch (Exception e) {
			System.out.printf("예외발생: %s %n", e.getMessage());
		} finally {
			if(rs!=null||stmt!=null || conn!=null) {
				try {
					rs.close();
					stmt.close();
					conn.close();
				}catch(Exception e) { }
			}
		}
		return re;
	}
}