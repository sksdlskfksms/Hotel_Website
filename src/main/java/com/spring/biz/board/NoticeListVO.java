package com.spring.biz.board;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="noticeList")
@XmlAccessorType(XmlAccessType.FIELD)
public class NoticeListVO {
	@XmlElement(name="notice")
	private List<NoticeVO> noticeList;

	public List<NoticeVO> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(List<NoticeVO> noticeList) {
		this.noticeList = noticeList;
	}
	
	

}
