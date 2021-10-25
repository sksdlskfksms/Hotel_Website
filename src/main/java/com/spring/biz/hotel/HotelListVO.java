package com.spring.biz.hotel;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="hotelList")
@XmlAccessorType(XmlAccessType.FIELD)
public class HotelListVO {
	@XmlElement(name="hotel")
	private List<HotelVO> hotelList;

	public List<HotelVO> getHotelList() {
		return hotelList;
	}

	public void setHotelList(List<HotelVO> hotelList) {
		this.hotelList = hotelList;
	}
	
	

}
