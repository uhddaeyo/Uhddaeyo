package com.ktds.uhddaeyo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;

public interface GuestMapper {
	public List<Integer> getMatchedPlace(@Param("capacity") int capacity, @Param("place") String place, @Param("price") int price,
			@Param("tags") List<String> tags);

	public int insertGuestReq(GuestReqDto reqDto);

	public void insertMatchedReq(List<GuestReqDto> matchedReq);
}
