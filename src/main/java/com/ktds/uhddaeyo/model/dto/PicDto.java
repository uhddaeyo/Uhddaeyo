package com.ktds.uhddaeyo.model.dto;

public class PicDto {
	private int placeNo;
	private String photoName;
	
	public PicDto(int placeNo, String photoName) {
		this.placeNo = placeNo;
		this.photoName = photoName;
	}
	public int getPlaceNo() {
		return placeNo;
	}
	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

}
