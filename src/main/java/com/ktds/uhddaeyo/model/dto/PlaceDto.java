package com.ktds.uhddaeyo.model.dto;

import java.math.BigDecimal;

public class PlaceDto {
	private int placeNo;
	private int userNo;
	private String placeName;
	private String placeTel;
	private int placePrice;
	private String address;
	private int capacity;
	private String startTime;
	private String endTime;
	private BigDecimal latitude;
	private BigDecimal longitude;

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getPlaceTel() {
		return placeTel;
	}

	public void setPlaceTel(String placeTel) {
		this.placeTel = placeTel;
	}

	public int getPlacePrice() {
		return placePrice;
	}

	public void setPlacePrice(int placePrice) {
		this.placePrice = placePrice;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public BigDecimal getLatitude() {
		return latitude;
	}

	public void setLatitude(BigDecimal latitude) {
		this.latitude = latitude;
	}

	public BigDecimal getLongitude() {
		return longitude;
	}

	public void setLongitude(BigDecimal longitude) {
		this.longitude = longitude;
	}

	@Override
	public String toString() {
		return "PlaceDto [placeNo=" + placeNo + ", userNo=" + userNo + ", placeName=" + placeName + ", placeTel="
				+ placeTel + ", placePrice=" + placePrice + ", address=" + address + ", capacity=" + capacity
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", latitude=" + latitude + ", longitude="
				+ longitude + "]";
	}
}
