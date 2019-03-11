package com.ktds.uhddaeyo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.mapper.HashTagMapper;

@Service
public class HashTagServiceImpl implements HashTagService{
	@Inject
	private HashTagMapper mapper;
	
	@Override
	public List<String> selectTagsByPlaceNo(int place_no) {
		return mapper.selectTagsByPlaceNo(place_no);
	}
}
