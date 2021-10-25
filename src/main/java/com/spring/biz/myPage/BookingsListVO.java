package com.spring.biz.myPage;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="bookingsList")
@XmlAccessorType(XmlAccessType.FIELD)
public class BookingsListVO {
	@XmlElement(name="bookings")
	private List<BookingsVO> bookingsList;

	public List<BookingsVO> getBoardList() {
		return bookingsList;
	}

	public void setBookingsList(List<BookingsVO> bookingsList) {
		this.bookingsList = bookingsList;
	}
	
}
