package com.sist.Vo;

public class TheaterVo {
	private String Theater_code;
	private String Area;
	private String Theater_Name;
	public String getTheater_code() {
		return Theater_code;
	}
	public void setTheater_code(String theater_code) {
		Theater_code = theater_code;
	}
	public String getArea() {
		return Area;
	}
	public void setArea(String area) {
		Area = area;
	}
	public String getTheater_Name() {
		return Theater_Name;
	}
	public void setTheater_Name(String theater_Name) {
		Theater_Name = theater_Name;
	}
	public TheaterVo(String theater_code, String area, String theater_Name) {
		super();
		Theater_code = theater_code;
		Area = area;
		Theater_Name = theater_Name;
	}
	public TheaterVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
