package com.ktds.uhddaeyo.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Locale;
import org.springframework.ui.Model;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.model.dto.GuestDto;
import com.ktds.uhddaeyo.model.dto.ReservationDto;
import com.ktds.uhddaeyo.model.dto.HashTagDto;
import com.ktds.uhddaeyo.model.dto.HostDto;
import com.ktds.uhddaeyo.model.dto.PicDto;
import com.ktds.uhddaeyo.model.dto.PlaceTagDto;
import com.ktds.uhddaeyo.model.dto.UserDto;
import com.ktds.uhddaeyo.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;

	@RequestMapping("/login")
	public String login(HttpServletRequest req) {
		if (req.getSession().getAttribute("userId") == null) {
			return "login";
		} else {
			int type = (int) req.getSession().getAttribute("userType");
			return (type == 1) ? "home" : "host";
		}
	}

	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(UserDto user, HttpSession session) {
		boolean rslt = userService.loginCheck(user, session);
		ModelAndView model = new ModelAndView();
		if (rslt == true) {
			int type = (int) session.getAttribute("userType");
			switch (type) {
			case 1:
				model.setViewName("/home");
				model.addObject("msg", "success");
				break;
			case 2:
				String url = "redirect:/host";
				ModelAndView mv = new ModelAndView(url);
				mv.addObject("msg", "success");
				return mv;
			}
		} else {
			model.setViewName("/login");
			model.addObject("msg", "failure");
		}
		return model;
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		userService.logout(session);
		ModelAndView model = new ModelAndView();
		model.setViewName("/login");
		model.addObject("msg", "logout");
		return model;
	}

	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String userId) {
		int cnt = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		cnt = (int) userService.idCheck(userId);
		map.put("cnt", cnt);
		return map;
	}

	@RequestMapping(value = "/guest/signUp", method = RequestMethod.GET)
	public String signUpGuestGet() {
		return "registerGuest";
	}

	@RequestMapping(value = "/guest/signUp", method = RequestMethod.POST)
	public ModelAndView signUpGuestPost(GuestDto guest) {
		userService.insertGuest(guest);
		ModelAndView m = new ModelAndView();
		m.setViewName("/home");
		return m;
	}

	@RequestMapping(value = "/host/signUp", method = RequestMethod.GET)
	public ModelAndView signUpHostGet() {
		ModelAndView m = new ModelAndView();
		m.setViewName("registerHost");
		m.addObject("host", new HostDto());
		return m;
	}

	@RequestMapping(value = "/host/signUp", method = RequestMethod.POST, consumes = { "multipart/form-data" })
	public ModelAndView signUpHostPost(@ModelAttribute("host") HostDto host, MultipartHttpServletRequest req) {
		ModelAndView m = new ModelAndView();
		userService.insertHost(host);
		host.getPlace().setUserNo(host.getUserNo());
		userService.insertPlace(host.getPlace());

		List<MultipartFile> fileList = req.getFiles("pic");

		String path = "C:\\Users\\현정\\git\\Uhddaeyo\\src\\main\\webapp\\resources\\placeImages\\";
		UUID uuid = UUID.randomUUID();
		List<PicDto> pics = new ArrayList<>();

		for (MultipartFile mf : fileList) {
			String fileName = uuid + mf.getOriginalFilename();
			String saveName = path + fileName;
			pics.add(new PicDto(host.getPlace().getPlaceNo(), fileName));
			try {
				mf.transferTo(new File(saveName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		userService.insertPicture(pics);
		List<HashTagDto> hashTagList = userService.selectHashTags();
		m.setViewName("category");
		m.addObject("hashTagList", hashTagList);
		m.addObject("placeNo", host.getPlace().getPlaceNo());
		m.addObject("userNo", host.getUserNo());
		return m;
	}

	@RequestMapping(value = "/host/tag", method = RequestMethod.POST)
	public String tagInsert(@RequestParam("tag") List<String> tags, @RequestParam("placeNo") int placeNo, @RequestParam("classify") String classify) {
		List<PlaceTagDto> list = new ArrayList<>();
		list.add(new PlaceTagDto(placeNo, classify));
		for (String tag : tags) {
			list.add(new PlaceTagDto(placeNo, tag));
		}
		userService.insertPlaceTags(list);
		return "home";
	}
	
	@RequestMapping(value = "/host/back", method = RequestMethod.POST)
	public String cancelJoin(@RequestParam("placeNo") int placeNo, @RequestParam("userNo") int userNo) {
		userService.cancelJoin(userNo, placeNo);
		return "home";
	}
	
	@RequestMapping("/inviteList")
	public ModelAndView selectInviteList(HttpSession session) {
		ModelAndView mv = new ModelAndView("/inviteList");
		
		int placeNo = (int)session.getAttribute("placeNo");
		List<Map<String, Object>> selectInviteList = userService.selectInviteList(placeNo);
		mv.addObject("selectInviteList", selectInviteList);
		return mv;
	}
}
