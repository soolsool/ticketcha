package com.sist.Vo;

public class Reserved_SeatsVo {
	private String Reservation_No;
	private String Seat;
	private String Ticketing_Date;
	private String Ticketing_No;
	private String Theater_Code;
	private String watch_code;
	public String getReservation_No() {
		return Reservation_No;
	}
	public void setReservation_No(String reservation_No) {
		Reservation_No = reservation_No;
	}
	public String getSeat() {
		return Seat;
	}
	public void setSeat(String seat) {
		Seat = seat;
	}
	public String getTicketing_Date() {
		return Ticketing_Date;
	}
	public void setTicketing_Date(String ticketing_Date) {
		Ticketing_Date = ticketing_Date;
	}
	public String getTicketing_No() {
		return Ticketing_No;
	}
	public void setTicketing_No(String ticketing_No) {
		Ticketing_No = ticketing_No;
	}
	public String getTheater_Code() {
		return Theater_Code;
	}
	public void setTheater_Code(String theater_Code) {
		Theater_Code = theater_Code;
	}
	public String getWatch_code() {
		return watch_code;
	}
	public void setWatch_code(String watch_code) {
		this.watch_code = watch_code;
	}
	public Reserved_SeatsVo(String reservation_No, String seat, String ticketing_Date, String ticketing_No,
			String theater_Code, String watch_code) {
		super();
		Reservation_No = reservation_No;
		Seat = seat;
		Ticketing_Date = ticketing_Date;
		Ticketing_No = ticketing_No;
		Theater_Code = theater_Code;
		this.watch_code = watch_code;
	}
	public Reserved_SeatsVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
