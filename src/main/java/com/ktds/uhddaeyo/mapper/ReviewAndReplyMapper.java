package com.ktds.uhddaeyo.mapper;

import java.util.List;

import com.ktds.uhddaeyo.model.dto.ReplyDto;
import com.ktds.uhddaeyo.model.dto.ReviewDto;

public interface ReviewAndReplyMapper {
	public List<ReviewDto> selectReviewList(int place_no);
	public boolean updateReply(ReplyDto rdto);
}
