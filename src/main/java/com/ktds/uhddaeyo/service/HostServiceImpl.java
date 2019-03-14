package com.ktds.uhddaeyo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.dao.HostDao;
import com.ktds.uhddaeyo.model.dto.GuestReqDto;
import com.ktds.uhddaeyo.model.dto.PlaceDto;
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

	@Override
	public PlaceDto selectPlaceInfo(int userNo) {
		return hostDao.selectPlaceInfo(userNo);
	}

	@Override
	public List<String> selectPlaceTag(int placeNo) {
		return hostDao.selectPlaceTag(placeNo);
	}

	@Override
	public List<Map<String, Object>> getGenderStat(int placeNo) {
		return hostDao.getGenderStat(placeNo);
	}

	@Override
	public Map<String, Object> getAgeStat(int placeNo) {
		return hostDao.getAgeStat(placeNo);
	}

	@Override
	public ArrayList<Long> getStar(int placeNo, String gender1, String gender2) {
		return hostDao.getStar(placeNo,gender1, gender2);
	}

}
