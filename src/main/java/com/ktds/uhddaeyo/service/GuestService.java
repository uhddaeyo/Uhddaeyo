package com.ktds.uhddaeyo.service;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;

public interface GuestService {
	public List<Integer> getMatchedPlace(int capacity, String place, int price, List<String> tag);
	public int insertGuestReq(GuestReqDto reqDto);
	public void insertMatchedReq(List<GuestReqDto> matchedReq);
	public List<GuestReqDto> getReqList(int userNo);
}
