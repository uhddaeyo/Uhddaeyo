package com.ktds.uhddaeyo.mapper;

import javax.servlet.http.HttpSession;

import com.ktds.uhddaeyo.model.dto.UserDto;;
public interface UserMapper {
	public String loginCheck(UserDto user);
	public UserDto viewMember(UserDto user);
	public void logout(HttpSession session);
}
