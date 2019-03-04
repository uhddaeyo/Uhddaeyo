package com.ktds.uhddaeyo.mapper;

import javax.servlet.http.HttpServletRequest;

import com.ktds.uhddaeyo.model.dto.SuggestionDto;

public interface SuggestionMapper {
	public SuggestionDto selectSuggest(SuggestionDto sug, HttpServletRequest request);
}
