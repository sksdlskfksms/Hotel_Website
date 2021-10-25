package com.spring.biz.board;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="qnaList")
@XmlAccessorType(XmlAccessType.FIELD)
public class QnAListVO {
	@XmlElement(name="qna")
	private List<QnAVO> qnaList;

	public List<QnAVO> getQnAList() {
		return qnaList;
	}

	public void setQnAList(List<QnAVO> qnaList) {
		this.qnaList = qnaList;
	}

}
