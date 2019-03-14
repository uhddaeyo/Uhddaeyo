package com.ktds.uhddaeyo.model.dto;

import java.sql.Timestamp;

public class GuestReqDto {

	private int sugNo;
	private int reqNo;
	private int userNo;
	private String userName;
	private String tagMsg;
	private int memCnt;
	private int price;
	private int placeNo;
	private Timestamp date;
	private String enUrl;
	private String memo;

	public GuestReqDto() {
	};

	public GuestReqDto(int reqNo, int placeNo) {
		this.reqNo = reqNo;
		this.placeNo = placeNo;
	}

	public GuestReqDto(int userNo, String tagMsg, Timestamp date, int memCnt, int price) {
		this.userNo = userNo;
		this.tagMsg = tagMsg;
		this.date = date;
		this.memCnt = memCnt;
		this.price = price;
	}

	public int getSugNo() {
		return sugNo;
	}

	public void setSugNo(int sugNo) {
		this.sugNo = sugNo;
	}

	public int getReqNo() {
		return reqNo;
	}

	public void setReqNo(int reqNo) {
		this.reqNo = reqNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTagMsg() {
		return tagMsg;
	}

	public void setTagMsg(String tagMsg) {
		this.tagMsg = tagMsg;
	}

	public int getMemCnt() {
		return memCnt;
	}

	public void setMemCnt(int memCnt) {
		this.memCnt = memCnt;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getEnUrl() {
		return enUrl;
	}

	public void setEnUrl(String enUrl) {
		this.enUrl = enUrl;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

}
