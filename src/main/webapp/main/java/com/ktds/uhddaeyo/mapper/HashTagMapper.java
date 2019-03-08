package com.ktds.uhddaeyo.mapper;

import java.util.List;

public interface HashTagMapper {
	public List<String> selectTagsByPlaceNo(int place_no);
}
