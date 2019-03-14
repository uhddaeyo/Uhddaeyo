package com.ktds.uhddaeyo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ktds.uhddaeyo.model.dto.ReplyDto;
import com.ktds.uhddaeyo.service.ReviewAndReplyService;

@RestController
public class ReplyRestController {	
	
	@Autowired
	ReviewAndReplyService service;
	
	@RequestMapping(value = "/setReply", method = RequestMethod.POST)
	public int setReply (@RequestParam int reply_no, @RequestParam int review_no, @RequestParam String reply) {
		ReplyDto rdto = new ReplyDto(reply_no, review_no, reply);
		if (reply_no == 0) {
			return service.insertReply(rdto);
		} else {
			return service.updateReply(rdto);	
		}
	}
}
