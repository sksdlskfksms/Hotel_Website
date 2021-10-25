package com.spring.biz.hotel.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.hotel.HotelService;
import com.spring.biz.hotel.HotelVO;
import com.spring.biz.hotel.fileUtils;
import com.spring.biz.hotel.Criteria;
import com.spring.biz.hotel.HotelSearchVO;

@Service("hotelService")
public class HotelServiceImpl implements HotelService {
	@Autowired
	private HotelDAO hotelDAO;

	public void insertHotel(HotelVO vo) {
		hotelDAO.insertHotel(vo);
	}

	public void updateHotel(HotelVO vo) {
		hotelDAO.updateHotel(vo);
	}

	public void deleteHotel(HotelVO vo) {
		hotelDAO.deleteHotel(vo);
	}

	public HotelVO getHotel(HotelVO vo) {
		return hotelDAO.getHotel(vo);
	}

	public List<HotelVO> getHotelList(HotelVO vo) {
		return hotelDAO.getHotelList(vo);
	}

	// 페이징
	@Override
	public List<HotelVO> getHotelList(Criteria cri) {
		return hotelDAO.getListWithPaging(cri);
	}

	// 조회조건에 해당하는 전체 글 갯수 조회메소드
	@Override
	public int getTotal(Criteria cri) {
		return hotelDAO.getTotalCount(cri);
	}

	@Override
	public List<HotelVO> selectHotel(HotelSearchVO vo) {
		return hotelDAO.getHotelSearch(vo);
		
	}

	@Override
	public String selectHotelcode() {
		return hotelDAO.selectHotelcode();
	}

	@Override
	public String selectSeq() {
		return hotelDAO.selectSeq();
	}

	@Override
	public void insertFile(HotelVO vo, MultipartFile[] file) throws Exception {
		List<Map<String, Object>> fileList = fileUtils.parseFileInfo(file, vo);
	    for(int i=0; i<fileList.size(); i++) {
	    	hotelDAO.insertFile(fileList.get(i));
	    }
	}
	
	//등록한 호텔의 첫 번째 이미지 출력
	@Override
	public String getHotelImg() {
		return hotelDAO.getHotelImg();
	}
	
	//등록한 호텔의 모든 이미지 출력(다중 이미지 처리)
	@Override
	public List<String> getHotelImgs(HotelVO vo) {
		return hotelDAO.getHotelImgs(vo);
	}

	@Override
	public List<HotelVO> getHotelList2(Criteria cri) {
		return hotelDAO.getHotelList2(cri);
	}

	@Override
	public List<HotelVO> getHotelListmy(Criteria cri) {
		return hotelDAO.getHotelListmy(cri);
	}

}
