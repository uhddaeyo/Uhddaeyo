package com.ktds.uhddaeyo.service;

import javax.servlet.http.HttpServletRequest;

import com.ktds.uhddaeyo.model.dto.SuggestionDto;

public interface SuggestionService {
	public SuggestionDto selectSuggest(SuggestionDto sug, HttpServletRequest request);
}
