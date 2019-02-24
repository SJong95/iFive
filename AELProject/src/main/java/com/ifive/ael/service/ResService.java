package com.ifive.ael.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.dao.FavoriteDAO;
import com.ifive.ael.dao.MenuDAO;
import com.ifive.ael.dao.ResDAO;
import com.ifive.ael.dao.ReviewDAO;
import com.ifive.ael.vo.*;

@Service
public class ResService {

	@Autowired
	private ResDAO resDAO;
	@Autowired
	private MenuDAO menuDAO;
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private FavoriteDAO favDAO;
	private ModelAndView mav;
	
	@Autowired
	private HttpSession session;
	
	//매장 정보 등록 메소드.
	public ModelAndView resinsert(ResVO resVO) {
		mav = new ModelAndView();
		resVO.setRADDR();
		if(resVO.getRES_IMG()== null || resVO.getRES_IMG().equals("") ) {
			resVO.setRES_IMG("defalutResprofile.png");
	    }
		System.out.println(resVO.toString());
		int result = resDAO.resinsert(resVO);
		mav.setViewName("main");

		return mav;
	}
	public ModelAndView resView(String ID) {
		mav = new ModelAndView();
		List<ResVO> resList = resDAO.myResList(ID);
		mav.addObject("resList", resList);
		mav.setViewName("resManage");
		return mav;
	}
	public ModelAndView resadList() {
		mav = new ModelAndView();
		List<ResVO> list = resDAO.resadList();
		mav.addObject("resadList", list);
		mav.setViewName("resadList");
		return mav;
	}
	public ModelAndView resadView(String ID) {
		mav = new ModelAndView();
		ResVO viewRes = resDAO.resadView(ID);
		mav.addObject("viewres", viewRes);
		mav.setViewName("resadView");
		return mav;
	}
	public ModelAndView resyes(String RBNUM) {
		mav = new ModelAndView();
		int result = resDAO.resyes(RBNUM);
		if(result == 0) {
			mav.setViewName("redirect:/resadList");
		} else {
			mav.setViewName("redirect:/resadList");
		}
		return mav;
	}
	public ModelAndView resModify(ResVO resVO) {
		mav = new ModelAndView();
		resVO.setRADDR();
		resDAO.resModify(resVO);
		mav.setViewName("main");
		return mav;
	}
	public ModelAndView resModifyForm(ResVO resVO) {
		mav = new ModelAndView();
		ResVO resModifyForm = resDAO.resModifyForm(resVO);
		mav.addObject("resModifyForm", resModifyForm);
		mav.setViewName("resModify");
		return mav;
	}
	/*01.28 추가*/
	public ModelAndView resDetail(String rbnum) {
		mav = new ModelAndView();
		List<ReviewVO> reviewList = reviewDAO.reviewList(rbnum);
		List<ReviewReVO> reviewReList = reviewDAO.reviewReList(rbnum);
		ReviewVO reviewVO= reviewDAO.reviewDetail(1);
		
		mav.addObject("reviewReList", reviewReList);
		mav.addObject("reviewDetail", reviewVO);
		mav.addObject("reviewList", reviewList);
		ResVO resSel = resDAO.resDetail(rbnum);
		List<MenuVO> menuList = menuDAO.resMenu(rbnum);
		mav.addObject("resInfo",resSel);
		mav.addObject("menuList",menuList);
		mav.setViewName("resDetail");
		return mav;
	}
	// @@@@@@ 추가 내용 1/29 @@@@@@
	
		public ModelAndView resAdminDelete(ResVO resVO) {
			mav = new ModelAndView();
			resDAO.resAdminDelete(resVO);
			mav.setViewName("redirect:/resReportList");
			return mav;
		}
		//02.01
		public ModelAndView resno(ResVO resVO) {
			mav = new ModelAndView();
			int result = resDAO.resno(resVO);
			if(result == 0) {
				mav.setViewName("redirect:/resadList");
			} else {
				mav.setViewName("redirect:/resadList");
			}
			return mav;
		}
		public ModelAndView resList(String RCATE, String ID) {
			mav = new ModelAndView();
			List<ResVO> resList = resDAO.resList(RCATE);
			List<FavoriteVO> favList = favDAO.favList(ID);			
			mav.addObject("resList",resList);
			mav.addObject("favList",favList);
			mav.addObject("RCATE",RCATE);
			mav.setViewName("resList");
			return mav;
		}
		public ModelAndView resListSearch(String search, String ID) {// 음식점 검색 리스트
			mav = new ModelAndView();
			List<ResVO> resList = resDAO.resListSearch(search);
			// 음식점 리스트 검색
			List<FavoriteVO> favList = favDAO.favList(ID); // 즐겨찾기 정보 검색
			mav.addObject("resList",resList); // 음식점 리스트 정보 attribute로 저장
			mav.addObject("favList",favList); // 즐겨찾기 정보 attribute로 저장
			mav.addObject("search",search);   // 검색 정보 attribute로 저장
			mav.setViewName("resList");		  // 경로 설정
			return mav;
		}
		public ModelAndView resListAlign(String RCATE, String align, String ID) {
			mav = new ModelAndView();
			List<ResVO> resList = resDAO.resList(RCATE);
			if(align.equals("평점")) {
				resList = resDAO.resListAlignGrade(RCATE);
			}else if(align.equals("리뷰")) {
				resList = resDAO.resListAlignReview(RCATE);
			}else if(align.equals("주문")) {
				resList = resDAO.resListAlignOrders(RCATE);
			}
			List<FavoriteVO> favList = favDAO.favList(ID);			
			mav.addObject("resList",resList);
			mav.addObject("favList",favList);
			mav.addObject("RCATE",RCATE);
			mav.addObject("align",align);
			mav.setViewName("resList");
			return mav;
		}
		public ModelAndView resListSearchAlign(String search, String align, String ID) {
			mav = new ModelAndView();
			List<ResVO> resList = resDAO.resListSearch(search);
			if(align.equals("평점")) {
				resList = resDAO.resListSearchAlignGrade(search);
			}else if(align.equals("리뷰")) {
				resList = resDAO.resListSearchAlignReview(search);
			}else if(align.equals("주문")) {
				resList = resDAO.resListSearchAlignOrders(search);
			}
			List<FavoriteVO> favList = favDAO.favList(ID);			
			mav.addObject("resList",resList);
			mav.addObject("favList",favList);
			mav.addObject("search",search);
			mav.addObject("align",align);
			mav.setViewName("resList");
			return mav;
		}
		public ModelAndView resPer(String RBNUM) {
			mav = new ModelAndView();
			int result = resDAO.resPer(RBNUM);
			if(result == 0) {
				mav.setViewName("redirect:/resManage");
			} else {
				mav.setViewName("redirect:/main");
			}
			return mav;
		}
		public ModelAndView resDel(String RBNUM) {
			mav = new ModelAndView();
			int result = resDAO.resDel(RBNUM);
			if(result == 0) {
				mav.setViewName("redirect:/resManage");
			} else {
				mav.setViewName("redirect:/main");
			}
			return mav;
		}
		public ModelAndView resOrders(String RBNUM) {
			mav = new ModelAndView();
			List<OrdersVO> resOrders = resDAO.resOrders(RBNUM);
			mav.addObject("resOrders",resOrders);
			mav.setViewName("resOrders");
			return mav;
		}
		
		
	
}
