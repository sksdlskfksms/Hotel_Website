package com.spring.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.board.Criteria;
import com.spring.biz.board.EventService;
import com.spring.biz.board.EventVO;

@Service("eventService")
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO eventDAO;

	public void insertEvent(EventVO vo) {
		eventDAO.insertEvent(vo);
	}

	public void updateEvent(EventVO vo) {
		eventDAO.updateEvent(vo);
	}

	public void deleteEvent(EventVO vo) {
		eventDAO.deleteEvent(vo);
	}

	public EventVO getEvent(EventVO vo) {
		return eventDAO.getEvent(vo);
	}

	public List<EventVO> getEventList(EventVO vo) {
		return eventDAO.getEventList(vo);
	}

	// 페이징
	@Override
	public List<EventVO> getEventList(Criteria cri) {
		return eventDAO.getListWithPaging(cri);
	}

	// 조회조건에 해당하는 전체 글 갯수 조회메소드
	@Override
	public int getTotal(Criteria cri) {
		return eventDAO.getTotalCount(cri);
	}
}
