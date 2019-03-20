package com.ktds.uhddaeyo.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Comparator;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.common.AES256Util;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;
import com.ktds.uhddaeyo.service.SuggestionService;

@Controller
public class SuggestionController {

	@Inject
	SuggestionService service;
	
	@RequestMapping(value = "/suggestionDetail", method = RequestMethod.POST)
	public String suggestionDetail(HttpServletRequest request, SuggestionDto sdto, Model model) {
		sdto.setUser_no((int) request.getSession().getAttribute("userNo"));
		sdto = service.selectSuggestion(sdto);
		System.out.println(sdto.getPlace_no());
		List<String> pictures = service.selectPicturesByPlaceNo(sdto.getPlace_no());
		System.out.println(pictures);
		model.addAttribute("pictures", pictures);

		List<String> tags = new ArrayList<String>();
		if (sdto.getPlace_name() == null)
			System.out.println("NULL");
		else {
			sdto.setMessage(sdto.getMessage().replace("\n", "<br>"));
			tags = service.selectTagsByPlaceNo(sdto.getPlace_no());
			model.addAttribute("tags", tags);
		}

		model.addAttribute("sdto", sdto);

		System.out.println(sdto.toString());
		return "suggestionDetail";
	}

	@RequestMapping(value = "/acceptSuggestion", method = RequestMethod.POST)
	public String acceptSuggestion(SuggestionDto sdto, Model model) {
		boolean success = service.acceptSuggestion(sdto);
		model.addAttribute("success", success);
		
		return "suggestionDetail";
	}

	@RequestMapping("/kakaoinvitelink/{userNo}")
	public ModelAndView selectHistoryList(@PathVariable String userNo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		AES256Util aes256Util;
		String dercryptStr = "";
		try {
			aes256Util = new AES256Util();
			dercryptStr = aes256Util.decrypt(userNo);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		}
		mv.setViewName("/suggestionBoard");
		
		List<SuggestionDto> suggestionList = service.selectSuggestionList(Integer.parseInt(dercryptStr));
		session.setAttribute("userNo", Integer.parseInt(dercryptStr));
		mv.addObject("suggestionList", suggestionList);
		
		return mv;
	}
	
	@RequestMapping(value="/sortByDistance", method=RequestMethod.POST)
	@ResponseBody
	public List<SuggestionDto> sortByDistance(@RequestParam String longitude, @RequestParam String latitude, HttpSession session) {
		List<SuggestionDto> suggestionList = service.selectSuggestionList((int) session.getAttribute("userNo"));
		for(SuggestionDto s : suggestionList) {
			s.calcDistance(Double.parseDouble(latitude), Double.parseDouble(longitude));
		}
		suggestionList.sort(Comparator.comparingDouble(SuggestionDto ->  SuggestionDto.calcDistance(Double.parseDouble(latitude), Double.parseDouble(longitude))));
		for(SuggestionDto s : suggestionList) {
			System.out.println(s.getDistance());
		}
		return suggestionList;
	}
	
	@RequestMapping(value = "/suggestionResv", method = RequestMethod.POST)
	public String sugFromResv(HttpServletRequest request, SuggestionDto sdto, Model model) {
		sdto.setUser_no((int) request.getSession().getAttribute("userNo"));
		sdto = service.selectSuggestion(sdto);
		System.out.println(sdto.getPlace_no());
		List<String> pictures = service.selectPicturesByPlaceNo(sdto.getPlace_no());
		System.out.println(pictures);
		model.addAttribute("pictures", pictures);

		List<String> tags = new ArrayList<String>();
		if (sdto.getPlace_name() == null)
			System.out.println("NULL");
		else {
			sdto.setMessage(sdto.getMessage().replace("\n", "<br>"));
			tags = service.selectTagsByPlaceNo(sdto.getPlace_no());
			model.addAttribute("tags", tags);
		}

		model.addAttribute("sdto", sdto);

		System.out.println(sdto.toString());
		return "sugFromResv";
	}
}
