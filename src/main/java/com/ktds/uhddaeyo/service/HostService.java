package com.ktds.uhddaeyo.service;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.PlaceDto;

public interface HostService {

	PlaceDto selectPlaceInfo(int userNo);

	List<String> selectPlaceTag(int placeNo);
}
