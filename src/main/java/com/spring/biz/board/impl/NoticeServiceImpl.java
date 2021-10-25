package com.spring.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.board.Criteria;
import com.spring.biz.board.NoticeService;
import com.spring.biz.board.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	public void insertNotice(NoticeVO vo) {
		noticeDAO.insertNotice(vo);
	}

	public void updateNotice(NoticeVO vo) {
		noticeDAO.updateNotice(vo);
	}

	public void deleteNotice(NoticeVO vo) {
		noticeDAO.deleteNotice(vo);
	}

	public NoticeVO getNotice(NoticeVO vo) {
		return noticeDAO.getNotice(vo);
	}

	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return noticeDAO.getNoticeList(vo);
	}

	// 페이징
	@Override
	public List<NoticeVO> getNoticeList(Criteria cri) {
		return noticeDAO.getListWithPaging(cri);
	}

	// 조회조건에 해당하는 전체 글 갯수 조회메소드
	@Override
	public int getTotal(Criteria cri) {
		return noticeDAO.getTotalCount(cri);
	}
}
