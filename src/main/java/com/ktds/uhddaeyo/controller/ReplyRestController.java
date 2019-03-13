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
	public int setReply (HttpServletRequest request, @RequestParam int reply_no, @RequestParam int review_no, @RequestParam String reply) {
		System.out.println(reply + " " + reply_no + " " + review_no);
		ReplyDto rdto = new ReplyDto(reply_no, review_no, reply);
		if (reply_no == 0) {
			return service.insertReply(rdto);
		} else {
			return service.updateReply(rdto);	
		}
	}
}
