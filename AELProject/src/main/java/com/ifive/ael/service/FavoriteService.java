package com.ifive.ael.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.dao.FavoriteDAO;
import com.ifive.ael.dao.OrdersDAO;
import com.ifive.ael.dao.ResDAO;
import com.ifive.ael.vo.FavoriteVO;
import com.ifive.ael.vo.ResVO;

@Service
public class FavoriteService {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private FavoriteDAO favDAO;
	
	@Autowired
	private ResDAO resDAO;
	
	@Autowired
	private OrdersDAO ordersDAO;
	private ModelAndView mav;

	public String favoriteIn(FavoriteVO favVO) {
		int result = favDAO.favoriteIn(favVO);
		if(result == 2) {
			favDAO.favDel(favVO.getRBNUM());
		}
		return String.valueOf(result);
	}

	public ModelAndView myFav(String ID) {
		mav = new ModelAndView();
		List<FavoriteVO> favlist = favDAO.myFav(ID);
		List<ResVO> reslist = resDAO.resList();
		mav.addObject("favlist", favlist);
		mav.addObject("reslist", reslist);
		mav.setViewName("myFav");
		
		return mav;
	}

	public ModelAndView favDel(String rBNUM) {
		mav = new ModelAndView();
		System.out.println(rBNUM);
		int result = 0;
		result = favDAO.favDel(rBNUM);
		System.out.println(result);
		if (result 	== 0) {
			mav.setViewName("myFav");
			System.out.println("삭제 실패");
		} else {
			mav.setViewName("main");
		}
		return mav;
	}

}
