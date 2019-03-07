package com.ktds.uhddaeyo.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.dao.ReservationListDao;
import com.ktds.uhddaeyo.dao.UserDao;
import com.ktds.uhddaeyo.model.dto.GuestDto;
import com.ktds.uhddaeyo.model.dto.ReservationDto;
import com.ktds.uhddaeyo.model.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;

	@Override
	public boolean loginCheck(UserDto user, HttpSession session) {
		return userDao.loginCheck(user, session);
	}

	@Override
	public UserDto viewMember(UserDto user) {
		return userDao.viewMember(user);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public int idCheck(String userId) {
		return userDao.idCheck(userId);
	}

	@Override
	public void insertGuest(GuestDto guest) {
		userDao.insertGuest(guest);
		
	}

	@Inject
	private ReservationListDao reserDao;
	
	@Override
	public List<ReservationDto> selectReservationList() throws Exception {
		// TODO Auto-generated method stub
		return reserDao.selectReservationList();
	}
	
	

}
