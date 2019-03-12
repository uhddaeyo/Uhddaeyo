package com.ktds.uhddaeyo.model.dto;

import java.util.Date;

public class ReservationDto {
	
	private String place_name;
	private String name;
	private int mem_cnt;
	private Date resv_date;
	
	
	/*
	 * public int getMem_cnt() { return mem_cnt; } public void setMem_cnt(int
	 * mem_cnt) { this.mem_cnt = mem_cnt; }
	 */
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getResv_date() {
		return resv_date;
	}
	public void setResv_date(Date resv_date) {
		this.resv_date = resv_date;
	}

	
	
	

}
