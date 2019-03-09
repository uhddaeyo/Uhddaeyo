package com.ktds.uhddaeyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.dao.HostDao;
import com.ktds.uhddaeyo.model.dto.GuestReqDto;

@Service
public class HostServiceImpl implements HostService{

	@Autowired
	HostDao hostDao;
	
	@Override
	public List<GuestReqDto> getGuestList(int placeNo) {
		// TODO Auto-generated method stub
		return hostDao.getGuestList(placeNo);
	}

}
