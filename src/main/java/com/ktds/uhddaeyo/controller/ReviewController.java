package com.ktds.uhddaeyo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ktds.uhddaeyo.model.dto.ReviewDto;
import com.ktds.uhddaeyo.service.ReviewAndReplyService;

@Controller
public class ReviewController {

	@Autowired
	ReviewAndReplyService service;

	@RequestMapping(value = "/review")
	public String getReviews (Model model, HttpSession session) {
		int place_no = (int) session.getAttribute("placeNo");
		List<ReviewDto> reviews = service.selectReviewList(place_no);
		System.out.println(reviews.toString());
		model.addAttribute("reviews", reviews);
		return "review";
	}
}

