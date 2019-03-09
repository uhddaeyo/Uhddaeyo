package com.ktds.uhddaeyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.dao.GuestDao;
import com.ktds.uhddaeyo.model.dto.GuestReqDto;

@Service
public class GuestServiceImpl implements GuestService {

	@Autowired
	GuestDao guestDao;

	@Override
	public List<Integer> getMatchedPlace(int capacity, String place, List<String> tag) {
		return guestDao.getMatchedPlace(capacity, place, tag);
	}

	@Override
	public int insertGuestReq(GuestReqDto reqDto) {
		return guestDao.insertGuestReq(reqDto);

	}

	@Override
	public void insertMatchedReq(List<GuestReqDto> matchedReq) {
		guestDao.insertMatchedReq(matchedReq);
		
	}
	
	

}
