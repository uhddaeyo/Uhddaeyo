package com.ktds.uhddaeyo.model.dto;

import java.util.Date;

public class InvateListDto {
	
	private String name;
	private Date resv_date;
	private String message;
	private int mem_cnt;
	private String isresv;
	
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getMem_cnt() {
		return mem_cnt;
	}
	public void setMem_cnt(int mem_cnt) {
		this.mem_cnt = mem_cnt;
	}
	public String getIsresv() {
		return isresv;
	}
	public void setIsresv(String isresv) {
		this.isresv = isresv;
	}

}
