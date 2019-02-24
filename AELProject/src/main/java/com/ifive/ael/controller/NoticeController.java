package com.ifive.ael.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.service.NoticeService;
import com.ifive.ael.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService ns;
	
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	HttpSession session;
	
	// 공지사항 글쓰기
	@RequestMapping(value="noticeWrite", method=RequestMethod.POST)
	public ModelAndView noticeWrite(@ModelAttribute NoticeVO noticeVO) {
		if(session.getAttribute("ID") != null) {
			mav = ns.noticeWrite(noticeVO);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
		
	}
	
	@RequestMapping(value = "noticerWrite", method=RequestMethod.GET)
	public String noticerWrite() {
		if(session.getAttribute("ID") == null) {
			return "redirect:/";
		}
		return "noticeWrite";
	}
	
	// 공지사항 리스트
	
	
	
	// 공지사항 세부내용
	@RequestMapping(value = "noticeDetail", method = RequestMethod.GET)
	public ModelAndView noticeDetail(@RequestParam("NNUM") int NNUM) {
		if(session.getAttribute("ID") != null) {
			mav = ns.noticeDetail(NNUM);
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
	
	// 공지사항 검색
		@RequestMapping(value="noticeList", method = RequestMethod.GET)
		public ModelAndView noticeList(HttpServletRequest request) {
			if(session.getAttribute("ID") != null) {
				String NTITLE="";
				if(request.getParameter("NTITLE") != null) {
					NTITLE = request.getParameter("NTITLE");
				}
				int page = Integer.parseInt(request.getParameter("page"));
				mav = ns.noticeList(NTITLE,page);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
	
//	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
//	public String noticeDList() {
//		return "noticeList";
//	}
	// 1대1 문의 폼으로
//	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
//	public String qnaList() {
//		return "qnaList_paging";
//	}
	
	
	
	
	
	

}
