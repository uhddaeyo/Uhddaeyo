package com.ktds.uhddaeyo.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ktds.uhddaeyo.model.dto.ReviewDto;
import com.ktds.uhddaeyo.service.ReviewAndReplyService;

@Controller
public class ReviewController {

	@Inject
	ReviewAndReplyService service;

	@RequestMapping(value = "/review")
	public String getReviews (Model model, HttpServletRequest request) {
		int place_no = 0;
		place_no = 1;
		
		List<ReviewDto> reviews = service.selectReviewList(place_no);
		System.out.println(reviews.toString());
		model.addAttribute("reviews", reviews);
		return "review";
	}
}
