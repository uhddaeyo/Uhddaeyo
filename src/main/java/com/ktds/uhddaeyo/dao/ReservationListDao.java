package com.ktds.uhddaeyo.dao;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.ReservationDto;

public interface ReservationListDao {
	
	public List<ReservationDto> selectReservationList() throws Exception;

}
