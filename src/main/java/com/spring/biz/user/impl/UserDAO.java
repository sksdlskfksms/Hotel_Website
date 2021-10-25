package com.spring.biz.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.biz.user.UserVO;

@Repository("userDAO")
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public UserVO getUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUser", vo);
	}

	// setUser메소드
	public void setUser(UserVO vo) {
		mybatis.insert("UserDAO.setUser", vo);
	}

	// 유저 정보 로드
	public UserVO getUserInform(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUserInform", vo);
	}

	public void updateUser(UserVO vo) {
		mybatis.update("UserDAO.updateUser", vo);
	}

	public void deleteUser(UserVO vo) {
		mybatis.delete("UserDAO.deleteUser", vo);
	}

	// 매니저 권한 부여 요청
	public void roleRequest(UserVO vo) {
		mybatis.update("UserDAO.roleRequest", vo);
	}
	
	// 권한 요청 유저 리스트 조회
	public List<UserVO> getRequestUserList(UserVO vo) {
		return mybatis.selectList("UserDAO.requestUserList", vo);
	}
	
	// 권한 부여
	public void managerGrant(UserVO vo) {
		mybatis.update("UserDAO.managerGrant", vo);		
	}

	public List<UserVO> getManagerList(UserVO vo) {
		return mybatis.selectList("UserDAO.managerList", vo);
	}

	public void managerRevoke(UserVO vo) {
		mybatis.update("UserDAO.managerRevoke", vo);
	}

	public void grantCancle(UserVO vo) {
		mybatis.update("UserDAO.grantCancle", vo);
	}
	public UserVO searchPw(UserVO vo) {
		return mybatis.selectOne("UserDAO.searchUserPw", vo);
	}

	public UserVO searchId(UserVO vo) {
		return mybatis.selectOne("UserDAO.searchUserId", vo);		
	}
}