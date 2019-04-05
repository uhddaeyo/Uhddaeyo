package com.ktds.uhddaeyo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.uhddaeyo.mapper.ReviewAndReplyMapper;
import com.ktds.uhddaeyo.model.dto.ReplyDto;
import com.ktds.uhddaeyo.model.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	ReviewAndReplyMapper reviewAndReplyMapper;
	
	@Override
	public List<ReviewDto> selectReviewList(int place_no) {
		return reviewAndReplyMapper.selectReviewList(place_no);
	}

	@Override
	public int insertReply(ReplyDto rdto) {
		return reviewAndReplyMapper.insertReply(rdto);
	}

	@Override
	public int updateReply(ReplyDto rdto) {
		return reviewAndReplyMapper.updateReply(rdto);
	}

	@Override
	public List<ReviewDto> selectReviewLists(int userNo) {
		return reviewAndReplyMapper.selectReviewLists(userNo);
	}
	
	

}
