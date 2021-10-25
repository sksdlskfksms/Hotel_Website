package com.spring.biz.myPage;

public class CalVO {

	private String id;
	private String hotelName;  		  
	private String TypeSelect;         
	private int startYear;          	  
	private String startMonth;        	  
	private int startDate; 			  
	private int yearSelect;    		  
	private String monthSelect;              
	private int dateSelect;             
	private String reservationMemo;
	private int resvDate;
	
	public int getResvDate() {
		return resvDate;
	}

	public void setResvDate(int resvDate) {
		this.resvDate = resvDate;
	}

	public CalVO() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getTypeSelect() {
		return TypeSelect;
	}

	public void setTypeSelect(String typeSelect) {
		TypeSelect = typeSelect;
	}

	public int getStartYear() {
		return startYear;
	}

	public void setStartYear(int startYear) {
		this.startYear = startYear;
	}

	public String getStartMonth() {
		return startMonth;
	}

	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}

	public int getStartDate() {
		return startDate;
	}

	public void setStartDate(int startDate) {
		this.startDate = startDate;
	}

	public int getYearSelect() {
		return yearSelect;
	}

	public void setYearSelect(int yearSelect) {
		this.yearSelect = yearSelect;
	}

	public String getMonthSelect() {
		return monthSelect;
	}

	public void setMonthSelect(String monthSelect) {
		this.monthSelect = monthSelect;
	}

	public int getDateSelect() {
		return dateSelect;
	}

	public void setDateSelect(int dateSelect) {
		this.dateSelect = dateSelect;
	}

	public String getReservationMemo() {
		return reservationMemo;
	}

	public void setReservationMemo(String reservationMemo) {
		this.reservationMemo = reservationMemo;
	}

	@Override
	public String toString() {
		return "CalVO [id=" + id + ", hotelName=" + hotelName + ", TypeSelect=" + TypeSelect + ", startYear="
				+ startYear + ", startMonth=" + startMonth + ", startDate=" + startDate + ", yearSelect=" + yearSelect
				+ ", monthSelect=" + monthSelect + ", dateSelect=" + dateSelect + ", reservationMemo=" + reservationMemo
				+ ", resvDate=" + resvDate + "]";
	}

	
	
	
	
}
