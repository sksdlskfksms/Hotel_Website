package com.spring.biz.hotel;

import java.sql.Date;
import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class HotelVO {

	private int num;
	private String userid;
	private String username;
	private String hotelcode;
	private String hotelname;
	private String zipcode;
	private String address;
	private String addressdetail;
	private String extraAddress;
	private String roomtype;
	private int hotelprice;
	private int oldcount;
	private int youngcount;
	private Date checkin;
	private Date checkout;
	private int singlebed;
	private int doublebed;
	private String[] chkinfoArr;//인풋 체크박스 : 배열
	private String chkinfo; //아웃풋 체크박스 : string 
	private String otherinfo;
	private int hit;
	//private String title;
	//private String writer;
	//private String content;
	//private Date regDate;
	private String searchCondition;//검색 조건
	private String searchKeyword;//검색 내용
	private String chkinfocomma;
	private String org_file_name;
	
}
