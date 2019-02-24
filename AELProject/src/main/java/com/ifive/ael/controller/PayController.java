package com.ifive.ael.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.service.BasketService;
import com.ifive.ael.service.JusoService;
import com.ifive.ael.vo.*;



@Controller
public class PayController {
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private BasketService bs;
	
	@Autowired
	private HttpSession session;
	
	
	// 음식점 주문정보
	@RequestMapping(value="/payList",method=RequestMethod.POST) // 
	@ResponseBody
	public List<BasketVO> payList(@ModelAttribute BasketVO basVO) { // 
		System.out.println("payList 메소드 호출");		
		return bs.payList(basVO);
	}
	// 결제완료 후 주문내역
	@RequestMapping(value="/payOrders",method=RequestMethod.POST) // 
	@ResponseBody
	public String payOrders(@ModelAttribute OrdersVO ordersVO, @RequestParam("USEPOINT") int point) { // 
		System.out.println("payOrders 메소드 호출");
		return bs.payOrders(ordersVO,point);
	}
	@RequestMapping(value = "/payForm",method=RequestMethod.POST)
	public ModelAndView payForm(HttpServletRequest request) {
		if(session.getAttribute("ID") != null) {
			mav = bs.payForm((String)session.getAttribute("ID"),request.getParameter("RBNUM"));
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;	
	}
	@RequestMapping(value = "/payForm",method=RequestMethod.GET)
	public ModelAndView payFormGet(HttpServletRequest request) {
		if(session.getAttribute("ID") != null) {
			mav = bs.payForm((String)session.getAttribute("ID"),request.getParameter("RBNUM"));
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;	
	}
	
	/* 추가 부분 */
	// 회원위치정보
	/*@RequestMapping(value = "/myLocation", method = RequestMethod.GET)
	public ModelAndView myLocation() {
		if(session.getAttribute("ID") != null) {
			mav = js.myLocation((String)session.getAttribute("ID"));
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
		
	}
		
	
	
	@RequestMapping(value = "/resDe", method = RequestMethod.GET)
	public ModelAndView resDe(HttpServletRequest request) {
		if(session.getAttribute("ID") != null) {
			JusoVO jusoVO = new JusoVO();
			jusoVO.setJTOTALADDR(request.getParameter("JTOTALADDR"));
			jusoVO.setJEXTRAADDR(request.getParameter("JEXTRAADDR"));
			System.out.println(jusoVO.toString());
			mav = js.resJusoCha(jusoVO);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}*/
	
}
