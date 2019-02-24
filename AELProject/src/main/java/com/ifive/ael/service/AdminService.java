package com.ifive.ael.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.dao.*;
import com.ifive.ael.vo.*;


//@@@@@ 새로운 파일 1/29 @@@@@
@Service
public class AdminService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	@Autowired
	private ResDAO resDAO;
	
	@Autowired
	private ResReportDAO resReportDAO;
	
	private ModelAndView mav;
	
	// @@  수정 @@ 
		public ModelAndView resReportList(ResReportVO resReportVO) {
			mav = new ModelAndView();
			System.out.println(resReportVO.toString());
			List<ResReportVO> list = resReportDAO.resReportList(resReportVO);
			mav.addObject("resReportList", list);
			mav.setViewName("resReportList");
			return mav;
		}

	public ModelAndView reviewReportList(ReviewVO reviewVO) {
		mav = new ModelAndView();
		List<ReviewVO> rvlist = reviewDAO.reviewReportList(reviewVO);
		mav.addObject("reviewReportList", rvlist);
		mav.setViewName("reviewReportList");
		return mav;
	}
	// @@ 1/31 @@
		public ModelAndView resReportAccept(ResReportVO resReportVO) {
			mav = new ModelAndView();  
			ResReportVO resReportAccept = new ResReportVO();
			resReportDAO.resReportAccept(resReportVO);
			mav.addObject("resReportAccept",resReportAccept);
			mav.setViewName("main");
			return mav;
		}

		public ModelAndView resDelList() {
			mav = new ModelAndView();
			List<ResVO> resDelList = resDAO.resDelList();
			mav.addObject("resDelList", resDelList);
			mav.setViewName("resadDel");
			return mav;
		}	
}
