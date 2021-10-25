package com.spring.biz.board;

import java.util.List;

public interface EventService {
	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertEvent(EventVO vo);

	// 글 수정
	void updateEvent(EventVO vo);

	// 글 삭제
	void deleteEvent(EventVO vo);

	// 글 상세 조회
	EventVO getEvent(EventVO vo);

	// 글 목록 조회
	List<EventVO> getEventList(EventVO vo);

	List<EventVO> getEventList(Criteria cri);

	int getTotal(Criteria cri);
}




