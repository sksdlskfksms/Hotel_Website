package com.spring.view.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.board.Criteria;
import com.spring.biz.board.EventService;
import com.spring.biz.board.EventVO;
import com.spring.biz.board.NoticeService;
import com.spring.biz.board.NoticeVO;
import com.spring.biz.board.PageDTO;
import com.spring.biz.board.QnAService;
import com.spring.biz.board.QnAVO;


@Controller
@SessionAttributes("notice")
public class BoardController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private EventService eventService;
	@Autowired
	private QnAService qnaService;
	
	
	// 공지사항 글 등록
	@RequestMapping(value = "insertNoticeView.do", method = RequestMethod.GET)
		public String insertNoticeView () {
			return "board/insertNotice";
	}
	// 이벤트 글 등록
		@RequestMapping(value = "insertEventView.do", method = RequestMethod.GET)
			public String insertEventView () {
				return "board/insertEvent";
		}
	// 질문게시판 글 등록
		@RequestMapping(value = "insertQnAView.do", method = RequestMethod.GET)
			public String insertQnAView () {
				return "board/insertQnA";
		}
		
		
		
	
	
	// 공지사항 글 등록 처리
	@RequestMapping(value = "insertNotice.do", method = RequestMethod.POST)
	public String insertNotice(NoticeVO vo, Criteria cri, Model model, HttpServletRequest request) throws IOException{
		String path = "c:/upload/";
		//파일 업로드 처리
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()){
			String fileName=uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(path+fileName));
		}
		noticeService.insertNotice(vo);
		String result = getNoticeList(cri,model);
		return result; 
	}

	// 이벤트 글 등록 처리
		@RequestMapping(value = "insertEvent.do", method = RequestMethod.POST)
		public String insertEvent(EventVO vo, Criteria cri, Model model, HttpServletRequest request) throws IOException{
			String path = "c:/upload/";
			//파일 업로드 처리
			MultipartFile uploadFile = vo.getUploadFile();
			if(!uploadFile.isEmpty()){
				String fileName=uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(path+fileName));
			}
				eventService.insertEvent(vo);
				String result = getEventList(cri,model);
				return result; 
		}
	//질문게시판 글 등록 처리
		@RequestMapping(value = "insertQnA.do", method = RequestMethod.POST)
		public String insertQnA(QnAVO vo, Criteria cri, Model model) throws IOException{
			qnaService.insertQnA(vo);
			String result = getQnAList(cri, model);
			return result; 
		}	
		
		// 질문게시판 답글 등록 처리   
		@RequestMapping(value = "/insertRefQnA.do", method = RequestMethod.GET)
		public String insertRefQnAForm(QnAVO vo, Criteria cri, Model model) throws IOException{
			System.out.println(vo);
			model.addAttribute("refQnA",vo);
			return "board/insertRefQnA"; 
		}	
	
	// 질문게시판 답글 등록 처리   
			@RequestMapping(value = "/insertRefQnA.do", method = RequestMethod.POST)
			public String insertRefQnA(QnAVO vo, Criteria cri, Model model) throws IOException{
				System.out.println(vo);
				qnaService.insertRefQnA(vo);
				String result = getQnAList(cri,model);
				return result; 
			}	
		
				
								
	
	
	// 공지사항 글 수정
	@RequestMapping(value = "updateNotice.do", method = RequestMethod.GET)
	public String updateNotice(@ModelAttribute("notice") NoticeVO vo, Criteria cri, Model model, HttpServletRequest request) {			
		noticeService.updateNotice(vo);
		String result = getNoticeList(cri,model);
		return result; 
	}
	// 이벤트 글 수정
		@RequestMapping(value = "updateEvent.do", method = RequestMethod.GET)
		public String updateEvent(@ModelAttribute("event") EventVO vo, Criteria cri, Model model, HttpServletRequest request) {			
			eventService.updateEvent(vo);
			String result = getEventList(cri,model);
			return result; 
		}
		// 질문게시판 글 수정
		@RequestMapping(value = "updateQnA.do", method = RequestMethod.GET)
		public String updateQnA(@ModelAttribute("qna") QnAVO vo, Criteria cri, Model model, HttpServletRequest request) {			
			qnaService.updateQnA(vo);
			String result = getQnAList(cri,model);
			return result; 
		}
		
		
	
		
	
	// 공지사항 글 삭제
	@RequestMapping(value = "deleteNotice.do", method = RequestMethod.GET)
	public String deleteNotice(NoticeVO vo, Criteria cri, Model model, HttpServletRequest request) {
		noticeService.deleteNotice(vo);
		String result = getNoticeList(cri,model);
		return result; 
	}
	// 이벤트 글 삭제
		@RequestMapping(value = "deleteEvent.do", method = RequestMethod.GET)
		public String deleteEvent(EventVO vo, Criteria cri, Model model, HttpServletRequest request) {
			eventService.deleteEvent(vo);
			String result = getEventList(cri,model);
			return result; 
		}
		// 질문게시판 글 삭제
		@RequestMapping(value = "deleteQnA.do", method = RequestMethod.GET)
		public String deleteQnA(QnAVO vo, Criteria cri, Model model, HttpServletRequest request) {
			qnaService.deleteQnA(vo);
			String result = getQnAList(cri, model);
			return result; 
		}		
		
		
		
		
	// 공지사항 게시판 목록
	@RequestMapping(value = "getNoticeList.do", method = RequestMethod.GET)
	public String getNoticeList(Criteria cri, Model model) {		
		model.addAttribute("noticeList", noticeService.getNoticeList(cri));
		int total = noticeService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "board/getNoticeList"; 
	}
	// 이벤트 게시판 목록
	@RequestMapping(value = "/getEventList.do", method = RequestMethod.GET)
	public String getEventList(Criteria cri, Model model) {
		model.addAttribute("eventList", eventService.getEventList(cri));
		int total = eventService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "board/getEventList"; 
	}
	// 질문게시판 게시판 목록
	@RequestMapping(value = "/getQnAList.do", method = RequestMethod.GET)
	public String getQnAList(Criteria cri, Model model) {
		model.addAttribute("qnaList", qnaService.getQnAList(cri));
		int total = qnaService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "board/getQnAList"; 
	}	
	
	
	
	// 공지사항 글 상세
	@RequestMapping(value = "getNotice.do", method = RequestMethod.GET)
	public String getNotice(Criteria cri, Model model, NoticeVO vo) {
		model.addAttribute("notice", noticeService.getNotice(vo)); // Model 정보 저장
		int total = noticeService.getTotal(cri);
		model.addAttribute("pageMaker",new PageDTO(cri, total));
		return "board/getNotice"; // View 이름 리턴
	}
	// 이벤트 글 상세
		@RequestMapping(value = "/getEvent.do", method = RequestMethod.GET)
		public String getEvent(Criteria cri, Model model, EventVO vo) {
			model.addAttribute("event", eventService.getEvent(vo)); // Model 정보 저장
			int total = eventService.getTotal(cri);
			model.addAttribute("pageMaker",new PageDTO(cri, total));
			return "board/getEvent"; // View 이름 리턴
		}
		// 질문게시판 글 상세
		@RequestMapping(value = "/getQnA.do", method = RequestMethod.GET)
		public String getQnA(Criteria cri, Model model, QnAVO vo, HttpServletRequest request) {
			vo.setSeq(Integer.parseInt(request.getParameter("seq")));
			model.addAttribute("qna", qnaService.getQnA(vo)); // Model 정보 저장
			int total = qnaService.getTotal(cri);
			model.addAttribute("pageMaker",new PageDTO(cri, total));
			return "board/getQnA"; // View 이름 리턴
		}
		
	
		
	
	// 공지사항 검색조건
	@ModelAttribute("conditionMap")
	public Map<String,String> searchConditionMap(){
		Map<String,String> conditionMap = new HashMap<String, String>();
		conditionMap.put("내용","CONTENT");
		conditionMap.put("제목","TITLE");
		return conditionMap;
	}
	
	
	
}