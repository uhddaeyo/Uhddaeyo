package com.ktds.uhddaeyo.mapper;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;

public interface HostMapper {
	public List<GuestReqDto> getGuestList(int placeNo);
	public List<GuestReqDto> getResvList(int placeNo);
	public String selectPlaceName(int placeNo);
	public void insertSuggestion(SuggestionDto suggest);
}
