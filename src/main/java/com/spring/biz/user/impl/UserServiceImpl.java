package com.spring.biz.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public UserVO getUser(UserVO vo) {
		if (vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("아이디는 반드시 입력해야합니다.");
		}
		return userDAO.getUser(vo);
	}

	@Override
	public void setUser(UserVO vo) {
		userDAO.setUser(vo);
	}

	@Override
	public UserVO getUserInform(UserVO vo) {
		return userDAO.getUserInform(vo);
	}

	@Override
	public void updateUser(UserVO vo) {
		userDAO.updateUser(vo);
	}

	@Override
	public void deleteUser(UserVO vo) {
		userDAO.deleteUser(vo);
	}

	@Override
	public void roleRequest(UserVO vo) {
		userDAO.roleRequest(vo);
	}

	@Override
	public List<UserVO> getRequestUserList(UserVO vo) {
		return userDAO.getRequestUserList(vo);
	}

	@Override
	public void managerGrant(UserVO vo) {
		userDAO.managerGrant(vo);
	}

	@Override
	public List<UserVO> getManagerList(UserVO vo) {
		return userDAO.getManagerList(vo);
	}

	@Override
	public void managerRevoke(UserVO vo) {
		userDAO.managerRevoke(vo);
	}

	@Override
	public void grantCancle(UserVO vo) {
		userDAO.grantCancle(vo);
	}
	
	@Override
	public UserVO searchUserId(UserVO vo) {
		return userDAO.searchId(vo);
	}

	@Override
	public UserVO searchUserPw(UserVO vo) {
		return userDAO.searchPw(vo);
	}

}