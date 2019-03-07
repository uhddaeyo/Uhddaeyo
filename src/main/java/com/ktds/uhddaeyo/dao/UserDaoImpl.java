package com.ktds.uhddaeyo.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.uhddaeyo.mapper.UserMapper;
import com.ktds.uhddaeyo.model.dto.GuestDto;
import com.ktds.uhddaeyo.model.dto.ReservationDto;
import com.ktds.uhddaeyo.model.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	UserMapper userMapper;

	@Override
	public boolean loginCheck(UserDto user, HttpSession session) {
		String r = userMapper.loginCheck(user);
		boolean rslt = (r == null) ? false : true;
		if (rslt) {
			UserDto user2 = viewMember(user);
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
		// TODO Auto-generated method stub

	}

	@Override
	public Integer idCheck(String userId) {
		return userMapper.idCheck(userId);
	}

	@Override
	public void insertGuest(GuestDto guest) {
		userMapper.insertGuest(guest);

	}


}
