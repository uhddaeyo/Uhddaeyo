package com.ktds.uhddaeyo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.uhddaeyo.mapper.SuggestionMapper;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;

@Repository
public class SuggestionDaoImpl implements SuggestionDao {

	@Autowired
	SuggestionMapper suggestionMapper;
	
	@Override
	public SuggestionDto selectSuggestion(SuggestionDto sdto) {
		return suggestionMapper.selectSuggestion(sdto);
	}

	@Override
	public boolean acceptSuggestion(SuggestionDto sdto) {
		return suggestionMapper.acceptSuggestion(sdto);
	}

	@Override
	public List<String> selectTagsByPlaceNo(int place_no) {
		return suggestionMapper.selectTagsByPlaceNo(place_no);
	}

	@Override
	public List<String> selectPicturesByPlaceNo(int place_no) {
		return suggestionMapper.selectPicturesByPlaceNo(place_no);
	}

	@Override
	public List<SuggestionDto> selectSuggestionList(int user_no) {
		return suggestionMapper.selectSuggestionList(user_no);
	}

}
