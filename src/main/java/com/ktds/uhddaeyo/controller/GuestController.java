package com.ktds.uhddaeyo.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;
import com.ktds.uhddaeyo.model.dto.HashTagDto;
import com.ktds.uhddaeyo.service.GuestService;
import com.ktds.uhddaeyo.service.UserService;

@Controller
public class GuestController {

	@Autowired
	UserService userService;

	@Autowired
	GuestService guestService;

	@RequestMapping("/test")
	public void test(@RequestParam("place") String place, @RequestParam("date") String date, @RequestParam("price") int price,
			@RequestParam("member") int memCnt, @RequestParam("tag") List<String> tags, HttpSession session) {
		System.out.println(date);
		date = date.replace("T", " ") + ":00";
		System.out.println(date);
		System.out.println(Timestamp.valueOf(date));
		
		List<Integer> list = guestService.getMatchedPlace(memCnt, place, price, tags);
		List<GuestReqDto> matchedList = new ArrayList<>();

		String tagMsg = "";
		for (String s : tags) {
			tagMsg += (s + "|");
		}
		GuestReqDto req = new GuestReqDto((int) session.getAttribute("userNo"), tagMsg, Timestamp.valueOf(date), memCnt, price);
		guestService.insertGuestReq(req);
		for (int p : list) {
			matchedList.add(new GuestReqDto(req.getReqNo(), p));
		}
		guestService.insertMatchedReq(matchedList);

	}

	@RequestMapping(value = "/hashTagList", method=RequestMethod.POST)
	@ResponseBody
	public List<HashTagDto> getHashTagList() {
		List<HashTagDto> hashTagList = userService.selectHashTags();
		return hashTagList;
	}
	
	

}
