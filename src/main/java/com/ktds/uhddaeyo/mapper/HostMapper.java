package com.ktds.uhddaeyo.mapper;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;

public interface HostMapper {
	public List<GuestReqDto> getGuestList(int placeNo);
}
