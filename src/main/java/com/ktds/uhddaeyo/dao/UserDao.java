package com.ktds.uhddaeyo.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.ktds.uhddaeyo.model.dto.GuestDto;
import com.ktds.uhddaeyo.model.dto.HashTagDto;
import com.ktds.uhddaeyo.model.dto.HostDto;
import com.ktds.uhddaeyo.model.dto.PicDto;
import com.ktds.uhddaeyo.model.dto.PlaceDto;
import com.ktds.uhddaeyo.model.dto.PlaceTagDto;
import com.ktds.uhddaeyo.model.dto.UserDto;

public interface UserDao {
	public boolean loginCheck(UserDto user, HttpSession session);
	public UserDto viewMember(UserDto user);
	public void logout(HttpSession session);
	public Integer idCheck(String userId);
	public void insertGuest(GuestDto guest);
	public void insertHost(HostDto host);
	public void insertPlace(PlaceDto place);
	public void insertPicture(List<PicDto> pic);
	public List<HashTagDto> selectHashTags();
	public void insertPlaceTags(List<PlaceTagDto> tag);
	public void cancelJoin(int userNo, int placeNo);
}
