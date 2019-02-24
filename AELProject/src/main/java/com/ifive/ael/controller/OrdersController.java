package com.ifive.ael.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.service.OrdersService;

@Controller
public class OrdersController {
	
	@Autowired
	private OrdersService os;
	
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private HttpSession session;
	
	// 2/7
	
	@RequestMapping(value = "/ordersList", method = RequestMethod.GET)
	public ModelAndView ordersList() {
		if(session.getAttribute("ID") != null) {
			mav = os.ordersList((String)session.getAttribute("ID"));
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/ordersDetail", method = RequestMethod.GET)
	public ModelAndView ordersDetail(@RequestParam("ONUM") String ONUM) {
		if(session.getAttribute("ID") != null) {
			mav = os.ordersDetail(ONUM);
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/ordersRe", method = RequestMethod.GET)
	public ModelAndView ordersRe(@RequestParam("ONUM") String ONUM) {
		if(session.getAttribute("ID") != null) {
			mav = os.ordersRe(ONUM);
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
	@RequestMapping(value = "/ordersPer", method = RequestMethod.GET)
	public ModelAndView ordersPer(@RequestParam("ONUM") String ONUM,@RequestParam("time") int time) {
		if(session.getAttribute("ID") != null) {
			mav = os.ordersPer(ONUM, time);
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
}
