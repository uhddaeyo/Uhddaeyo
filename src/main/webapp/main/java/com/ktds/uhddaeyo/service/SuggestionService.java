package com.ktds.uhddaeyo.service;

import com.ktds.uhddaeyo.model.dto.SuggestionDto;

public interface SuggestionService {
	public SuggestionDto selectSuggestion(SuggestionDto sdto);
	public boolean acceptSuggestion(SuggestionDto sdto);
}
