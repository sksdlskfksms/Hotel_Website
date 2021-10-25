package com.spring.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.Criteria;
import com.spring.biz.board.EventVO;

// DAO(Data Access Object)
@Repository("eventDAO")
public class EventDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// CRUD 기능의 메소드 구현
	// 글 등록
	public void insertEvent(EventVO vo) {
		mybatis.insert("EventDAO.insertEvent", vo);
	}

	// 글 수정
	public void updateEvent(EventVO vo) {
		mybatis.update("EventDAO.updateEvent", vo);
	}

	// 글 삭제
	public void deleteEvent(EventVO vo) {
		mybatis.delete("EventDAO.deleteEvent", vo);
	}

	// 글 상세 조회
	public EventVO getEvent(EventVO vo) {
		updateCount(vo);
		return mybatis.selectOne("EventDAO.selectEvent", vo);
	}

	// 글 목록 조회
	public List<EventVO> getEventList(EventVO vo) {
		return mybatis.selectList("EventDAO.selectListEvent", vo);
	}

	// 조회 건수 증가
	public void updateCount(EventVO vo) {
		mybatis.update("EventDAO.updateCount", vo);
	}

	// 전체 건수 조회
	public int getTotalCount(Criteria cri) {
		return mybatis.selectOne("EventDAO.getTotalCount", cri);
	}

	// 전체 글 조회
	public List<EventVO> getListWithPaging(Criteria cri) {
		return mybatis.selectList("EventDAO.getListWithPaging", cri);
	}
}
