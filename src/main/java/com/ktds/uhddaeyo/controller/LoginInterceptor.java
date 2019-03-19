package com.ktds.uhddaeyo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(request.getSession().getAttribute("userType") != null) {
			return true;
		} else {
			 ModelAndView modelAndView = new ModelAndView("forward:/login");
             throw new ModelAndViewDefiningException(modelAndView);


		}
	}
	
	
}
