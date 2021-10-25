package com.spring.biz.myPage;

import org.springframework.stereotype.Component;

import com.spring.biz.hotel.HotelVO;

import lombok.Data;

@Component
@Data
public class BookingsVO{
	private int booking_id; //예약번호
	private int hotel_num; //호텔번호
	private String user_id; //예약자 아이디
	private String guest_name; //투숙객 이름
	private String guest_email; //투숙객 연락망
	private int adult; //숙박인원(성인)
	private int child; //숙박인원(아동)
	private String checkin; //체크인
	private String checkout; //체크아웃
	private String booking_date; //예약날짜
	private String state; //예약상태
	private HotelVO hotel;
	
	private String checkinDate; // 달력에 필요한 체크인 날짜
}