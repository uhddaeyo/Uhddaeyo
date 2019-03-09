package com.ktds.uhddaeyo.dao;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;

public interface HostDao {
	public List<GuestReqDto> getGuestList(int placeNo);
}
