package com.spring.view.myPage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.biz.common.MailUtil;
import com.spring.biz.myPage.BookingsService;
import com.spring.biz.myPage.BookingsVO;
import com.spring.biz.myPage.CardVO;
import com.spring.biz.user.UserService;
import com.spring.biz.user.UserVO;

@Controller
@SessionAttributes("myPage")
public class BookingController {
	@Autowired
	private BookingsService bookingsService;
	@Autowired
	private UserService userService;
	
	// 예약관리(예약 예정 리스트)
	@RequestMapping(value = "bookingsList.do", method = RequestMethod.GET)
	public String bookingsList(Model model, BookingsVO vo) {
		model.addAttribute("bookingsList", bookingsService.getBookingsList(vo));
		return "myPage/bookings/getBookingsList";
	}
	
	// 예약번호로 검색
	@RequestMapping(value = "searchBookingId.do", method = RequestMethod.GET)
	public String searchBookingId(@RequestParam("searchBookingId") int bookingId, Model model) {
		model.addAttribute("bookingId", bookingsService.searchBookingId(bookingId));
		return "myPage/bookings/getBookingsList";
	}
	
	// 예약 완료 리스트
	@RequestMapping(value = "completeList.do", method = RequestMethod.GET)
	public String getCompleteList(Model model, BookingsVO vo) {
		model.addAttribute("bookingsList", bookingsService.getCompleteList(vo));
		return "myPage/bookings/getCompleteList";
	}
	
	// 예약 취소 리스트
	@RequestMapping(value = "cancleList.do", method = RequestMethod.GET)
	public String getCancleList(Model model, BookingsVO vo) {
		model.addAttribute("bookingsList", bookingsService.getCancleList(vo));
		return "myPage/bookings/getCancleList";
	}
	
	// 예약 상세 보기
	@RequestMapping(value = "editBooking.do", method = RequestMethod.GET)
	public String editBooking(@RequestParam("bookingId") int bookingId, Model model) {
		model.addAttribute("bookingId", bookingsService.searchBookingId(bookingId));
		return "myPage/bookings/editBookingView";
	}
	
	// 예약 취소
	@RequestMapping(value = "cancleBooking.do", method = RequestMethod.GET)
	public String cancleBooking(@RequestParam("bookingId") int bookingId, Model model, BookingsVO vo) {
		bookingsService.cancleBooking(bookingId);
		String result = bookingsList(model, vo);
		return result; 
	}
	
	// 날짜 수정
	@RequestMapping(value = "updateCheckin.do", method = RequestMethod.GET)
	public String updateCheckin(Model model, @RequestParam("bookingId") int bookingId,
		@RequestParam("checkin") String checkin, @RequestParam("checkout") String checkout){
		Map<String,String> updateMap = new HashMap<String, String>();
		updateMap.put("checkin", checkin);
		updateMap.put("checkout", checkout);
		updateMap.put("bookingId", Integer.toString(bookingId));
		bookingsService.updateCheckin(updateMap);
		String result = editBooking(bookingId, model);
		return result;
	}
	
	// 투숙객 정보 수정
	@RequestMapping(value = "updateGuest.do", method = RequestMethod.GET)
	public String updateGuest(Model model, @RequestParam("bookingId") int bookingId,
		@RequestParam("guest_email") String guest_email, @RequestParam("guest_name") String guest_name){
		Map<String,String> updateMap = new HashMap<String, String>();
		updateMap.put("guest_email", guest_email);
		updateMap.put("guest_name", guest_name);
		updateMap.put("bookingId", Integer.toString(bookingId));
		bookingsService.updateGuest(updateMap);
		String result = editBooking(bookingId, model);
		return result;
	}
	
	//카드 등록 페이지 이동
	@RequestMapping(value = "cardInfo.do")
	public String cardInfo() {
		return "myPage/cardInfo";
	}
		
	//카드 등록
	@RequestMapping(value = "insertCardInfo.do")
	public String insertCardInfo(Model model, CardVO vo) {
		bookingsService.insertCardInfo(vo);
		return "myPage/profile";
	}
	
	// 이용후기 페이지 이동
	@RequestMapping(value = "reviews.do", method = RequestMethod.GET)
	public String reviews() {
		return "myPage/reviews";
	}
	
	// 유저정보
   @RequestMapping(value = "profile.do", method = RequestMethod.GET)
   public String reservation(UserVO vo, Model model, HttpSession session) {
      try {
      vo.setId((String)session.getAttribute("userId"));
      model.addAttribute("userInform", userService.getUserInform(vo));
      }catch(Exception e) { return "index"; }
      return "myPage/profile";
   }
   
   // 유저정보 수정
   @RequestMapping(value = "updateUser.do", method = RequestMethod.POST)
   public String updateUser(UserVO vo, Model model, HttpSession session) {         
      userService.updateUser(vo);
      String result = reservation(vo, model, session);
      return result; 
   }
   
   // 유저 삭제
   @RequestMapping(value = "deleteUser.do", method = RequestMethod.GET)
   public String deleteUser(UserVO vo, HttpSession session) {
      vo.setId((String)session.getAttribute("userId"));
      if(vo.getId()==null) {
         session.invalidate();
         return "index";
      }else {
         userService.deleteUser(vo);
         session.invalidate();
         return "index";
      }
   }
   
   	// 매니저 권한 요청 메일 발송
	@RequestMapping(value = "managerRequest.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String managerRequest(UserVO vo, Model model, HttpSession session) {
		vo.setId((String) session.getAttribute("userId"));
		UserVO user = userService.getUserInform(vo);
		MailUtil mail = new MailUtil();
		mail.mailSendNaver(user);
		userService.roleRequest(vo);
		model.addAttribute("userInform", userService.getUserInform(vo));
		return "myPage/profile";
	}
}