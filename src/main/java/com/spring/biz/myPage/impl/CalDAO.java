package com.spring.biz.myPage.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.myPage.CalVO;

/*import com.springbook.biz.user.UserVO;*/

@Repository("calDAO")
public class CalDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<CalVO> getCal(CalVO vo) {
		return mybatis.selectList("CalDAO.getCal", vo);
	}
	
	public List<CalVO> searchCal(CalVO vo) {
		return mybatis.selectList("CalDAO.searchCal", vo);
	}

	// setUser메소드
	public void setCal(CalVO vo) {
		mybatis.insert("CalDAO.setCal", vo);
	}

	public CalVO getCalRevs(CalVO vo) {
		return mybatis.selectOne("getResvCont", vo);
	}
	
	public List<CalVO> getHotelNameList(CalVO vo) {
		return mybatis.selectList("CalDAO.gethotelnamelist", vo);
	}

}
