package com.ktds.uhddaeyo.dao;

import javax.servlet.http.HttpSession;

import com.ktds.uhddaeyo.model.dto.GuestDto;
import com.ktds.uhddaeyo.model.dto.UserDto;

public interface UserDao {
	public boolean loginCheck(UserDto user, HttpSession session);
	public UserDto viewMember(UserDto user);
	public void logout(HttpSession session);
	public Integer idCheck(String userId);
	public void insertGuest(GuestDto guest);
}
