package com.spring.biz.hotel;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface HotelService {
	// CRUD 기능의 메소드 구현

	// 글 등록
	void insertHotel(HotelVO vo);

	// 글 수정
	void updateHotel(HotelVO vo);

	// 글 삭제
	void deleteHotel(HotelVO vo);

	// 글 상세 조회
	HotelVO getHotel(HotelVO vo);

	// 글 목록 조회
	List<HotelVO> getHotelList(HotelVO vo);
	List<HotelVO> getHotelList(Criteria cri);
	
	
	
	int getTotal(Criteria cri);

	List<HotelVO> selectHotel(HotelSearchVO vo);

	String selectHotelcode();

	String selectSeq();

	void insertFile(HotelVO vo, MultipartFile[] file) throws Exception;
	//등록한 호텔의 첫 번째 이미지 출력
	String getHotelImg();
	//등록한 호텔의 모든 이미지 출력(다중 이미지 처리)
	List<String> getHotelImgs(HotelVO vo);


	List<HotelVO> getHotelList2(Criteria cri);
	List<HotelVO> getHotelListmy(Criteria cri);


}




