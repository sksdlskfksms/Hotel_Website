package com.spring.biz.hotel;

import java.sql.Date;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class MainSearchVO {
	//메인페이지 조회 파라미터 저장 및 출력용 
		private Date checkin;
		private Date checkout;
		private String location;
		private int oldcount;
		private int youngcount;
	
}
