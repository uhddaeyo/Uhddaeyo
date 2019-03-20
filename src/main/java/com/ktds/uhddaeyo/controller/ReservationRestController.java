package com.ktds.uhddaeyo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.model.dto.SuggestionDto;
import com.ktds.uhddaeyo.service.ReservationService;
import com.ktds.uhddaeyo.service.SuggestionService;

@RestController
public class ReservationRestController {
	
	@Autowired
	ReservationService service;
	
	@Autowired
	SuggestionService sugService;
	
	@RequestMapping("/reservationList")
	public ModelAndView selectReservationList(HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/reservationList");
		
		int userNo = (int)session.getAttribute("userNo");
		List<Map<String,Object>> selectReservationList = service.selectReservationList(userNo);
		mv.addObject("selectReservationList", selectReservationList);
		
		return mv;
	}
	
	@RequestMapping(value= "/cancelResv", method = RequestMethod.POST)
	public boolean cancelResv(@RequestParam int sug_no) {
		return service.cancelResv(sug_no);
	}
	
}
