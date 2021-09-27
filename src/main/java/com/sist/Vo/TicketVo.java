package com.sist.Vo;

public class TicketVo {
	private String theater_code;
	private String ticketing_date;
	private String ticketing_no;
	private String movie_title;
	private String showing_date;
	private String start_time;
	private String end_time;
	private String running_time;
	private String theater_no;
	private int round;
	private int qty;
	private String refund;
	
	public String getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	public String getTicketing_date() {
		return ticketing_date;
	}
	public void setTicketing_date(String ticketing_date) {
		this.ticketing_date = ticketing_date;
	}
	public String getTicketing_no() {
		return ticketing_no;
	}
	public void setTicketing_no(String ticketing_no) {
		this.ticketing_no = ticketing_no;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getShowing_date() {
		return showing_date;
	}
	public void setShowing_date(String showing_date) {
		this.showing_date = showing_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getRunning_time() {
		return running_time;
	}
	public void setRunning_time(String running_time) {
		this.running_time = running_time;
	}
	public String getTheater_no() {
		return theater_no;
	}
	public void setTheater_no(String theater_no) {
		this.theater_no = theater_no;
	}
	public int getRound() {
		return round;
	}
	public void setRound(int round) {
		this.round = round;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getRefund() {
		return refund;
	}
	public void setRefund(String refund) {
		this.refund = refund;
	}
	public TicketVo(String theater_code, String ticketing_date, String ticketing_no, String movie_title,
			String showing_date, String start_time, String end_time, String running_time, String theater_no, int round,
			int qty, String refund) {
		super();
		this.theater_code = theater_code;
		this.ticketing_date = ticketing_date;
		this.ticketing_no = ticketing_no;
		this.movie_title = movie_title;
		this.showing_date = showing_date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.running_time = running_time;
		this.theater_no = theater_no;
		this.round = round;
		this.qty = qty;
		this.refund = refund;
	}
	public TicketVo(String theater_code, String ticketing_date, String ticketing_no, String movie_title,
			String showing_date, String start_time, String end_time, String theater_no, int round, int qty, String refund) {
		super();
		this.theater_code = theater_code;
		this.ticketing_date = ticketing_date;
		this.ticketing_no = ticketing_no;
		this.movie_title = movie_title;
		this.showing_date = showing_date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.theater_no = theater_no;
		this.round = round;
		this.qty = qty;
		this.refund = refund;
	}
	public TicketVo() {
		super();
	}
}
