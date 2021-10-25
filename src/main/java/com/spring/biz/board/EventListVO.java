package com.spring.biz.board;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="eventList")
@XmlAccessorType(XmlAccessType.FIELD)
public class EventListVO {
	@XmlElement(name="event")
	private List<EventVO> eventList;

	public List<EventVO> getEventList() {
		return eventList;
	}

	public void setEventList(List<EventVO> eventList) {
		this.eventList = eventList;
	}

}
