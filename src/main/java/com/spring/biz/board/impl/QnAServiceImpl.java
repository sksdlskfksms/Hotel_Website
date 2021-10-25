package com.spring.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.board.Criteria;
import com.spring.biz.board.QnAService;
import com.spring.biz.board.QnAVO;

@Service("qnaService")
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnADAO qnaDAO;

	public void insertQnA(QnAVO vo) {
		qnaDAO.insertQnA(vo);
	}

	public void updateQnA(QnAVO vo) {
		qnaDAO.updateQnA(vo);
	}

	public void deleteQnA(QnAVO vo) {
		qnaDAO.deleteQnA(vo);
	}

	public QnAVO getQnA(QnAVO vo) {
		return qnaDAO.getQnA(vo);
	}

	// 페이징
	public List<QnAVO> getQnAList(Criteria cri) {
		return qnaDAO.getQnAList(cri);
	}

	// 조회조건에 해당하는 전체 글 갯수 조회메소드
	public int getTotal(Criteria cri) {
		return qnaDAO.getTotalCount(cri);
	}

	public void insertRefQnA(QnAVO vo) {
		qnaDAO.updateRefQnA(vo);
		qnaDAO.insertRefQnA(vo);
	}
}
