package com.ktds.uhddaeyo.service;

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
}
