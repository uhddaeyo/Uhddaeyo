package com.ktds.uhddaeyo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;
import com.ktds.uhddaeyo.model.dto.PlaceDto;

public interface HostDao {
	public List<GuestReqDto> getGuestList(int placeNo);
	public List<GuestReqDto> getResvList(int placeNo);
	public String selectPlaceName(int placeNo);
	public List<String> selectTagsByPlaceNo(int place_no);
	public void insertSuggestion(SuggestionDto suggest);
	PlaceDto selectPlaceInfo(int userNo);
	List<String> selectPlaceTag(int placeNo);
	public List<Map<String, Object>> getGenderStat(int placeNo);
	public Map<String, Object> getAgeStat(int placeNo);
	public ArrayList<Long> getStar(int placeNo, String gender1, String gender2);
	public boolean saveMemo(GuestReqDto grdto);
}
