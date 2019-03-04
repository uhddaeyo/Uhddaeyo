package com.ktds.uhddaeyo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ktds.uhddaeyo.model.dto.SuggestionDto;

@Controller
public class SuggestionController {
//	@RequestMapping(value = "/suggestion")
//	public String home(@RequestParam int width, @RequestParam int height,@ModelAttribute SuggestionDto sdto ,Model model) {
//		
//		double imgWidth = width;
//		double imgHeight = height*0.35;
//		
//		model.addAttribute("imgWidth", imgWidth);
//		model.addAttribute("imgHeight", imgHeight);
//		
//		System.out.println(sdto.getPlace_no());
//		
//		return "suggestion";
//	}
	
	@RequestMapping(value = "/suggestion", method=RequestMethod.POST)
	public String home(@RequestParam int width, @RequestParam int height, HttpServletRequest request, SuggestionDto sdto ,Model model) {
		
		System.out.println(sdto.getPlace_no() + " " + width + " " + height);
		
		return "suggestion";
	}

}
