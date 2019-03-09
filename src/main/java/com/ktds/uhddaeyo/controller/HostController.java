package com.ktds.uhddaeyo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;
import com.ktds.uhddaeyo.service.HostService;

@Controller
public class HostController {
	
	@Autowired
	HostService hostService;
	
	@RequestMapping("/guestList")
	public ModelAndView index(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		List<GuestReqDto> guestList = hostService.getGuestList((int) session.getAttribute("placeNo"));
		mv.setViewName("/guestList");
		mv.addObject("guestList", guestList);
		return mv;
	}
}
