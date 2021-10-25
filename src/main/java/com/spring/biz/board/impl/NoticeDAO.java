package com.spring.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.board.Criteria;
import com.spring.biz.board.NoticeVO;

// DAO(Data Access Object)
@Repository("noticeDAO")
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// CRUD 기능의 메소드 구현
	// 글 등록
	public void insertNotice(NoticeVO vo) {
		mybatis.insert("NoticeDAO.insertNotice", vo);
	}

	// 글 수정
	public void updateNotice(NoticeVO vo) {
		mybatis.update("NoticeDAO.updateNotice", vo);
	}

	// 글 삭제
	public void deleteNotice(NoticeVO vo) {
		mybatis.delete("NoticeDAO.deleteNotice", vo);
	}

	// 글 상세 조회
	public NoticeVO getNotice(NoticeVO vo) {
		updateCount(vo);
		return mybatis.selectOne("NoticeDAO.selectNotice", vo);
	}

	// 글 목록 조회
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return mybatis.selectList("NoticeDAO.selectListNotice", vo);
	}

	// 조회 건수 증가
	public void updateCount(NoticeVO vo) {
		mybatis.update("NoticeDAO.updateCount", vo);
	}

	// 전체 건수 조회
	public int getTotalCount(Criteria cri) {
		return mybatis.selectOne("NoticeDAO.getTotalCount", cri);
	}

	// 전체 글 조회
	public List<NoticeVO> getListWithPaging(Criteria cri) {
		return mybatis.selectList("NoticeDAO.getListWithPaging", cri);
	}
}
