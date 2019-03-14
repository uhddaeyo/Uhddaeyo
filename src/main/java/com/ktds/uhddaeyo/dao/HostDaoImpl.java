package com.ktds.uhddaeyo.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.uhddaeyo.mapper.HostMapper;
import com.ktds.uhddaeyo.mapper.SuggestionMapper;
import com.ktds.uhddaeyo.model.dto.GuestReqDto;
import com.ktds.uhddaeyo.model.dto.PlaceDto;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;

@Repository
public class HostDaoImpl implements HostDao {

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

	@Override
	public List<Map<String, Object>> getGenderStat(int placeNo) {
		return hostMapper.getGenderStat(placeNo);
	}

	@Override
	public Map<String, Object> getAgeStat(int placeNo) {

		List<Map<String, Object>> getAgeStat = hostMapper.getAgeStat(placeNo);
		ArrayList<String> ageList = new ArrayList<String>();
		ArrayList<Long> cntList = new ArrayList<Long>();
		Map<String, Object> result = new HashMap<String, Object>();

		for (Map<String, Object> map : getAgeStat) {
			ageList.add(map.get("newAge").toString());
			cntList.add((Long) map.get("cnt"));
		}
		result.put("age", ageList);
		result.put("cnt", cntList);

		return result;
	}

	@Override
	public ArrayList<Long> getStar(int placeNo, String gender1, String gender2) {
		Map<String, Object> info = new HashMap<String, Object>(); 
		info.put("placeNo", placeNo);
		info.put("gender1", gender1);
		info.put("gender2", gender2);

		List<Map<String, Object>> getStar = hostMapper.getStar(info);
		ArrayList<Long> cntList = new ArrayList<Long>();
		
		int tmp = 1;
		for (Map<String, Object> map : getStar) {
			int star = ((Integer)(map.get("star"))).intValue();
					
			for(int i=tmp;i<=5;i++) {
				if(star == i) {
					cntList.add((Long) map.get("cnt"));
					tmp = i+1;
					break;
				}
				else {
					cntList.add(new Long(0));
				}
			}
		}
		return cntList;
	}
	
	@Override
	public boolean saveMemo(GuestReqDto grdto) {
		return hostMapper.saveMemo(grdto);
	}
}
