package com.ktds.uhddaeyo.service;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;

public interface HostService {
	public List<GuestReqDto> getGuestList(int placeNo);
}
