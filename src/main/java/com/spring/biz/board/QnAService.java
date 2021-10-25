package com.spring.biz.board;

import java.util.List;

public interface QnAService {
	// CRUD 기능의 메소드 구현
	// 글 등록
	void insertQnA(QnAVO vo);

	// 글 수정
	void updateQnA(QnAVO vo);

	// 글 삭제
	void deleteQnA(QnAVO vo);

	// 글 상세 조회
	QnAVO getQnA(QnAVO vo);

	// 글 목록 조회
	List<QnAVO> getQnAList(Criteria cri);

	int getTotal(Criteria cri);

	void insertRefQnA(QnAVO vo);
}




