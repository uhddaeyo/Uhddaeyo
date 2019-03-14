package com.ktds.uhddaeyo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@RequestMapping(value = "/suggestionResv", method = RequestMethod.POST)
	public ModelAndView PopupSuggestion(@RequestParam int width, @RequestParam int height, HttpServletRequest request,
			SuggestionDto sdto) {
		ModelAndView mv = new ModelAndView();
		sdto.setUser_no((int)request.getSession().getAttribute("userNo"));
		SuggestionDto resultDto = sugService.selectSuggestion(sdto);

		List<String> pictures = sugService.selectPicturesByPlaceNo(sdto.getPlace_no());
		mv.addObject("pictures", pictures);

		List<String> tags = new ArrayList<String>();
		if (resultDto == null)
			System.out.println("NULL");
		else {
			resultDto.setMessage(resultDto.getMessage().replace("\n", "<br>"));
			tags = sugService.selectTagsByPlaceNo(resultDto.getPlace_no());
			mv.addObject("tags", tags);
		}

		double imgWidth = width * 0.90;
		double imgHeight = height * 0.35;

		mv.addObject("imgWidth", imgWidth);
		mv.addObject("imgHeight", imgHeight);
		mv.addObject("SugDto", resultDto); 
		mv.setViewName("sugFromResv");
		return mv;
	}
}
