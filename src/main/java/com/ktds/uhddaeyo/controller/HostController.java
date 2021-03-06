package com.ktds.uhddaeyo.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.model.dto.GuestReqDto;
import com.ktds.uhddaeyo.model.dto.SuggestionDto;
import com.ktds.uhddaeyo.model.dto.PlaceDto;

import com.ktds.uhddaeyo.service.HostService;

@Controller
public class HostController {

	@Autowired
	HostService hostService;

	@RequestMapping("/guestList")
	public ModelAndView guestList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<GuestReqDto> guestList = hostService.getGuestList((int) session.getAttribute("placeNo"));
		mv.setViewName("/guestList");
		mv.addObject("guestList", guestList);
		return mv;
	}

	@RequestMapping("/resvList")
	public ModelAndView resvList(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<GuestReqDto> resvList = hostService.getResvList((int) session.getAttribute("placeNo"));
		mv.setViewName("/resvList");
		mv.addObject("resvList", resvList);
		return mv;
	}

	@RequestMapping(value = "/invitation", method = RequestMethod.POST)
	@ResponseBody
	public List<String> getPlaceInfo(HttpSession session) {
		String placeName = hostService.selectPlaceName((int) session.getAttribute("placeNo"));
		List<String> hashList = hostService.selectTagsByPlaceNo((int) session.getAttribute("placeNo"));
		hashList.add(0, placeName);
		return hashList;
	}


	@RequestMapping("/invite")
	public ModelAndView insertSuggestion(HttpSession session, @RequestParam("msg") String msg,
			@RequestParam("info") String info) {
		ModelAndView mv = new ModelAndView();
		String[] sInfo = info.split(",");
		SuggestionDto suggest = new SuggestionDto(Integer.parseInt(sInfo[2]), (int) session.getAttribute("placeNo"),
				Integer.parseInt(sInfo[1]), Timestamp.valueOf(sInfo[0]), msg);
		hostService.insertSuggestion(suggest);
		hostService.sentInvite(Integer.parseInt(sInfo[3]));
		List<GuestReqDto> guestList = hostService.getGuestList((int) session.getAttribute("placeNo"));
		mv.setViewName("/guestList");
		mv.addObject("guestList", guestList);
		return mv;
	}

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
	
	@RequestMapping("/guestAnalysis")
	public ModelAndView guestAnalysis(HttpSession session) {
		int placeNo = (int) session.getAttribute("placeNo");
		
		ModelAndView mv = new ModelAndView("/guestAnalysis");
		List<Map<String, Object>> getGenderStat = hostService.getGenderStat(placeNo);
		Map<String, Object> getAgeStat = hostService.getAgeStat(placeNo);
		ArrayList<Long> getFemaleStar = hostService.getStar(placeNo, "F", null);
		ArrayList<Long> getMaleStar = hostService.getStar(placeNo, "M",null);
		ArrayList<Long> getAllStar = hostService.getStar(placeNo, "F","M");
		
		mv.addObject("getGenderStat",getGenderStat);
		mv.addObject("getAgeStat",getAgeStat);
		mv.addObject("getFemaleStar",getFemaleStar);
		mv.addObject("getMaleStar",getMaleStar);
		mv.addObject("getAllStar",getAllStar);
		
		return mv;
	}

	@RequestMapping(value = "/saveMemo", method = RequestMethod.POST)
	@ResponseBody
	public boolean saveMemo(GuestReqDto grdto) {
		System.out.println(grdto.getSugNo() + " " + grdto.getMemo());
		return hostService.saveMemo(grdto);
	}
	
	@RequestMapping("/reviewAnalysis")
	public ModelAndView reviewAnalysis(HttpSession session) {
		ModelAndView mv = new ModelAndView("/reviewAnalysis");
		mv.addObject("userNo" , session.getAttribute("userNo"));
		return mv;
	}
}
