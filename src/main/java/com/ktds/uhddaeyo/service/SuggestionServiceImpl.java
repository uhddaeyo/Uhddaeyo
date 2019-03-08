package com.ktds.uhddaeyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.mapper.SuggestionMapper;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;

@Service
public class SuggestionServiceImpl implements SuggestionService {

	@Autowired
	SuggestionMapper mapper;

	@Override
	public SuggestionDto selectSuggestion(SuggestionDto sdto) {
		return mapper.selectSuggestion(sdto);
	}

	@Override
	public boolean acceptSuggestion(SuggestionDto sdto) {
		return mapper.acceptSuggestion(sdto);
	}

	@Override
	public List<String> selectTagsByPlaceNo(int place_no) {
		return mapper.selectTagsByPlaceNo(place_no);
	}

	@Override
	public List<String> selectPicturesByPlaceNo(int place_no) {
		return mapper.selectPicturesByPlaceNo(place_no);
	}

	@Override
	public List<SuggestionDto> selectSuggestionList(int user_no) {
		return mapper.selectSuggestionList(user_no);
	}
}