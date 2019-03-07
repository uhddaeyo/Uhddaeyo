package com.ktds.uhddaeyo.mapper;

import com.ktds.uhddaeyo.model.dto.SuggestionDto;

public interface SuggestionMapper {
	public SuggestionDto selectSuggestion(SuggestionDto sdto);
	public boolean acceptSuggestion(SuggestionDto sdto);
}