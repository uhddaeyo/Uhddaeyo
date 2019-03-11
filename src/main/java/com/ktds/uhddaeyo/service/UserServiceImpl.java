package com.ktds.uhddaeyo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktds.uhddaeyo.dao.UserDao;
import com.ktds.uhddaeyo.mapper.UserMapper;
import com.ktds.uhddaeyo.model.dto.GuestDto;
import com.ktds.uhddaeyo.model.dto.HashTagDto;
import com.ktds.uhddaeyo.model.dto.HostDto;
import com.ktds.uhddaeyo.model.dto.PicDto;
import com.ktds.uhddaeyo.model.dto.PlaceDto;
import com.ktds.uhddaeyo.model.dto.PlaceTagDto;
import com.ktds.uhddaeyo.model.dto.ReviewDto;
import com.ktds.uhddaeyo.model.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Autowired
	UserMapper userMapper;

	@Override
	public boolean loginCheck(UserDto user, HttpSession session) {
		String r = userMapper.loginCheck(user);
		boolean rslt = (r == null) ? false : true;
		if(rslt) {
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

	@Override
	public void insertHost(HostDto host) {
		userDao.insertHost(host);

	}

	@Override
	public void insertPlace(PlaceDto place) {
		userDao.insertPlace(place);

	}

	@Override
	public void insertPicture(List<PicDto> pic) {
		userDao.insertPicture(pic);

	}

	@Override
	public List<HashTagDto> selectHashTags() {
		return userDao.selectHashTags();
	}

	@Override
	public void insertPlaceTags(List<PlaceTagDto> tag) {
		userDao.insertPlaceTags(tag);

	}

	@Override
	public void cancelJoin(int userNo, int placeNo) {
		userDao.cancelJoin(userNo, placeNo);

	}

	@Override
	public List<Map<String, Object>> selectHistory(int userNo) {
		return userDao.selectHistory(userNo);
	}

	@Override
	public String reviewDetail(int placeNo) {
		return userDao.reviewDetail(placeNo);
	}

	@Override
	public void insertReview(ReviewDto review) {
		userDao.insertReview(review);
	}
  
	@Override
	public List<Map<String, Object>> selectInviteList(int userNo) {
		// TODO Auto-generated method stub
		return userMapper.selectInviteList(userNo);
	}

}
