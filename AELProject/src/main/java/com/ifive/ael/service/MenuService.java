package com.ifive.ael.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.dao.MenuDAO;
import com.ifive.ael.vo.BasketVO;
import com.ifive.ael.vo.MenuVO;

@Service
public class MenuService {
	
	@Autowired
	private MenuDAO menuDAO;
	private ModelAndView mav;
	
	
	public ModelAndView menuAdd(MenuVO menuVO) {		
		mav = new ModelAndView();
		if(menuVO.getMIMG() == null || menuVO.getMIMG().equals("") ) {
	         menuVO.setMIMG("defalutMenuprofile.png");
	      }
		menuDAO.menuAdd(menuVO);
		mav.setViewName("main");
		return mav;
	}

	public ModelAndView menuModifyForm(MenuVO menuVO) {
		mav = new ModelAndView();
		MenuVO menuModifyForm = menuDAO.menuModifyForm(menuVO);
		mav.addObject("menuModifyForm", menuModifyForm);
		mav.setViewName("menuModify");
		return mav;
	}

	public ModelAndView menuAdmin(String rBNUM) {
		mav = new ModelAndView();
		List<MenuVO> list = menuDAO.menuAdmin(rBNUM);
		//MenuVO menuAdmin = menuDAO.menuAdmin(menuVO);
		mav.addObject("menuAdmin", list);
		mav.setViewName("menuAdmin");
		return mav;
	}

	public ModelAndView menuModify(MenuVO menuVO) {
		mav = new ModelAndView();
		menuDAO.menuModify(menuVO);
		mav.setViewName("redirect:/menuAdmin?RBNUM="+menuVO.getRBNUM());
		return mav;
	}

	public ModelAndView menuDelete(MenuVO menuVO) {
		mav = new ModelAndView();
		menuDAO.menuDelete(menuVO);
		mav.setViewName("redirect:/menuAdmin?RBNUM="+menuVO.getRBNUM());
		return mav;
	}
}
