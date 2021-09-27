package com.sist.Vo;

public class AreaVo {
	private String Theater_code;
	private String Area_name;
	private String Theater_name;
	public String getTheater_code() {
		return Theater_code;
	}
	public void setTheater_code(String theater_code) {
		Theater_code = theater_code;
	}
	public String getArea_name() {
		return Area_name;
	}
	public void setArea_name(String area_name) {
		Area_name = area_name;
	}
	public String getTheater_name() {
		return Theater_name;
	}
	public void setTheater_name(String theater_name) {
		Theater_name = theater_name;
	}
	public AreaVo(String theater_code, String area_name, String theater_name) {
		super();
		Theater_code = theater_code;
		Area_name = area_name;
		Theater_name = theater_name;
	}
	public AreaVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
