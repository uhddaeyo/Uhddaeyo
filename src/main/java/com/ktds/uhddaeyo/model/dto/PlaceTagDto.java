package com.ktds.uhddaeyo.model.dto;

public class PlaceTagDto {
	private int placeNo;
	private String content;

	public PlaceTagDto(int placeNo, String content) {
		super();
		this.placeNo = placeNo;
		this.content = content;
	}

	public int getPlaceNo() {
		return placeNo;
	}

	public void setPlaceNo(int placeNo) {
		this.placeNo = placeNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
