package com.ktds.uhddaeyo.mapper;

import java.util.List;
import java.util.Map;

public interface ReservationMapper {
	public List<Map<String, Object>> selectReservationList(int userNo);
	public boolean cancelResv(int sug_no);
}