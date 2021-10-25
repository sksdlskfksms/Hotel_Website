package com.spring.view.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Controller
@SessionAttributes("admin")
public class AdminController {

	@Autowired
	UserService userService;

	// 요청 리스트 목록 조회
	@RequestMapping(value = "/requestUserList.do", method = RequestMethod.GET)
	public String getRequestUserList(HttpSession session, UserVO vo) {
		session.setAttribute("requestUserList", userService.getRequestUserList(vo));
		return "admin/requestUserList";
	}

	// 매니저 목록 조회
	@RequestMapping(value = "/managerList.do", method = RequestMethod.GET)
	public String getManagerList(HttpSession session, UserVO vo) {
		session.setAttribute("managerList", userService.getManagerList(vo));
		return "admin/managerList";
	}

	/*
	 * // 요청 리스트 목록 조회 - 페이징 구현 참조
	 * 
	 * @RequestMapping(value = "/requestUserList.do", method = RequestMethod.GET)
	 * public String getRequestUserList(Criteria cri, Model model) {
	 * model.addAttribute("requestUserList", userService.getRequestUserList(cri));
	 * 
	 * int total = eventService.getTotal(cri); model.addAttribute("pageMaker", new
	 * PageDTO(cri, total));
	 * 
	 * return "admin/requestUserList"; }
	 */

	// 매니저 권한 부여
	@RequestMapping(value = "managerGrant.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String managerGrant(UserVO vo, HttpSession session) {
		userService.managerGrant(vo);
		return getRequestUserList(session, vo);
	}

	// 매니저 권한 부여
	@RequestMapping(value = "grantCancle.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String grantCancle(UserVO vo, HttpSession session) {
		userService.grantCancle(vo);
		return getRequestUserList(session, vo);
	}

	// 매니저 권한 부여
	@RequestMapping(value = "managerRevoke.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String managerRevoke(UserVO vo, HttpSession session) {
		userService.managerRevoke(vo);
		return getManagerList(session, vo);
	}
}
