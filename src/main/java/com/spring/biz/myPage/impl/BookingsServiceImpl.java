package com.spring.biz.myPage.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.myPage.BookingsService;
import com.spring.biz.myPage.BookingsVO;
import com.spring.biz.myPage.CardVO;

@Service("bookingsService")
public class BookingsServiceImpl implements BookingsService{
	@Autowired
	private BookingsDAO bookingsDAO;
	
	// 예약 예정 리스트
	public List<BookingsVO> getBookingsList(BookingsVO vo){
		return bookingsDAO.getBookingsList(vo);
	}
	
	// 예약 완료 리스트
	public List<BookingsVO> getCompleteList(BookingsVO vo) {
		return bookingsDAO.getCompleteList(vo);
	}

	// 예약 취소 리스트
	public List<BookingsVO> getCancleList(BookingsVO vo) {
		return bookingsDAO.getCancleList(vo);
	}

	// 예약번호로 검색 및 상세조회
	public BookingsVO searchBookingId(int bookingId) {
		return bookingsDAO.searchBookingId(bookingId);
	}

	// 예약 취소
	public void cancleBooking(int bookingId){
		bookingsDAO.cancleBooking(bookingId);
	}
	
	// 예약 수정
	public void updateCheckin(Map<String,String> updateMap) {
		bookingsDAO.updateCheckin(updateMap);
	}
	public void updateGuest(Map<String, String> updateMap) {
		bookingsDAO.updateGuest(updateMap);
	}
	
	// 카드 등록
	public void insertCardInfo(CardVO vo) {
		bookingsDAO.insertCardInfo(vo);
		
	}
	
}
