package com.ktds.uhddaeyo.model.dto;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class HostDto implements Serializable{
	private int userNo;
	private String id;
	private String passwd;
	private String name;
	private String tel;
	private int age;
	private String gender;
	private int type;
	private PlaceDto place;
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public PlaceDto getPlace() {
		return place;
	}
	public void setPlace(PlaceDto place) {
		this.place = place;
	}
	
}
