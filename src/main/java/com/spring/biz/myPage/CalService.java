package com.spring.biz.myPage;

import java.util.List;

public interface CalService {
	public List<CalVO> getCal(CalVO vo);
	public List<CalVO> searchCal(CalVO vo);
	public void setCal(CalVO calvo);
	public CalVO getCalRevs(CalVO vo);
	public List<CalVO> getHotelNameList(CalVO vo);
}
