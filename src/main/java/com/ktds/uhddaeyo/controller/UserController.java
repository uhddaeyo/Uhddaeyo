package com.ktds.uhddaeyo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.model.dto.UserDto;
import com.ktds.uhddaeyo.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService memberService;

	@RequestMapping("/login")
	public String login(HttpServletRequest req) {
		if(req.getSession().getAttribute("userId") == null) {
			return "login";
		} else {
			int type = (int) req.getSession().getAttribute("userType");
			return (type == 1) ? "host" : "home";
		}
	}

	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(@ModelAttribute UserDto user, HttpSession session) {
		boolean rslt = memberService.loginCheck(user, session);
		ModelAndView model = new ModelAndView();
		if (rslt == true) {
			int type = (int) session.getAttribute("userType");
			switch (type) {
			case 1:
				model.setViewName("/host");
				model.addObject("msg", "success");
				break;
			case 2:
				model.setViewName("/home");
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
		memberService.logout(session);
		ModelAndView model = new ModelAndView();
		model.setViewName("/login");
		model.addObject("msg", "logout");
		return model;
	}
}
