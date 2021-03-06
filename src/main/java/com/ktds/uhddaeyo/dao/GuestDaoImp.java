package com.ktds.uhddaeyo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.uhddaeyo.mapper.GuestMapper;
import com.ktds.uhddaeyo.model.dto.GuestReqDto;

@Repository
public class GuestDaoImp implements GuestDao {

	@Autowired
	GuestMapper guestMapper;

	@Override
	public List<Integer> getMatchedPlace(int capacity, String place, int price, List<String> tag) {
		return guestMapper.getMatchedPlace(capacity, place, price, tag);
	}

	@Override
	public int insertGuestReq(GuestReqDto reqDto) {
		return guestMapper.insertGuestReq(reqDto);

	}

	@Override
	public void insertMatchedReq(List<GuestReqDto> matchedReq) {
		guestMapper.insertMatchedReq(matchedReq);

	}

	@Override
	public List<GuestReqDto> getReqList(int userNo) {
		// TODO Auto-generated method stub
		return guestMapper.getReqList(userNo);
	}

}
