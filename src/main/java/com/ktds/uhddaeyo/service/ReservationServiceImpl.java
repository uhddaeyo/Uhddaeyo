package com.ktds.uhddaeyo.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.mapper.ReservationMapper;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Inject
	ReservationMapper mapper;
	
	@Override
	public List<Map<String, Object>> selectReservationList(int userNo) {
		return mapper.selectReservationList(userNo);
	}

	@Override
	public boolean cancelResv(int sug_no) {
		return mapper.cancelResv(sug_no);
	}
}
