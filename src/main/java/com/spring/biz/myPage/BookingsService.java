package com.spring.biz.myPage;

import java.util.List;
import java.util.Map;

public interface BookingsService {
	// 예약 예정 리스트
	List<BookingsVO> getBookingsList(BookingsVO vo);
	
	// 예약 완료 리스트
	List<BookingsVO> getCompleteList(BookingsVO vo);
	
	// 예약 취소 리스트
	List<BookingsVO> getCancleList(BookingsVO vo);

	// 예약번호로 검색 및 상세조회
	BookingsVO searchBookingId(int bookingId);
	
	// 예약 취소
	void cancleBooking(int bookingId);
	
	// 예약 수정
	void updateCheckin(Map<String,String> updateMap);
	void updateGuest(Map<String, String> updateMap);

	//카드 등록
	void insertCardInfo(CardVO vo);
	
}
