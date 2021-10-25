package com.spring.biz.myPage.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.myPage.BookingsVO;
import com.spring.biz.myPage.CardVO;

@Repository("bookingsDAO")
public class BookingsDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 예약 예정 리스트
	public List<BookingsVO> getBookingsList(BookingsVO vo){
		return mybatis.selectList("BookingsDAO.getBookingsList", vo);
	}
	
	// 예약 완료 리스트
	public List<BookingsVO> getCompleteList(BookingsVO vo) {
		mybatis.update("BookingsDAO.stateUpdate", vo);
		return mybatis.selectList("BookingsDAO.getCompleteList", vo);
	}
	
	// 예약 취소 리스트
	public List<BookingsVO> getCancleList(BookingsVO vo) {
		return mybatis.selectList("BookingsDAO.getCancleList", vo);
	}
	
	// 예약번호로 검색 및 상세조회
	public BookingsVO searchBookingId(int bookingId) {
		return mybatis.selectOne("BookingsDAO.searchBookingId", bookingId);
	}
	
	// 예약 취소
	public void cancleBooking(int bookingId){
		mybatis.update("BookingsDAO.cancleBooking", bookingId);
	}
	
	// 예약 수정
	public void updateCheckin(Map<String,String> updateMap) {
		mybatis.update("BookingsDAO.updateCheckin", updateMap);
	}
	public void updateGuest(Map<String, String> updateMap) {
		mybatis.update("BookingsDAO.updateGuest", updateMap);
	}
	
	//카드 등록
	public void insertCardInfo(CardVO vo) {
		mybatis.insert("BookingsDAO.insertCardInfo", vo);
	}

}

