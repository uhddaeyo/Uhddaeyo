package com.ktds.uhddaeyo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		
		for (int i=0; i<reviews.size(); i++) {
			String userId = reviews.get(i).getId();
			System.out.println(userId);
			int len = userId.length();
			String substr = userId.substring((len/2) - 1, (len/2) + 2);
			reviews.get(i).setId(reviews.get(i).getId().replaceFirst(substr, "***"));
		}
		
		model.addAttribute("reviews", reviews);
		return "review";
	}
	
	@RequestMapping("/reviewList")
	public ModelAndView selectHistoryList(HttpSession session) {
		ModelAndView mv = new ModelAndView("/reviewList");
		int userNo = (int) session.getAttribute("userNo");
		List<ReviewDto> reviewList = service.selectReviewLists(userNo);		
		mv.addObject("reviewList", reviewList);
		return mv;
	}

}

