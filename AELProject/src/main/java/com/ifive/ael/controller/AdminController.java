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

import com.ifive.ael.service.AdminService;
import com.ifive.ael.service.NoticeService;
import com.ifive.ael.service.QnAService;
import com.ifive.ael.vo.*;

// @@@@@ 새로운 파일 1/29 @@@@@
@Controller
public class AdminController {

	@Autowired
	private AdminService as;
	
	@Autowired
	private NoticeService ns;
	
	@Autowired
	private QnAService qs;
	
	private ModelAndView mav = new ModelAndView();

	@Autowired
	private HttpSession session;
	
	// @@@ 1/30 @@@	
		// 매장 신고 접수폼
			@RequestMapping(value = "/resReportForm", method = RequestMethod.GET)
			public ModelAndView resReportForm(@ModelAttribute ResVO resVO) {
				if(session.getAttribute("ID") != null) {
					mav.addObject("resVO", resVO);
					mav.setViewName("resReportForm");
				}else {
					mav.setViewName("redirect:/");
				}
				return mav;
			}
		// 신고처리	
			@RequestMapping(value = "/resReportAccept", method = RequestMethod.POST)
			public ModelAndView resReportAccept(@ModelAttribute ResReportVO resReportVO) {
				if(session.getAttribute("ID") != null) {
					mav = as.resReportAccept(resReportVO);
				}else {
					mav.setViewName("redirect:/");
				}
				return mav;
			}
		// 신고 리스트
		@RequestMapping(value = "/resReportList", method = RequestMethod.GET)
		public ModelAndView resReportList(@ModelAttribute ResReportVO resReportVO) {
			if((int)session.getAttribute("WHO") == 2) {
				mav = as.resReportList(resReportVO);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
	
	// 리뷰신고관리
		@RequestMapping(value = "/reviewReportList", method = RequestMethod.GET)
		public ModelAndView reviewReportList(@ModelAttribute ReviewVO reviewVO) {
			if((int)session.getAttribute("WHO") == 2) {
				mav = as.reviewReportList(reviewVO);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		
		@RequestMapping(value = "/resDelList", method = RequestMethod.GET)
		public ModelAndView resDelList() {
			if((int)session.getAttribute("WHO") == 2) {
				mav = as.resDelList();
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		//어드민 페이지
		@RequestMapping(value = "/adminPage", method = RequestMethod.GET)
		public String testnew() {
			if(session.getAttribute("ID") != null) {
				return "adminPage";
			}
			return "redirect:/";
		}
		
		//
		@RequestMapping(value="adnoticeList", method = RequestMethod.GET)
		public ModelAndView adnoticeList(HttpServletRequest request) {
			if(session.getAttribute("ID") != null) {
				String NTITLE="";
				if(request.getParameter("NTITLE") != null) {
					NTITLE = request.getParameter("NTITLE");
				}
				int page = Integer.parseInt(request.getParameter("page"));
				mav = ns.adnoticeList(NTITLE,page);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		@RequestMapping(value = "adnoticeDetail", method = RequestMethod.GET)
		public ModelAndView adnoticeDetail(@RequestParam("NNUM") int NNUM) {
			if(session.getAttribute("ID") != null) {
				mav = ns.adnoticeDetail(NNUM);
			}else {
				mav.setViewName("redirect:/");
			}
			
			return mav;
		}
		@RequestMapping(value = "adqnaList", method = RequestMethod.GET)
		public ModelAndView adqnaList(@RequestParam("page") int page, HttpSession session) {
			if(session.getAttribute("ID") != null) {
				mav = qs.adqnaList(page);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		@RequestMapping(value = "adqnadetail", method = RequestMethod.GET)
		public ModelAndView adqnadetail(@RequestParam("QNUM") int QNUM) {
			if(session.getAttribute("ID") != null) {
				mav = qs.adqnadetail(QNUM);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
}
