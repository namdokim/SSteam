package com.ss.demo.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import java.util.List;

import com.ss.demo.domain.EventReviewVO;
import com.ss.demo.domain.EventVO;
import com.ss.demo.domain.SearchVO;
import com.ss.demo.service.EventService;




@Controller
@RequestMapping(value="/event")
public class EventController {
	
	@Autowired
	EventService es;
	
	
	//메인창
	@RequestMapping(value="/eventMain.do")
	public String eventMain(Model model, SearchVO searchVO) {
		/*
		 * List<String> list = new ArrayList<String>();
		 * 
		 * list.add("첫번째 게시물입니다."); list.add("두번째 게시물입니다."); list.add("세번째 게시물입니다.");
		 * list.add("네번째 게시물입니다.");
		 */
		/*
		 위 list 데이터를 board/list.jsp로 포워드하여 테이블 형태로 출력하세요.
		 */
		
		 String type = null;
		EventVO vo = new EventVO();
		 vo.setLType(type);
		
		List<EventVO> list = es.list(searchVO);
		
		model.addAttribute("list", list);
		
		return "event/eventMain";
		
	}
	
	//상세보기
	@RequestMapping(value="/eventView.do")
	public String eventView(int event_number,Model model){
		
	 EventVO vo = es.selectOneByevent_number(event_number);
		
		model.addAttribute("vo", vo);
		
		return "event/eventView";
	}
	
	
	//이벤트 글쓰기
	@RequestMapping(value="/eventWrite.do")
	public String eventWrite(){
		
		return "event/eventWrite";
	}
	

	
		@RequestMapping(value = "/eventWriteAction.do")
		public String eventWriteAction(EventVO ev, HttpServletRequest request)
		{

			// 이제 나머지 이벤트 데이터를 데이터베이스에 저장할 수 있습니다
			// 예를 들어, EventService를 호출하여 이벤트를 데이터베이스에 삽입할 수 있습니다.
			System.out.println("event_title : " + ev.getEvent_title());
			System.out.println("event_content : " + ev.getEvent_content());
			System.out.println("LType : " + ev.getLType());
		
			int value = es.EventInsert(ev);
			
			
			if (value > 0) {
				// 이벤트 등록 성공 시, 성공 상태코드와 메시지를 출력하고 메인 페이지로 리다이렉트합니다.
			System.out.println("이벤트 등록 성공");
			} else {
				// 이벤트 등록 실패 시, 실패 상태코드와 메시지를 출력하고 이벤트 작성 페이지로 리다이렉트합니다.
			System.out.println("이벤트 등록 실패");
			}

			return "redirect:/";
		}
	
		
		
	//리뷰
	@RequestMapping(value="/eventReviewWrite.do")
	public String eventReviewWrite(int event_number,Model model){
		
		 EventVO vo = es.selectOneByevent_number(event_number);
			
			model.addAttribute("vo", vo);
			
		
		
		return "event/eventReviewWrite";
	}
	
	@RequestMapping(value = "/eventReviewWriteAction.do")
	public String eventReviewWriteAction(EventReviewVO erv, HttpServletRequest request)
	{

		// 이제 나머지 이벤트 데이터를 데이터베이스에 저장할 수 있습니다
		// 예를 들어, EventService를 호출하여 이벤트를 데이터베이스에 삽입할 수 있습니다.
		System.out.println("comment_content : " + erv.getComment_content());
		System.out.println("Ratio : " + erv.getRatio());
		int value = es.EventReviewinsert(erv);
		
		
		if (value > 0) {
			// 이벤트 등록 성공 시, 성공 상태코드와 메시지를 출력하고 메인 페이지로 리다이렉트합니다.
		System.out.println("이벤트 등록 성공");
		} else {
			// 이벤트 등록 실패 시, 실패 상태코드와 메시지를 출력하고 이벤트 작성 페이지로 리다이렉트합니다.
		System.out.println("이벤트 등록 실패");
		}

		return "redirect:/";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
