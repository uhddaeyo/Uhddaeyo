package com.ktds.uhddaeyo.service;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;

public interface HostService {
	public List<GuestReqDto> getGuestList(int placeNo);
	public List<GuestReqDto> getResvList(int placeNo);
	public String selectPlaceName(int placeNo);
	public List<String> selectTagsByPlaceNo(int place_no);
	public void insertSuggestion(SuggestionDto suggest);
}
