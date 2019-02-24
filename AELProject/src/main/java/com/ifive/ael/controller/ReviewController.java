package com.ifive.ael.controller;
import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.ifive.ael.service.ReviewService;
import com.ifive.ael.vo.ReviewReVO;
import com.ifive.ael.vo.ReviewVO;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService rs;
	
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private HttpSession session;
	
	
	// 2.7수정
		@RequestMapping(value = "/rWriteForm", method = RequestMethod.GET)
		public ModelAndView abc(@RequestParam("ID") String id, @RequestParam("RBNUM") String rbnum, @RequestParam("ONUM") String oNum, HttpServletResponse response) throws IOException {
			if(session.getAttribute("ID") != null) {
				mav = rs.reviewWriteCheck(id, rbnum, oNum ,response);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
	// 리뷰작성 수정 01.28
	@RequestMapping(value = "/reviewWrite", method = RequestMethod.POST)
	public ModelAndView reviewWrite(@ModelAttribute ReviewVO reviewVO) throws Exception {
		if(session.getAttribute("ID") != null) {
			MultipartFile bFile = reviewVO.getvImg();
			// 리뷰 이미지 밑 경로로 업로드
			if (!bFile.isEmpty()) {
				String fileName = bFile.getOriginalFilename();
				String fileLocation = "C:\\Users\\pc\\Documents\\workspace-sts-3.9.6.RELEASE\\AELProject\\src\\main\\webapp\\resources\\images\\";
				bFile.transferTo(new File(fileLocation + fileName));
			}
			reviewVO.setvImgName(bFile.getOriginalFilename());
			mav = rs.reviewWrite(reviewVO);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// 리뷰목록
	@RequestMapping(value = "/reviewMain", method = RequestMethod.GET)
	public ModelAndView reviewList(@RequestParam("rbNum") String rbNum) {
		if(session.getAttribute("ID") != null) {
			mav = rs.reviewList(rbNum);
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
	
	// 리뷰신고
	@RequestMapping(value = "/reviewReport", method = RequestMethod.GET)
	public ModelAndView reviewReport(HttpServletResponse response, @RequestParam("rbNum") String rbNum, @RequestParam("id") String id, @RequestParam("vNum") int vNum)throws Exception {
		if(session.getAttribute("ID") != null) {
			mav = rs.reviewReport(rbNum, id, vNum, response);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// 리뷰답글
	@RequestMapping(value = "/reviewRe", method = RequestMethod.POST)
	public ModelAndView reviewRe(@ModelAttribute ReviewReVO reviewReVO) {
		if(session.getAttribute("ID") != null) {
			mav = rs.reviewRe(reviewReVO);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	// @@@@@@ 추가 내용 1/29 @@@@@@
	@RequestMapping(value = "/reviewAdminDelete", method = RequestMethod.GET)
	public ModelAndView reviewAdminDelete(@ModelAttribute ReviewVO reviewVO) {
		if(session.getAttribute("ID") != null) {
			mav = rs.reviewAdminDelete(reviewVO);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	//02.01
	@RequestMapping(value = "/reviewPhoto", method = RequestMethod.GET)
	public ModelAndView reviewPhoto(@RequestParam("rbNum") String rbNum) {
		if(session.getAttribute("ID") != null) {
			mav = rs.reviewPhoto(rbNum);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	@RequestMapping(value = "/reviewMember", method = RequestMethod.GET)
	public ModelAndView reviewMember(HttpServletResponse response, @RequestParam("rbNum") String rbNum, @RequestParam("id") String id) {
		if(session.getAttribute("ID") != null) {
			mav = rs.reviewMember(rbNum, id, response);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
}
