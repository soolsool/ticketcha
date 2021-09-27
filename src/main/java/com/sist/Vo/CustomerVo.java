package com.sist.Vo;

public class CustomerVo {
	private String name;
	private String birthdate;
	private String ticketing_pswd;
	private String phone;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getTicketing_pswd() {
		return ticketing_pswd;
	}
	public void setTicketing_pswd(String ticketing_pswd) {
		this.ticketing_pswd = ticketing_pswd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public CustomerVo(String name, String birthdate, String ticketing_pswd, String phone) {
		super();
		this.name = name;
		this.birthdate = birthdate;
		this.ticketing_pswd = ticketing_pswd;
		this.phone = phone;
	}
	public CustomerVo() {
		super();
	}
}