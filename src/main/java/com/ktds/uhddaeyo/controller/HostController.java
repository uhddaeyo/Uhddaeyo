package com.ktds.uhddaeyo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.model.dto.PlaceDto;
import com.ktds.uhddaeyo.service.HostService;

@Controller
public class HostController {
	
	@Autowired
	HostService hostService;
	
	@RequestMapping("/host")
	public ModelAndView selectPlaceInfo(HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/host");
		int userNo = (int) session.getAttribute("userNo");
		PlaceDto placeInfo = hostService.selectPlaceInfo(userNo);
		List<String> placeTag = hostService.selectPlaceTag(placeInfo.getPlaceNo());
		mv.addObject("placeInfo", placeInfo);
		mv.addObject("placeTag", placeTag);
		return mv;
	}

}
