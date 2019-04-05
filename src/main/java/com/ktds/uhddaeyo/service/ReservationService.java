package com.ktds.uhddaeyo.service;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	public List<Map<String, Object>> selectReservationList(int userNo);
	public boolean cancelResv(int sug_no);
}
