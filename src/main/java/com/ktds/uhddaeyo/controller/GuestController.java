package com.ktds.uhddaeyo.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;
import com.ktds.uhddaeyo.model.dto.HashTagDto;
import com.ktds.uhddaeyo.model.dto.ReviewDto;
import com.ktds.uhddaeyo.service.GuestService;
import com.ktds.uhddaeyo.service.UserService;

@Controller
public class GuestController {

	@Autowired
	UserService userService;

	@Autowired
	GuestService guestService;

	@RequestMapping("/customerReq")
	public String sendCustomerReq(@RequestParam("place") String place, @RequestParam("date") String date,
			@RequestParam("price") int price, @RequestParam("member") int memCnt,
			@RequestParam("tag") List<String> tags, HttpSession session) {

		date = date.replace("T", " ") + ":00";

		List<Integer> list = guestService.getMatchedPlace(memCnt, place, price, tags);
		List<GuestReqDto> matchedList = new ArrayList<>();

		String tagMsg = "";
		for (String s : tags) {
			tagMsg += (s + "|");
		}
		GuestReqDto req = new GuestReqDto((int) session.getAttribute("userNo"), tagMsg, Timestamp.valueOf(date), memCnt,
				price);
		guestService.insertGuestReq(req);
		for (int p : list) {
			matchedList.add(new GuestReqDto(req.getReqNo(), p));
		}
		guestService.insertMatchedReq(matchedList);

		return "/home";

	}

	@RequestMapping(value = "/hashTagList", method = RequestMethod.POST)
	@ResponseBody
	public List<HashTagDto> getHashTagList() {
		List<HashTagDto> hashTagList = userService.selectHashTags();
		return hashTagList;
	}
	
	@RequestMapping("/historyList")
	public ModelAndView selectHistoryList(HttpSession session) {
		ModelAndView mv = new ModelAndView("/historyList");
		int userNo = (int) session.getAttribute("userNo");
		List<Map<String, Object>> historyList = userService.selectHistory(userNo);
		mv.addObject("historyList", historyList);
		return mv;
	}

	@RequestMapping("/insertReview")
	public String insertReview(HttpSession session, @RequestParam("place_no") int place_no, 
			@RequestParam("msg") String msg,
			@RequestParam("star") int star) {
		int user_no = (int) session.getAttribute("userNo");
		ReviewDto review = new ReviewDto(user_no, place_no,star,msg);
		userService.insertReview(review);
		
		return "historyList";
	}

}
