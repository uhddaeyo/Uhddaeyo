package com.ktds.uhddaeyo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.dao.ReviewDao;
import com.ktds.uhddaeyo.model.dto.ReplyDto;
import com.ktds.uhddaeyo.model.dto.ReviewDto;

@Service
public class ReviewAndReplyServiceImpl implements ReviewAndReplyService {

	@Autowired
	ReviewDao reviewDao;

	@Override
	public List<ReviewDto> selectReviewList(int place_no) {
		return reviewDao.selectReviewList(place_no);
	}
	@Override
	public int updateReply(ReplyDto rdto) {
		return reviewDao.updateReply(rdto);
	}
	@Override
	public int insertReply(ReplyDto rdto) {
		return reviewDao.insertReply(rdto);
	}
}

