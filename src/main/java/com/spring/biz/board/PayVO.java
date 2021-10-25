package com.spring.biz.board;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PayVO {
    private String card_name;
    private int card_num;
    private int card_month;
    private int card_year;
    private int card_pwd;
    private String userid;
    private String owner_name;
	
}
