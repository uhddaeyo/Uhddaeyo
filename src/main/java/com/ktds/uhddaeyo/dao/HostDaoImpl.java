package com.ktds.uhddaeyo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.uhddaeyo.mapper.HostMapper;

import com.ktds.uhddaeyo.mapper.SuggestionMapper;
import com.ktds.uhddaeyo.model.dto.GuestReqDto;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;
import com.ktds.uhddaeyo.model.dto.PlaceDto;

@Repository
public class HostDaoImpl implements HostDao{

	@Autowired
	HostMapper hostMapper;
	
	@Autowired
	SuggestionMapper suggestionMapper;
	
	@Override
	public List<GuestReqDto> getGuestList(int placeNo) {
		return hostMapper.getGuestList(placeNo);
	}

	@Override
	public List<GuestReqDto> getResvList(int placeNo) {
		return hostMapper.getResvList(placeNo);
	}

	@Override
	public String selectPlaceName(int placeNo) {
		return hostMapper.selectPlaceName(placeNo);
	}

	@Override
	public List<String> selectTagsByPlaceNo(int place_no) {
		return suggestionMapper.selectTagsByPlaceNo(place_no);
	}

	@Override
	public void insertSuggestion(SuggestionDto suggest) {
		hostMapper.insertSuggestion(suggest);
		
	}
	
	@Override
	public PlaceDto selectPlaceInfo(int userNo) {
		return hostMapper.selectPlaceInfo(userNo);
	}

	@Override
	public List<String> selectPlaceTag(int placeNo) {
		return hostMapper.selectPlaceTag(placeNo);
	}

}
