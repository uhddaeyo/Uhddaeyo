package com.ktds.uhddaeyo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.uhddaeyo.mapper.HostMapper;
import com.ktds.uhddaeyo.model.dto.GuestReqDto;

@Repository
public class HostDaoImpl implements HostDao{

	@Autowired
	HostMapper hostMapper;
	
	@Override
	public List<GuestReqDto> getGuestList(int placeNo) {
		return hostMapper.getGuestList(placeNo);
	}

}
