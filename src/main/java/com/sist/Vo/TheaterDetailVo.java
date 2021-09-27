package com.sist.Vo;

public class TheaterDetailVo {
	private int round_idx;
	private String theater_no;
	private int round;
	private String start_time;
	private String  idx_movie;
	public int getRound_idx() {
		return round_idx;
	}
	public void setRound_idx(int round_idx) {
		this.round_idx = round_idx;
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
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getIdx_movie() {
		return idx_movie;
	}
	public void setIdx_movie(String idx_movie) {
		this.idx_movie = idx_movie;
	}
	public TheaterDetailVo(int round_idx, String theater_no, int round, String start_time, String idx_movie) {
		super();
		this.round_idx = round_idx;
		this.theater_no = theater_no;
		this.round = round;
		this.start_time = start_time;
		this.idx_movie = idx_movie;
	}
	public TheaterDetailVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
