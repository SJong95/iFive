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

import com.ifive.ael.service.JusoService;
import com.ifive.ael.vo.*;



@Controller
public class JusoController {
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private JusoService js;
	
	@Autowired
	private HttpSession session;
	
	/* 추가 부분 */
	// 회원위치정보
	@RequestMapping(value = "/myLocation", method = RequestMethod.GET)
	public ModelAndView myLocation() { // 회원 위치 정보 컨트롤러
		if(session.getAttribute("ID") != null) { // 로그인 유무 체크
			mav = js.myLocation((String)session.getAttribute("ID"));
			// JusoService로 session에 있는 ID 값을 넘긴다.
		}else { // 로그인이 안되어 있을 경우 Home으로 보낸다.
			mav.setViewName("redirect:/");
		}
		return mav;
	}
		
	// 음식점 위치정보
	@RequestMapping(value="/resList",method=RequestMethod.POST)
	@ResponseBody
	public List<ResVO> resList() { // 음식점 위치 정보 컨트롤러
		System.out.println("resList 메소드 호출");		
		return js.resList();
	}
	
	@RequestMapping(value = "/resDe", method = RequestMethod.GET)
	public ModelAndView resDe(HttpServletRequest request) {
		if(session.getAttribute("ID") != null) {
			mav = js.resJusoCha(request.getParameter("JTOTALADDR"));
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	//주소 삭제(새로 추가)
		@RequestMapping(value = "/jusoDel", method = RequestMethod.GET)
		public ModelAndView jusoDel(@RequestParam("JTOTALADDR") String JTOTALADDR) {
			mav = js.jusoDel(JTOTALADDR, (String) session.getAttribute("ID"));
			return mav;
		}
	
}
