package com.ktds.uhddaeyo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.model.dto.ReviewDto;
import com.ktds.uhddaeyo.service.UserService;

@Controller
public class UserHistoryController {
	private static final Logger logger = LoggerFactory.getLogger(UserHistoryController.class);

	@Autowired
	UserService memberService;

	@RequestMapping("/historyList")
	public ModelAndView selectHistoryList(HttpSession session) {

		ModelAndView mv = new ModelAndView("/historyList");
		int userNo = (int)session.getAttribute("userNo");
		List<Map<String,Object>> historyList = memberService.selectHistory(userNo);
		mv.addObject("historyList", historyList);

		return mv;
	}
	
	@RequestMapping("/reviewDetail")
	public String reviewDetail(int place_no, Model model) {

		String placeName = memberService.reviewDetail(place_no);
		
		model.addAttribute("placeName",placeName);
		model.addAttribute("placeNo",place_no);

		System.out.println("[result]" + placeName);
		return "/reviewDetail";
	}
	
	@RequestMapping("/insertReview")
	public String insertReview(HttpSession session, ReviewDto review) {

		int userNo = (int)session.getAttribute("userNo");
		review.setUser_no(userNo);
		memberService.insertReview(review);

		return "historyList";
	}
}