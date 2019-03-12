package com.ktds.uhddaeyo.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ktds.uhddaeyo.model.dto.ReplyDto;
import com.ktds.uhddaeyo.model.dto.ReviewDto;
import com.ktds.uhddaeyo.service.ReviewAndReplyService;

@Controller
public class ReviewController {

	@Inject
	ReviewAndReplyService service;

	@RequestMapping(value = "/review")
	public String getReviews (Model model, HttpServletRequest request) {
		int place_no = 0;
//		HttpSession session = request.getSession();
//		if (session.getAttribute("place_no") == null) {
//			// ���ǿ� place_no�� ������ �α����� �ȵ� ���̹Ƿ� �α��� �������� �̵�
//		} else {
//			place_no = (int)session.getAttribute("place_no");
//		}

		place_no = 1;
		List<ReviewDto> reviews = service.selectReviewList(place_no);
		System.out.println(reviews.toString());
		model.addAttribute("reviews", reviews);
		return "review";
	}
	
//	@RequestMapping(value = "/setReply", method = RequestMethod.POST)
//	public boolean setReply (HttpServletRequest request, @RequestParam String reply, @RequestParam int reply_no) {
//		System.out.println(reply + " " + reply_no);
//		ReplyDto rdto = new ReplyDto(reply, reply_no);
//		return service.updateReply(rdto);
//	}
}
