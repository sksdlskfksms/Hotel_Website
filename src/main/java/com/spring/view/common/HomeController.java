package com.spring.view.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	//welcome.html -> index.jsp로 리다이렉트
		@RequestMapping(value = "index.do", method = RequestMethod.GET)
		public String index() {
			return "index";
		}
}
