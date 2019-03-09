package com.ktds.uhddaeyo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public void test(@RequestParam("place") String place, @RequestParam("date") String date,
			@RequestParam("member") int memCnt, @RequestParam("tag") List<String> tags, HttpSession session) {
		date = date.replace('T', ' ');

		List<Integer> list = guestService.getMatchedPlace(memCnt, place, tags);
		List<GuestReqDto> matchedList = new ArrayList<>();

		// 일단 제안서 보내면 모두 디비에 담을건지,,? 논의 해봐야한,, 일단 다 넣는걸로
		// 시간 테이블은,,,왜만든거지?
		String tagMsg = "";
		for (String s : tags) {
			tagMsg += (s + "|");
		}
		GuestReqDto req = new GuestReqDto((int) session.getAttribute("userNo"), tagMsg, memCnt, tags.get(0));
		guestService.insertGuestReq(req);
		for (int p : list) {
			matchedList.add(new GuestReqDto(req.getReqNo(), p));
		}
		guestService.insertMatchedReq(matchedList);

	}

	@RequestMapping(value = "/hashTagList")
	@ResponseBody
	public List<HashTagDto> getHashTagList() {
		List<HashTagDto> hashTagList = userService.selectHashTags();
		return hashTagList;
	}

}
