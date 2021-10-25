package com.spring.biz.hotel;

import java.sql.Date;

public class Criteria {
	private int pageNum;// 페이지 번호
	private int amount;// 페이지당 출력 갯수
	private String type;// 조회조건
	private String keyword;// 조회 키워드
	
private String userid;
	
	

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	


	// 메인페이지 조회 파라미터 저장 및 출력용 - 시작
	private Date checkin;
	private Date checkout;
	private String location;
	private int oldcount;
	private int youngcount;
	public Date getCheckin() {return checkin;}
	public void setCheckin(Date checkin) {this.checkin = checkin;}
	public Date getCheckout() {return checkout;}
	public void setCheckout(Date checkout) {this.checkout = checkout;}
	public String getLocation() {return location;}
	public void setLocation(String location) {this.location = location;}
	public int getOldcount() {return oldcount;}
	public void setOldcount(int oldcount) {this.oldcount = oldcount;}
	public int getYoungcount() {return youngcount;}
	public void setYoungcount(int youngcount) {this.youngcount = youngcount;}
	// 메인페이지 조회 파라미터 저장 및 출력용 - 끝
	

	// 최초 조회시 기본생성자에서 1페이지, 페이지당 10개씩
	public Criteria() {
		this(1, 6);
	}
	
	
	

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}

	// getters/setters
	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword + "]";
	}

}
