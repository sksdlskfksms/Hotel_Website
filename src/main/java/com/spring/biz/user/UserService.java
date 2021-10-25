package com.spring.biz.user;

import java.util.List;

public interface UserService {
   
   public UserVO getUser(UserVO vo);
      
   public void setUser(UserVO vo);
   
// 유저 정보 조회
   public UserVO getUserInform(UserVO vo);
   
   public void updateUser(UserVO vo);

   public void deleteUser(UserVO vo);
   
// 매니저 권한 요청 처리
   public void roleRequest(UserVO vo);

   public void managerGrant(UserVO vo);

   public void grantCancle(UserVO vo);

   public void managerRevoke(UserVO vo);

   List<UserVO> getRequestUserList(UserVO vo);

   List<UserVO> getManagerList(UserVO vo);
   
// 아이디 찾기
   public UserVO searchUserId(UserVO vo);
// 패스워드 찾기
   public UserVO searchUserPw(UserVO vo);
}