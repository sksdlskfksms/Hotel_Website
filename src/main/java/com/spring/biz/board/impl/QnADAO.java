package com.spring.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.Criteria;
import com.spring.biz.board.QnAVO;

// DAO(Data Access Object)
@Repository("qnaDAO")
public class QnADAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 글 등록
	public void insertQnA(QnAVO vo) {
		mybatis.insert("QnADAO.insertQnA", vo);
	}

	// 글 수정
	public void updateQnA(QnAVO vo) {
		mybatis.update("QnADAO.updateQnA", vo);
	}

	// 글 삭제
	public void deleteQnA(QnAVO vo) {
		mybatis.delete("QnADAO.deleteQnA", vo);
	}

	// 글 상세 조회
	public QnAVO getQnA(QnAVO vo) {
		updateCount(vo);
		return mybatis.selectOne("QnADAO.selectQnA", vo);
	}

	// 글 목록 조회
	public List<QnAVO> getQnAList(Criteria cri) {
		return mybatis.selectList("QnADAO.selectListQnA", cri);
	}

	// 전체 글 조회
	public List<QnAVO> getListWithPaging(QnAVO vo) {
		return mybatis.selectList("QnADAO.getListWithPaging", vo);
	}

	// 조회 건수 증가
	public void updateCount(QnAVO vo) {
		mybatis.update("QnADAO.updateCount", vo);
	}

	// 전체 건수 조회
	public int getTotalCount(Criteria cri) {
		return mybatis.selectOne("QnADAO.getTotalCount", cri);
	}


	// 답글 등록
	public void insertRefQnA(QnAVO vo) {
		mybatis.insert("QnADAO.insertRefQnA", vo);
		
	}

	// 답글 수정
	public void updateRefQnA(QnAVO vo) {
		mybatis.update("QnADAO.updateRefQnA", vo);
		
	}

	
}
