package com.spring.view.myPage;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.myPage.CalService;
import com.spring.biz.myPage.CalVO;


@Controller
@SessionAttributes("cal")
public class CalController {
	@Autowired
	private CalService calService;
	//일정등록 
    @RequestMapping(value = "schedule.do", method = RequestMethod.GET)
	public String schedule () {
		return "myPage/calendar/schedule";
	}
	
	//예약하기 화면에서 등록 눌렀을때
	@RequestMapping(value = "calRegister.do")
	public String calRegister(CalVO vo, Model model) {
		calService.setCal(vo);
		List<CalVO> list = calService.getCal(vo);
		for(int i=0;i<list.size();i++)
			System.out.println(list.get(i));
		model.addAttribute("resList",calService.getCal(vo));
		model.addAttribute("myhotelName", vo.getHotelName());
		return "myPage/calendar/searchCal";
	}

}