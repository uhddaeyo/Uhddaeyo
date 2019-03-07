package com.ktds.uhddaeyo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ktds.uhddaeyo.model.dto.SuggestionDto;
import com.ktds.uhddaeyo.service.SuggestionService;

@Controller
public class SuggestionController {
	
	@Inject
	SuggestionService service;
		
	@RequestMapping(value = "/suggestion", method=RequestMethod.POST)
	public String PopupSuggestion(@RequestParam int width, @RequestParam int height, HttpServletRequest request, SuggestionDto sdto ,Model model) {
		
//		sdto.setUser_no((int)request.getSession().getAttribute("user_no"));
		sdto.setUser_no(3); // 로그인 시 user_no 를 가져오게 수정한 후 위 두 줄의 주석 상태를 바꿈
		
		SuggestionDto resultDto = service.selectSuggestion(sdto);
		
		List<String> pictures = service.selectPicturesByPlaceNo(sdto.getPlace_no());
		model.addAttribute("pictures", pictures);
		System.out.println(pictures);
		
		List<String> tags = new ArrayList<String>();
		if (resultDto == null)
			System.out.println("NULL");
		else  {
			resultDto.setMessage(resultDto.getMessage().replace("\n", "<br>"));
			System.out.println(resultDto.toString());
			tags = service.selectTagsByPlaceNo(resultDto.getPlace_no());
			model.addAttribute("tags", tags);
		}
		
		
		double imgWidth = width * 0.90;
		double imgHeight = height*0.35;
		
		model.addAttribute("imgWidth", imgWidth);
		model.addAttribute("imgHeight", imgHeight);
		model.addAttribute("SugDto", resultDto);
		
		
		return "suggestion";
	}
	
	@RequestMapping(value="/acceptSuggestion", method=RequestMethod.POST)
	public String acceptSuggestion (SuggestionDto sdto, Model model) {
		System.out.println(sdto.getUser_no() + " " + sdto.getPlace_no());
		
		boolean success = service.acceptSuggestion(sdto);
		
		model.addAttribute("success", success);
		return "suggestion";
	}
}
