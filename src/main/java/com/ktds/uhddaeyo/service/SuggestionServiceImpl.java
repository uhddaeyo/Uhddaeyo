package com.ktds.uhddaeyo.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import com.ktds.uhddaeyo.mapper.SuggestionMapper;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;

public class SuggestionServiceImpl implements SuggestionService {

	@Inject
	SuggestionMapper mapper;

	@Override
	public SuggestionDto selectSuggest(SuggestionDto sug, HttpServletRequest request) {
		mapper.selectSuggest(sug, request);
		return null;
	}
}
