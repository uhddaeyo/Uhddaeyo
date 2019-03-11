package com.ktds.uhddaeyo.mapper;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.PlaceDto;

public interface HostMapper {

	public PlaceDto selectPlaceInfo(int userNo);
	public List<String> selectPlaceTag(int placeNo);
}
