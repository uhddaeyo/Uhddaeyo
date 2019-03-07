package com.ktds.uhddaeyo.model.dto;

import java.util.Date;

public class ReservationDto {
	
	private int sug_no;
	private int place_no;
	private int user_no;
	private Date sug_date;
	private Date resv_date;
	private char isresv;
	private String message;
	
	
	public int getSug_no() {
		return sug_no;
	}
	public void setSug_no(int sug_no) {
		this.sug_no = sug_no;
	}
	public int getPlace_no() {
		return place_no;
	}
	public void setPlace_no(int place_no) {
		this.place_no = place_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Date getSug_date() {
		return sug_date;
	}
	public void setSug_date(Date sug_date) {
		this.sug_date = sug_date;
	}
	public Date getResv_date() {
		return resv_date;
	}
	public void setResv_date(Date resv_date) {
		this.resv_date = resv_date;
	}
	public char getIsresv() {
		return isresv;
	}
	public void setIsresv(char isresv) {
		this.isresv = isresv;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
