package com.ktds.uhddaeyo.service;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.ReplyDto;
import com.ktds.uhddaeyo.model.dto.ReviewDto;

public interface ReviewAndReplyService {
	public List<ReviewDto> selectReviewList(int place_no);
	public int insertReply(ReplyDto rdto);
	public int updateReply(ReplyDto rdto);
}
