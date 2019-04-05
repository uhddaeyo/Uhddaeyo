package com.ktds.uhddaeyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.dao.SuggestionDao;
import com.ktds.uhddaeyo.mapper.SuggestionMapper;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;

@Service
public class SuggestionServiceImpl implements SuggestionService {

	@Autowired
	SuggestionDao suggestionDao;

	@Override
	public SuggestionDto selectSuggestion(SuggestionDto sdto) {
		return suggestionDao.selectSuggestion(sdto);
	}

	@Override
	public boolean acceptSuggestion(SuggestionDto sdto) {
		return suggestionDao.acceptSuggestion(sdto);
	}

	@Override
	public List<String> selectTagsByPlaceNo(int place_no) {
		return suggestionDao.selectTagsByPlaceNo(place_no);
	}

	@Override
	public List<String> selectPicturesByPlaceNo(int place_no) {
		return suggestionDao.selectPicturesByPlaceNo(place_no);
	}

	@Override
	public List<SuggestionDto> selectSuggestionList(int user_no) {
		return suggestionDao.selectSuggestionList(user_no);
	}
}