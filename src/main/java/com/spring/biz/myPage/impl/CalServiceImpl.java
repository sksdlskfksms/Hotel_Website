package com.spring.biz.myPage.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.myPage.CalService;
import com.spring.biz.myPage.CalVO;

/*import com.springbook.biz.user.UserService;
import com.springbook.biz.user.UserVO;*/

@Service("calService")
public class CalServiceImpl implements CalService {
	@Autowired
	private CalDAO calDAO;
	@Override
	public List<CalVO> getCal(CalVO vo) {
	 return calDAO.getCal(vo);
	}
	
	@Override
	public List<CalVO> searchCal(CalVO vo) {
	 return calDAO.searchCal(vo);
	}
	
	@Override
	public void setCal(CalVO vo) {
		calDAO.setCal(vo);
	}

	@Override
	public CalVO getCalRevs(CalVO vo) {
		return calDAO.getCalRevs(vo);
	}
	
	@Override
	public List<CalVO> getHotelNameList(CalVO vo) {
		return calDAO.getHotelNameList(vo);
	}

}
