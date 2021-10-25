package com.spring.view.hotel;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.hotel.Criteria;
import com.spring.biz.hotel.HotelSearchVO;
import com.spring.biz.hotel.HotelService;
import com.spring.biz.hotel.HotelVO;
import com.spring.biz.hotel.MainSearchVO;

@Controller
@SessionAttributes("hotel")
public class HotelController {
	@Autowired
	private HotelService hotelservice;

	// 현재 호텔 코드 값 출력 (호텔 등록 시 max p_code + 1로 초기값 지정하기 위해 사용)
	@RequestMapping(value = "hbtest.do", method = RequestMethod.GET)
	public String hbtest(Model model) {
		model.addAttribute("hotellist2", hotelservice.selectHotelcode());
		return "/hotel/insertHotel";
	}

	// 글 등록 처리
	@RequestMapping(value = "insertHotel.do", method = RequestMethod.POST)
	public String insertHotel(HotelVO vo, com.spring.biz.hotel.Criteria cri, Model model, HttpServletRequest request)
			throws IOException {
		// 체크박스 콤마 처리
		String str = null;
		for (String val : vo.getChkinfoArr()) {
			str += val + ",";
		}
		vo.setChkinfocomma(str.substring(4, str.length() - 1));
		// 글 등록
		hotelservice.insertHotel(vo);

		// 게시글 리스트 페이지 이동 시 addAttribute 출력될 데이터 삽입
		model.addAttribute("hotelList", hotelservice.getHotelList(cri)); // (페이지당
		int total = hotelservice.getTotal(cri);
		model.addAttribute("pageMaker", new com.spring.biz.hotel.PageDTO(cri, total));
		return "hotel/getHotelList";
	}

	// 예약페이지 - 현범
	@RequestMapping(value = "booking.do")
	public String booking(Model model, HotelVO vo) {
		model.addAttribute("hotel", hotelservice.getHotel(vo));
		return "myPage/bookings/booking";
	}

	// 글 수정 페이지 이동
	@RequestMapping(value = "updateHotel.do", method = RequestMethod.GET)
	public String updateHotel(@ModelAttribute("hotel") HotelVO vo, Criteria cri, Model model,
			HttpServletRequest request) {
		model.addAttribute("hotel", hotelservice.getHotel(vo));

		return "hotel/updateHotel";
	}

	// 글 수정 - 로직 처리
	@RequestMapping(value = "updateProcessHotel.do", method = RequestMethod.GET)
	public String updateHotel(HotelVO vo, Model model, Criteria cri) {
		hotelservice.updateHotel(vo);
		
		//이동 후 
		model.addAttribute("hotelList", hotelservice.getHotelList(cri)); // (페이지당
		int total = hotelservice.getTotal(cri);
		model.addAttribute("pageMaker", new com.spring.biz.hotel.PageDTO(cri, total));

		return "hotel/getHotelList";
	}

	// 글 삭제
	@RequestMapping(value = "deleteHotel.do", method = RequestMethod.GET)
	public String deleteHotel(HotelVO vo, Criteria cri, Model model, HttpServletRequest request) {
		hotelservice.deleteHotel(vo);
		String result = getHotelList(vo, cri, model);
		return result;
	}

	// 검색
	@RequestMapping(value = "getHotel.do", method = RequestMethod.GET)
	public String getHotel(Criteria cri, Model model, HotelVO vo) {
		// 등록한 호텔의 모든 이미지 출력(다중 이미지 처리)
		model.addAttribute("hotelimages", hotelservice.getHotelImgs(vo));
		model.addAttribute("hotel", hotelservice.getHotel(vo)); // Model 정보 저장
		int total = hotelservice.getTotal(cri);
		model.addAttribute("pageMaker", new com.spring.biz.hotel.PageDTO(cri, total));
		return "hotel/getHotel"; // View 이름 리턴
	}

	// 검색조건
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("호텔명", "hotelname");
		conditionMap.put("주소", "address");
		return conditionMap;
	}

	// 게시판 목록 메인페이지에서 조회
	@RequestMapping(value = "MainSearch.do", method = RequestMethod.GET)
	public String SearchHotelList(Criteria cri, Model model, MainSearchVO search) {
		model.addAttribute("hotelList", hotelservice.getHotelList2(cri)); // (페이지당
																			// 6개씩
																			// 출력)
		int total = hotelservice.getTotal(cri);
		model.addAttribute("pageMaker", new com.spring.biz.hotel.PageDTO(cri, total));
		return "hotel/getHotelList";
	}

	// 게시판 목록
	@RequestMapping(value = "getHotelList.do", method = RequestMethod.GET)
	public String getHotelList(HotelVO vo, Criteria cri, Model model) {
		// 등록한 호텔의 첫 번째 이미지 출력
		model.addAttribute("hotelList", hotelservice.getHotelList(cri));
		int total = hotelservice.getTotal(cri);
		model.addAttribute("pageMaker", new com.spring.biz.hotel.PageDTO(cri, total));
		return "hotel/getHotelList";
	}

	// 다중 이미지 업로드
	@RequestMapping(value = "hotelimageSave.do", method = RequestMethod.GET)
	public String hbtest1() {
		return "/hotel/hotelimageSave";
	}

	// 다중 이미지 업로드
	@RequestMapping(value = "hotelimageSave1.do", method = RequestMethod.POST)
	public String hbtest2(@RequestParam("file") MultipartFile[] file, HotelVO vo) {
		// max seq + 1 출력 -> 호텔 등록시 입력될 기본키로서 파일 태이블에 외래키 용도로 삽입된다.
		String seq = hotelservice.selectSeq();
		if (seq == null)
			seq = "1";
		vo.setNum(Integer.parseInt(seq)); // 시퀀스를 vo에 삽입
		try {
			hotelservice.insertFile(vo, file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/hotel/hotelimageSave";
	}

	// 호텔이름체크
	@RequestMapping(value = "hotelnameCheck.do", method = RequestMethod.GET)
	public String hotelnameCheck(HttpServletRequest request, HotelSearchVO vo, Model model) {
		hotelservice.selectHotel(vo);
		List<HotelVO> list = hotelservice.selectHotel(vo);
		model.addAttribute("hotellist", list);
		return "/hotel/hotelnameCheck";
	}

	// 호텔이름체크
	@RequestMapping(value = "serchHotelName.do", method = RequestMethod.POST)
	public String serchHotelName() {
		return "/hotel/serchHotelName";
	}

	// 글 등록 보기
	@RequestMapping(value = "inserHotelView.do", method = RequestMethod.GET)
	public String inserHotelView() {
		return "hotel/insertHotel";
	}
	
	// 게시판 목록 세션 아이디 값만 조회
	@RequestMapping(value = "getHotelListmy.do", method = RequestMethod.GET)
	public String getHotelList(HotelVO vo, Criteria cri, Model model, HttpSession session) {		
		//세션 id출력
		String userid=(String)session.getAttribute("userId");
		cri.setUserid(userid);
		if(userid==null)
		cri.setUserid("null");
		model.addAttribute("hotelList", hotelservice.getHotelListmy(cri)); 
		int total = hotelservice.getTotal(cri);
		model.addAttribute("pageMaker", new com.spring.biz.hotel.PageDTO(cri, total));
		return "hotel/getHotelListmy";
	}

}