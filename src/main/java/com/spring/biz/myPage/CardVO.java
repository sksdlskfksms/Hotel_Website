package com.spring.biz.myPage;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class CardVO{
	private String userid;
	private String card_name; 
	private int card_num1; 
	private int card_num2; 
	private int card_num3; 
	private int card_num4; 
	private int card_month; 
	private int card_year;
	private int card_pwd;
	private String owner_name;
}