package com.ktds.uhddaeyo.dao;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.SuggestionDto;

public interface SuggestionDao {
	public SuggestionDto selectSuggestion(SuggestionDto sdto);

	public boolean acceptSuggestion(SuggestionDto sdto);

	public List<String> selectTagsByPlaceNo(int place_no);

	public List<String> selectPicturesByPlaceNo(int place_no);

	public List<SuggestionDto> selectSuggestionList(int user_no);
}
