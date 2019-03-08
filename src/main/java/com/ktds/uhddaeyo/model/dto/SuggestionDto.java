package com.ktds.uhddaeyo.model.dto;

import java.sql.Time;
import java.sql.Timestamp;

public class SuggestionDto {
	private int sug_no;
	private int place_no;
	private int user_no;
	private Timestamp sug_date; 
	private Timestamp resv_date;
	private String isresv;
	private String place_name;
	private String place_tel; 
	private int capacity; 
	private Time start_time; 
	private Time end_time; 
	private String address; 
	private String message; 

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public Time getStart_time() {
		return start_time;
	}

	public void setStart_time(Time start_time) {
		this.start_time = start_time;
	}

	public Time getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Time end_time) {
		this.end_time = end_time;
	}

	public String getPlace_tel() {
		return place_tel;
	}

	public void setPlace_tel(String place_tel) {
		this.place_tel = place_tel;
	}

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

	public Timestamp getSug_date() {
		return sug_date;
	}

	public void setSug_date(Timestamp sug_date) {
		this.sug_date = sug_date;
	}

	public Timestamp getResv_date() {
		return resv_date;
	}

	public void setResv_date(Timestamp resv_date) {
		this.resv_date = resv_date;
	}

	public String getIsresv() {
		return isresv;
	}

	public void setIsresv(String isresv) {
		this.isresv = isresv;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "SuggestionDto [sug_no=" + sug_no + ", place_no=" + place_no + ", user_no=" + user_no + ", sug_date="
				+ sug_date + ", resv_date=" + resv_date + ", isresv=" + isresv + ", place_name=" + place_name
				+ ", place_tel=" + place_tel + ", capacity=" + capacity + ", start_time=" + start_time + ", end_time="
				+ end_time + ", address=" + address + ", message=" + message + "]";
	}
	
}
