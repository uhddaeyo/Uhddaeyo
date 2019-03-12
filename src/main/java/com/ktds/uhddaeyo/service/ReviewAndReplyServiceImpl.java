package com.ktds.uhddaeyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.mapper.ReviewAndReplyMapper;
import com.ktds.uhddaeyo.model.dto.ReplyDto;
import com.ktds.uhddaeyo.model.dto.ReviewDto;

@Service
public class ReviewAndReplyServiceImpl implements ReviewAndReplyService {

	@Autowired
	ReviewAndReplyMapper mapper;

	@Override
	public List<ReviewDto> selectReviewList(int place_no) {
		return mapper.selectReviewList(place_no);
	}
	@Override
	public boolean updateReply(ReplyDto rdto) {
		return mapper.updateReply(rdto);
	}
}
