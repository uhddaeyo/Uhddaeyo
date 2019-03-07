package com.ktds.uhddaeyo.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktds.uhddaeyo.mapper.UserMapper;
import com.ktds.uhddaeyo.model.dto.GuestDto;
import com.ktds.uhddaeyo.model.dto.HashTagDto;
import com.ktds.uhddaeyo.model.dto.HostDto;
import com.ktds.uhddaeyo.model.dto.PicDto;
import com.ktds.uhddaeyo.model.dto.PlaceDto;
import com.ktds.uhddaeyo.model.dto.PlaceTagDto;
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

	@Override
	public void insertHost(HostDto host) {
		userMapper.insertHost(host);

	}

	@Override
	public void insertPlace(PlaceDto place) {
		userMapper.insertPlace(place);
		
	}

	@Override
	public void insertPicture(List<PicDto> pic) {
		userMapper.insertPicture(pic);
		
	}

	@Override
	public List<HashTagDto> selectHashTags() {
		return userMapper.selectHashTags();
	}

	@Override
	public void insertPlaceTags(List<PlaceTagDto> tag) {
		userMapper.insertPlaceTags(tag);
		
	}
	
	
	
}
