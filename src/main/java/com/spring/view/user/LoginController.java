package com.spring.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Controller
public class LoginController {
   
   @Autowired
   UserService userService;

   @RequestMapping(value = "/login.do", method = RequestMethod.GET)
   public String loginView(@ModelAttribute("user") UserVO vo) {
      return "member/login_user";
   }

   @RequestMapping(value = "/login.do", method = RequestMethod.POST)
   public String login(UserVO vo, HttpSession session) {
      UserVO user = userService.getUser(vo);
      if (user != null) {
         session.setAttribute("userName", user.getName());
         session.setAttribute("userId", user.getId());
         session.setAttribute("userRole", user.getRole());
         return "index";
      } else
    	 return "member/login_user_failed";
   }
   
   // Admin 로그인 컨트롤
   @RequestMapping(value = "/indexAdmin.do", method = RequestMethod.GET)
   public String indexAdminView(@ModelAttribute("user") UserVO vo, HttpSession session) {
      session.setAttribute("userName", "관리자");
      session.setAttribute("userId", "admin");
      return "index";
   }

   @RequestMapping(value = "/addmember.do", method = RequestMethod.GET)
   public String addMemberView(@ModelAttribute("user") UserVO vo) {
      return "member/addmember";
   }

   @RequestMapping(value = "/addmember.do", method = RequestMethod.POST)
   public String addMemberproc(UserVO vo) {
      userService.setUser(vo);
      return "member/login_user";
   }
   
   //아이디 중복 검사
   @RequestMapping(value = "/getUserConfirm.do", method = RequestMethod.POST)
   @ResponseBody
   public boolean getUserConfirm(@RequestBody String userid, UserVO vo) {
      int result = userid.indexOf("=");
      String insertId = userid.substring(result+1);
      vo.setId(insertId);
      if (userService.getUserInform(vo) != null || insertId.equals("admin"))
         return false;
      else
         return true;
   }
   
   @RequestMapping(value = "/searchId.do", method = RequestMethod.GET)
   public String searchIdView(@ModelAttribute("user") UserVO vo, HttpSession session) {
	   session.invalidate();
      return "member/search_userId";
   }
   
   @RequestMapping(value = "/searchId.do", method = RequestMethod.POST)
   public String searchIdProc(UserVO vo, HttpSession session) {
	  UserVO user = userService.searchUserId(vo);
      if (user != null) {
    	  session.setAttribute("searchId", user.getId());    	  
    	  return "member/search_userId";
      } else {
    	  session.setAttribute("searchId", "fail");
    	  return "member/search_userId";
      }
   }
   
   @RequestMapping(value = "/searchPw.do", method = RequestMethod.GET)
   public String searchPwView(@ModelAttribute("user") UserVO vo, HttpSession session) {
	   session.invalidate();
      return "member/search_userPw";
   }
   
   @RequestMapping(value = "/searchPw.do", method = RequestMethod.POST)
   public String searchPwProc(UserVO vo, HttpSession session) {
	  UserVO user = userService.searchUserPw(vo);
      if (user != null) {
    	  session.setAttribute("searchPw", user.getPassword());    	  
    	  return "member/search_userPw";
      } else {
    	  session.setAttribute("searchPw", "fail");
    	  return "member/search_userPw";
      }
   }

}
