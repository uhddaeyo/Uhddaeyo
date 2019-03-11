package com.ktds.uhddaeyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.dao.HostDao;
import com.ktds.uhddaeyo.model.dto.GuestReqDto;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;

@Service
public class HostServiceImpl implements HostService {

	@Autowired
	HostDao hostDao;

	@Override
	public List<GuestReqDto> getGuestList(int placeNo) {
		return hostDao.getGuestList(placeNo);
	}

	@Override
	public List<GuestReqDto> getResvList(int placeNo) {
		return hostDao.getResvList(placeNo);
	}

	@Override
	public String selectPlaceName(int placeNo) {
		return hostDao.selectPlaceName(placeNo);
	}

	@Override
	public List<String> selectTagsByPlaceNo(int place_no) {
		return hostDao.selectTagsByPlaceNo(place_no);
	}

	@Override
	public void insertSuggestion(SuggestionDto suggest) {
		hostDao.insertSuggestion(suggest);

	}

}
