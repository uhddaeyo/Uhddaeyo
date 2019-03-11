package com.ktds.uhddaeyo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.dao.HostDao;
import com.ktds.uhddaeyo.dao.UserDao;
import com.ktds.uhddaeyo.model.dto.GuestDto;
import com.ktds.uhddaeyo.model.dto.HashTagDto;
import com.ktds.uhddaeyo.model.dto.HostDto;
import com.ktds.uhddaeyo.model.dto.PicDto;
import com.ktds.uhddaeyo.model.dto.PlaceDto;
import com.ktds.uhddaeyo.model.dto.PlaceTagDto;
import com.ktds.uhddaeyo.model.dto.ReviewDto;
import com.ktds.uhddaeyo.model.dto.UserDto;

@Service
public class HostServiceImpl implements HostService {

	@Autowired
	HostDao hostDao;
	
	@Override
	public PlaceDto selectPlaceInfo(int userNo) {
		return hostDao.selectPlaceInfo(userNo);
	}

	@Override
	public List<String> selectPlaceTag(int placeNo) {
		return hostDao.selectPlaceTag(placeNo);
	}


}
