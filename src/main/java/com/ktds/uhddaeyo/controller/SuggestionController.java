package com.ktds.uhddaeyo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.model.dto.SuggestionDto;
import com.ktds.uhddaeyo.service.SuggestionService;

@Controller
public class SuggestionController {

	@Inject
	SuggestionService service;

	@RequestMapping(value = "/suggestion", method = RequestMethod.POST)
	public String PopupSuggestion(@RequestParam int width, @RequestParam int height, HttpServletRequest request,
			SuggestionDto sdto, Model model) {
		sdto.setUser_no((int)request.getSession().getAttribute("userNo"));
		SuggestionDto resultDto = service.selectSuggestion(sdto);

		List<String> pictures = service.selectPicturesByPlaceNo(sdto.getPlace_no());
		model.addAttribute("pictures", pictures);

		List<String> tags = new ArrayList<String>();
		if (resultDto == null)
			System.out.println("NULL");
		else {
			resultDto.setMessage(resultDto.getMessage().replace("\n", "<br>"));
			tags = service.selectTagsByPlaceNo(resultDto.getPlace_no());
			model.addAttribute("tags", tags);
		}

		double imgWidth = width * 0.90;
		double imgHeight = height * 0.35;

		model.addAttribute("imgWidth", imgWidth);
		model.addAttribute("imgHeight", imgHeight);
		model.addAttribute("SugDto", resultDto); 

		return "suggestion";
	}

	@RequestMapping(value = "/acceptSuggestion", method = RequestMethod.POST)
	public String acceptSuggestion(SuggestionDto sdto, Model model) {
		boolean success = service.acceptSuggestion(sdto);
		model.addAttribute("success", success);
		return "suggestion";
	}

	@RequestMapping("/{userNo}")
	public ModelAndView selectHistoryList(@PathVariable int userNo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/suggestionBoard");
		List<SuggestionDto> suggestionList = service.selectSuggestionList(userNo);
		session.setAttribute("userNo", userNo);
		mv.addObject("suggestionList", suggestionList);
		return mv;
	}
}
