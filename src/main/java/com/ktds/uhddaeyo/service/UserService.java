package com.ktds.uhddaeyo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ktds.uhddaeyo.model.dto.GuestDto;
import com.ktds.uhddaeyo.model.dto.ReviewDto;
import com.ktds.uhddaeyo.model.dto.UserDto;;

public interface UserService {
	
	public boolean loginCheck(UserDto user, HttpSession session);
	
	public UserDto viewMember(UserDto user);
	
	public void logout(HttpSession session);
	
	public int idCheck(String userId);
	
	public void insertGuest(GuestDto guest);

	public List<Map<String, Object>> selectHistory(int userNo);

	public String reviewDetail(int placeNo);

	public void insertReview(ReviewDto review);

}
