package com.ktds.uhddaeyo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ktds.uhddaeyo.model.dto.ReplyDto;
import com.ktds.uhddaeyo.service.ReviewAndReplyService;

@RestController
public class ReplyRestController {	
	
	@Inject
	ReviewAndReplyService service;
	
	@RequestMapping(value = "/setReply", method = RequestMethod.POST)
	public ModelAndView setReply (HttpServletRequest request, @RequestParam String reply, @RequestParam int reply_no) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("review");
		
		System.out.println(reply + " " + reply_no);
		ReplyDto rdto = new ReplyDto(reply, reply_no);
		
		boolean success = service.updateReply(rdto);
		mv.addObject("success", success);
		return mv;
	}
}
