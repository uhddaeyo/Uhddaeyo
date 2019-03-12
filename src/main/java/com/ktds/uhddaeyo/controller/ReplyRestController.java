package com.ktds.uhddaeyo.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.uhddaeyo.model.dto.ReplyDto;
import com.ktds.uhddaeyo.service.ReviewAndReplyService;

@RestController
public class ReplyRestController {	
	
	@Inject
	ReviewAndReplyService service;
	
	@RequestMapping(value = "/setReply", method = RequestMethod.POST)
	public boolean setReply (HttpServletRequest request, @RequestParam String reply, @RequestParam int reply_no) {
		System.out.println(reply + " " + reply_no);
		ReplyDto rdto = new ReplyDto(reply, reply_no);
		return service.updateReply(rdto);
	}
}
