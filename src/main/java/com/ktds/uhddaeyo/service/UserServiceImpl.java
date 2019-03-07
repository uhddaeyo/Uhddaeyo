package com.ktds.uhddaeyo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.mapper.UserMapper;
import com.ktds.uhddaeyo.model.dto.ReviewDto;
import com.ktds.uhddaeyo.model.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;

	@Override
	public boolean loginCheck(UserDto user, HttpSession session) {
		String r = userMapper.loginCheck(user);
		boolean rslt = (r == null) ? false : true;
		if (rslt) {
			UserDto user2 = viewMember(user);
			session.setAttribute("userNo", user2.getNo());
			session.setAttribute("userId", user2.getId());
			session.setAttribute("userName", user2.getName());
			session.setAttribute("userType", user2.getType());
		}
		return rslt;
	}

	@Override
	public UserDto viewMember(UserDto user) {
		return userMapper.viewMember(user);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
		
	}

	@Override
	public List<Map<String, Object>> selectHistory(int userNo) {
		return userMapper.selectHistory(userNo);
	}

	@Override
	public String reviewDetail(int placeNo) {
		return userMapper.reviewDetail(placeNo);
	}

	@Override
	public void insertReview(ReviewDto review) {
		userMapper.insertReview(review);
	}
}
