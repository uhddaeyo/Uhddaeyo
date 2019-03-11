package com.ktds.uhddaeyo.dao;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.PlaceDto;

public interface HostDao {

	PlaceDto selectPlaceInfo(int userNo);

	List<String> selectPlaceTag(int placeNo);

}
