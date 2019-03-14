package com.ktds.uhddaeyo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ktds.uhddaeyo.model.dto.ReservationDto;

@Repository
public class ReservationListImpl implements ReservationListDao{

	@Inject
	private SqlSession sqlSession;
	private static final String Namespace = "com.ktds.uhddaeyo.mapper.UserMapper";
	
	@Override
	public List<ReservationDto> selectReservationList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace + ".selectReservationList");
	}
	
	

}
