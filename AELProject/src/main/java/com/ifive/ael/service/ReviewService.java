package com.ifive.ael.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.dao.*;
import com.ifive.ael.vo.*;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ResDAO resDAO;
	@Autowired
	private MenuDAO menuDAO;
	
	private ModelAndView mav;

	private ReviewVO reviewVO;
	private ReviewReVO review_ReVO;

	@Autowired
	private HttpSession session;
	// 수정 햇음 01.28
	public ModelAndView reviewWrite(ReviewVO reviewVO) {
		mav = new ModelAndView();		
		int result = reviewDAO.reviewWrite(reviewVO);
		if (result == 1) {
			mav.setViewName("redirect:/resDetail?RBNUM="+reviewVO.getRbNum());
		} else {
			mav.setViewName("reviewWrite");
		}
		reviewDAO.updateGrade(reviewVO);
		return mav;
	}

	public ModelAndView reviewList(String rbNum) {

		List<ReviewVO> reviewList = reviewDAO.reviewList(rbNum);
		List<ReviewReVO> reviewReList = reviewDAO.reviewReList(rbNum);

		mav = new ModelAndView();
		mav.addObject("reviewReList", reviewReList);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("reviewMain");
		return mav;
	}
	//02.01
	public ModelAndView reviewReport(String rbNum, String id, int vNum, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		reviewVO = new ReviewVO();
		reviewVO.setRbNum(rbNum);
		reviewVO.setId(id);
		reviewVO.setvNum(vNum);
		ReviewVO reportID = reviewDAO.reportID(reviewVO);
		if (reportID == null) {
			reviewDAO.reviewReport(reviewVO);
			reviewDAO.reviewReportID(reviewVO);
			out.println("<script>");
			out.println("alert('신고 접수 되었습니다.')");
			out.println("history.go(-1);</script>");
//			out.println("</script>");
			out.close();
//			mav = new ModelAndView();
//			mav.setViewName("redirect:/resDetail?RBNUM=" + rbNum);
		} else {
			out.println("<script>");
			out.println("alert('이미 신고하신 글입니다.')");
			out.println("history.go(-1);</script>");
			out.close();
		}
		return mav;
	}

	public ModelAndView reviewReForm(String rbNum, int vNum) {
		mav = new ModelAndView();
		List<ReviewVO> reviewList = reviewDAO.reviewList(rbNum);
		List<ReviewReVO> reviewReList = reviewDAO.reviewReList(rbNum);
		reviewVO= reviewDAO.reviewDetail(vNum);
		
		mav.addObject("reviewReList", reviewReList);
		mav.addObject("reviewDetail", reviewVO);
		mav.addObject("reviewList", reviewList);
		mav.setViewName("reviewMain");
		return mav;
	}

	public ModelAndView reviewRe(ReviewReVO reviewReVO) {
		mav = new ModelAndView();
		int result = reviewDAO.reviewRe(reviewReVO);

		if (result == 1) {
			//mav = reviewList(reviewReVO.getRbNum());
			mav.setViewName("redirect:/resDetail?RBNUM="+reviewReVO.getRbNum());
		} else {
			mav.setViewName("reviewWrite");
		}
		return mav;
	}
	// @@@@ 1/29 추가 @@@@
	public ModelAndView reviewAdminDelete(ReviewVO reviewVO) {
		mav = new ModelAndView();
		reviewDAO.reviewAdminDelete(reviewVO);
		mav.setViewName("redirect:/reviewReportList");
		return mav;
	}
	//02.01
	public ModelAndView reviewPhoto(String rbnum) {
		mav = new ModelAndView();
		List<ReviewVO> reviewList = reviewDAO.reviewPhoto(rbnum);
		List<ReviewReVO> reviewReList = reviewDAO.reviewReList(rbnum);
		
		mav.addObject("reviewReList", reviewReList);
		mav.addObject("reviewList", reviewList);
		ResVO resSel = resDAO.resDetail(rbnum);
		List<MenuVO> menuList = menuDAO.resMenu(rbnum);
		mav.addObject("resInfo",resSel);
		mav.addObject("menuList",menuList);
		mav.setViewName("resDetail");
		return mav;
	}

	public ModelAndView reviewMember(String rbNum, String id, HttpServletResponse response) {
		mav = new ModelAndView();
		List<ReviewVO> reviewList = reviewDAO.reviewMember(id);
		List<ResVO> resList = resDAO.resList();
		mav.addObject("reviewList", reviewList);
		mav.addObject("resList", resList);
		mav.setViewName("reviewMember");
		return mav;
	}

	//02.07
	public ModelAndView reviewWriteCheck(String id, String rbnum, String oNum, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
	
		reviewVO = new ReviewVO();
		reviewVO.setId(id);
		reviewVO.setRbNum(rbnum);
		reviewVO.setoNum(oNum);
		
		ReviewVO writeIDCheck = reviewDAO.reviewWriteCheck(reviewVO);
		
		if (writeIDCheck == null) {
			mav = new ModelAndView();
			mav.addObject("rbnum",rbnum);
			mav.addObject("oNum",oNum);
			mav.setViewName("reviewWrite");
		} else {
			out.println("<script>");
			out.println("alert('이미 리뷰를 작성했습니다.')");
			out.println("history.go(-1);</script>");
			out.close();
		}
		return mav;

	}
}
