package com.ktds.uhddaeyo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Locale;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.model.dto.GuestDto;
import com.ktds.uhddaeyo.model.dto.ReservationDto;
import com.ktds.uhddaeyo.model.dto.UserDto;
import com.ktds.uhddaeyo.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

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
				model.setViewName("/host");
				model.addObject("msg", "success");
				break;
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
	public String signUpGet() {
		return "registerGuest";
	}

	@RequestMapping(value = "/guest/signUp", method = RequestMethod.POST)
	public ModelAndView signUpPost(GuestDto guest) {
		userService.insertGuest(guest);
		ModelAndView m = new ModelAndView();
		m.setViewName("/home");
		return m;

	}
	
	@RequestMapping("/reservationList")
	public ModelAndView selectReservationList(HttpSession session) {
		
		ModelAndView mv = new ModelAndView("/reservationList");
		
		int userNo = (int)session.getAttribute("userNo");
		List<Map<String,Object>> selectReservationList = userService.selectReservationList(userNo);
		mv.addObject("selectReservationList", selectReservationList);
		
		return mv;
	}
	

}
