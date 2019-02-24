package com.ifive.ael.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.service.QnAService;
import com.ifive.ael.vo.QnAVO;


@Controller
public class QnAController {
	@Autowired
	HttpSession session;
	
	@Autowired
	private QnAService qs;
	
	private ModelAndView mav = new ModelAndView();
	
	
	// 1대1 문의 글쓰기
	@RequestMapping(value = "qnaWrite", method = RequestMethod.POST)
	public ModelAndView qna(@ModelAttribute QnAVO qnaVO) {
		if(session.getAttribute("ID") != null) {
			mav = qs.qnaWrite(qnaVO);
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
	
	// 1대1 문의 리스트에서 글쓰기 폼으로
	@RequestMapping(value ="qnaWriteList", method = RequestMethod.GET)
	public String WriteList() {
		if(session.getAttribute("ID") != null) {
			return "qnaWrite";
		}
		return "redirect:/";
	} 
	
	// 1대1 문의 리스트폼으로
	@RequestMapping(value = "qnaList", method = RequestMethod.GET)
	public ModelAndView qnaList(@RequestParam("page") int page, HttpSession session) {
		if(session.getAttribute("ID") != null) {
			mav = qs.qnaList(page);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}

	// ?
//	@RequestMapping(value = "qna", method = RequestMethod.GET)
//	public String qna() {
//		session.setAttribute("userId", "nauu123");
//		return "qnaWrite";
//	}
	
	// 1대1 문의 상세보기
	@RequestMapping(value = "qnadetail", method = RequestMethod.GET)
	public ModelAndView qnadetail(@RequestParam("QNUM") int QNUM) {
		if(session.getAttribute("ID") != null) {
			mav = qs.qnadetail(QNUM);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// 1대1 문의 답글폼
	@RequestMapping(value = "/qnaRe", method = RequestMethod.GET)
	public ModelAndView qnaRe(@RequestParam("QNUM") int QNUM) {
		if(session.getAttribute("ID") != null) {
			mav = qs.qnadetail(QNUM);
			mav.setViewName("qnaRe");
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// 1대1 문의 답글 글쓰기
	@RequestMapping(value = "qnaReWrite", method = RequestMethod.POST)
	public ModelAndView qnaReWrite(@ModelAttribute QnAVO qnaVO) {
		if(session.getAttribute("ID") != null) {
			mav = qs.qnaReWrite(qnaVO);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	// 1대1 내문의 보기
	@RequestMapping(value="/myQnA", method = RequestMethod.GET)
	public ModelAndView myQnA() {
		if(session.getAttribute("ID") != null) {
			mav = qs.myQnA((String) session.getAttribute("ID")); 
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	

}


