package com.sist.Vo;

public class MovieVo {
	private String title_text;
	private String movie_idx;
	private String img_src;
	private String running_time;
	public String getTitle_text() {
		return title_text;
	}
	public void setTitle_text(String title_text) {
		this.title_text = title_text;
	}
	public String getMovie_idx() {
		return movie_idx;
	}
	public void setMovie_idx(String movie_idx) {
		this.movie_idx = movie_idx;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public String getRunning_time() {
		return running_time;
	}
	public void setRunning_time(String running_time) {
		this.running_time = running_time;
	}
	public MovieVo(String title_text, String movie_idx, String img_src, String running_time) {
		super();
		this.title_text = title_text;
		this.movie_idx = movie_idx;
		this.img_src = img_src;
		this.running_time = running_time;
	}
	public MovieVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
