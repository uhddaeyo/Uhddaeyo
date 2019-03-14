package com.ktds.uhddaeyo.model.dto;

import java.sql.Timestamp;
import java.util.Date;

public class ReservationDto {

	private int sug_no;
	private String place_name;
	private String name;
	private int mem_cnt;
	private Timestamp resv_date;

	public int getSug_no() {
		return sug_no;
	}

	public void setSug_no(int sug_no) {
		this.sug_no = sug_no;
	}

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

	public int getMem_cnt() {
		return mem_cnt;
	}

	public void setMem_cnt(int mem_cnt) {
		this.mem_cnt = mem_cnt;
	}

	public Timestamp getResv_date() {
		return resv_date;
	}

	public void setResv_date(Timestamp resv_date) {
		this.resv_date = resv_date;
	}

	@Override
	public String toString() {
		return "ReservationDto [sug_no=" + sug_no + ", place_name=" + place_name + ", name=" + name + ", mem_cnt="
				+ mem_cnt + ", resv_date=" + resv_date + "]";
	}
}
