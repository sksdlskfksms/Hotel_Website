package com.spring.biz.hotel.impl;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.hotel.HotelVO;
import com.spring.biz.hotel.Criteria;
import com.spring.biz.hotel.HotelSearchVO;

// DAO(Data Access Object)
@Repository("hotelDAO")
public class HotelDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// CRUD 기능의 메소드 구현
	// 글 등록
	public void insertHotel(HotelVO vo) {
		mybatis.insert("HotelDAO.insertHotel", vo);
	}

	// 글 수정
	public void updateHotel(HotelVO vo) {
		mybatis.update("HotelDAO.updateHotel", vo);
	}

	// 글 삭제
	public void deleteHotel(HotelVO vo) {
		mybatis.delete("HotelDAO.deleteHotel", vo);
	}

	// 글 상세 조회
	public HotelVO getHotel(HotelVO vo) {
		updateCount(vo);
		return mybatis.selectOne("HotelDAO.selectHotel", vo);
	}

	// 글 목록 조회
	public List<HotelVO> getHotelList(HotelVO vo) {
		return mybatis.selectList("HotelDAO.selectListHotel", vo);
	}

	// 조회 건수 증가
	public void updateCount(HotelVO vo) {
		mybatis.update("HotelDAO.updateCount", vo);
	}

	// 전체 건수 조회
	public int getTotalCount(Criteria cri) {
		return mybatis.selectOne("HotelDAO.getTotalCount", cri);
	}

	// 전체 글 조회
	public List<HotelVO> getListWithPaging(Criteria cri) {
		return mybatis.selectList("HotelDAO.getListWithPaging", cri);
	}

	public List<HotelVO> getHotelSearch(HotelSearchVO vo) {
		return mybatis.selectList("HotelDAO.selectSearchHotel", vo);
	}

	public String selectHotelcode() {
		return mybatis.selectOne("HotelDAO.selectHotelcode");
	}
	
	//시퀀스 조회
	public String selectSeq() {	
		return mybatis.selectOne("HotelDAO.selectSeq");
	}


	public void insertFile(Map<String, Object> map) {
		mybatis.insert("HotelDAO.insertFile", map);
		
	}

	public String getHotelImg() {
		return mybatis.selectOne("HotelDAO.getHotelImg");
	}

	
	public List<String> getHotelImgs(HotelVO vo) {
		return mybatis.selectList("HotelDAO.getHotelImgs", vo);
	}

	public List<HotelVO> getHotelList2(Criteria cri) {
		return mybatis.selectList("HotelDAO.getListWithPagingMain", cri);
	}

	public List<HotelVO> getHotelListmy(Criteria cri) {
		return mybatis.selectList("HotelDAO.getHotelListmy", cri);
	}
	
	
}
