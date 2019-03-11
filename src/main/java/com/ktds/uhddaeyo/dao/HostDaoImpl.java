package com.ktds.uhddaeyo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.uhddaeyo.mapper.HostMapper;
import com.ktds.uhddaeyo.model.dto.PlaceDto;

@Repository
public class HostDaoImpl implements HostDao {

	@Autowired
	HostMapper hostMapper;

	@Override
	public PlaceDto selectPlaceInfo(int userNo) {
		return hostMapper.selectPlaceInfo(userNo);
	}

	@Override
	public List<String> selectPlaceTag(int placeNo) {
		return hostMapper.selectPlaceTag(placeNo);
	}
}
