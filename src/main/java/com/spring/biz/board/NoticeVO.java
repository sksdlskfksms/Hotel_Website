package com.spring.biz.board;

import java.util.Date;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Component
@Data
public class NoticeVO{
	private int seq;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private int cnt;
	private MultipartFile uploadFile;
	private String searchCondition;//검색 조건
	private String searchKeyword;//검색 내용
	
		
	}
