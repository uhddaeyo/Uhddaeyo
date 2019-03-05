package com.ktds.uhddaeyo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.service.UserService;

@Controller
public class UserHistoryController {
	private static final Logger logger = LoggerFactory.getLogger(UserHistoryController.class);

	@Autowired
	UserService memberService;
	
	@RequestMapping("/historyList")
	public ModelAndView selectHistoryList(HttpSession session) {

		ModelAndView mv = new ModelAndView("/user/historyList");
		
		int userNo = (int)session.getAttribute("userNo");
		List<Map<String,Object>> historyList = memberService.selectHistory(userNo);
		mv.addObject("historyList", historyList);
		
		return mv;
	}

	@RequestMapping("/reviewDetail")
	public String reviewDetail(HttpServletRequest req, Model model) {
		
		int placeNo = Integer.parseInt(req.getParameter("place_no"));
		String placeName = memberService.reviewDetail(placeNo);
		model.addAttribute("placeName",placeName);
		
		return "/user/reviewDetail";
	}
}

