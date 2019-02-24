package com.ifive.ael.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.service.JusoService;
import com.ifive.ael.service.MemberService;
import com.ifive.ael.service.ResService;
import com.ifive.ael.vo.JusoVO;
import com.ifive.ael.vo.MemberVO;
import com.ifive.ael.vo.ResVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;

	@Autowired
	private ResService rs;

	@Autowired
	private JusoService js;

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private HttpSession session;
	
	// 디자인 추가 부분
	@RequestMapping(value = "Page", method = RequestMethod.GET)
	public ModelAndView Page() {
		mav = ms.memberView((String)session.getAttribute("ID"));
		return mav;
	}
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		if(session.getAttribute("ID") == null) {
		return "memberLogin";
		}
		return "redirect:/";
	}
	
	
	// 01.28 수정
	// 시작시 로그인창 띄움
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		if(session.getAttribute("ID") != null) {
			return "main";
		}
		return "main";
	}
	// 01.28 추가
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		if(session.getAttribute("ID") != null) {
			return "main";	
		}
		return "redirect:/";
	}
	
	// 회원가입 페이지 호출
	@RequestMapping(value = "/memberJoinForm", method = RequestMethod.GET)
	public String memberJoin() {
		if(session.getAttribute("ID") == null) {
			return "memberJoin";	
		}
		return "redirect:/";
	}

	// 아이디 중복확인
	@RequestMapping(value = "/idOverlap", method = RequestMethod.POST)
	public void idOverlap(HttpServletResponse response, @RequestParam("id") String id) throws IOException {
		ms.idOverlap(id, response);
	}

	// 회원 로그인
	@RequestMapping(value = "/memberLogin", method = RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletResponse response, @ModelAttribute MemberVO memberVO)
			throws IOException {
		if(session.getAttribute("ID") == null) {
			mav = ms.memberLogin(memberVO, response);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}

	// 회원가입
	@RequestMapping(value = "/memberJoin", method = RequestMethod.POST)
	public ModelAndView memberJoin(@ModelAttribute MemberVO memberVO)throws Exception {
		if(session.getAttribute("ID") == null) {
			MultipartFile bFile = memberVO.getMImg();
			// 리뷰 이미지 밑 경로로 업로드
			if (!bFile.isEmpty()) {
				String fileName = bFile.getOriginalFilename().replaceAll(" ", "");
				String fileLocation = "C:\\Users\\pc\\Documents\\workspace-sts-3.9.6.RELEASE\\AELProject\\src\\main\\webapp\\resources\\profileImg\\";
				//String fileLocation = "/Users/bro_x_x/Documents/workspace-sts-3.9.6.RELEASE/AelProject/src/main/webapp/resources/profileImg";
				bFile.transferTo(new File(fileLocation + fileName));
			}
			memberVO.setMEMBER_IMG(bFile.getOriginalFilename());
			mav = ms.memberJoin(memberVO);
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}

	// 로그아웃 01.28 수정
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void memberLogout(HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		session.invalidate();
		out.println("<script>alert('로그아웃 되었습니다.');location='http://192.168.0.27/ael/';</script>");
		out.close();
	}

	

	// 주소등록 폼으로
	@RequestMapping(value = "/jusoForm", method = RequestMethod.GET)
	public String jusoForm() {
		if(session.getAttribute("ID") != null) {
			return "jusoForm";
		}
		return "redirect:/";
	}

	// 주소등록 버튼 누를시 주소등록
	@RequestMapping(value = "/juso", method = RequestMethod.POST)
	public ModelAndView juso(@ModelAttribute JusoVO jusoVO) {
		if(session.getAttribute("ID") != null) {
			mav = js.juso(jusoVO);
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}

	// 내 주소 리스트를 불러와줌
	@RequestMapping(value = "/jusoList", method = RequestMethod.GET)
	public ModelAndView jusoList() {
		if(session.getAttribute("ID") != null) {
			mav = js.jusoList((String)session.getAttribute("ID"));
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}

	// 대표주소로 설정 버튼 누를시
	@RequestMapping(value = "/mainjuso", method = RequestMethod.GET)
	public ModelAndView mainjuso(@RequestParam("JTOTALADDR") String JTOTALADDR) {
		if(session.getAttribute("ID") != null) {
			mav = js.mainjuso(JTOTALADDR, (String) session.getAttribute("ID"));
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}

	// 주소 중복체크
	@RequestMapping(value = "/jusocheck", method = RequestMethod.POST)
	public void jusocheck(HttpServletResponse response, @ModelAttribute JusoVO jusoVO) throws IOException {
		js.jusocheck(jusoVO, response);
	}

	@RequestMapping(value = "/createKey", method = RequestMethod.POST) // get방식으로 넘겨 받는다.
	@ResponseBody
	public String createKey(@RequestParam("EMAIL") String email) { //
		System.out.println("createKey 메소드 호출");
		String key = "";
		do {
			key = ms.createKey(30, false);
		} while (ms.overKey(key));
		String title = "iFive 메일 인증";
		ms.mailSending(email, title, key);
		return key;
	}

	@RequestMapping(value = "/checkKey", method = RequestMethod.POST) // get방식으로 넘겨 받는다.
	@ResponseBody
	public String checkKey(@RequestParam("key") String key) { //
		System.out.println("checkKey 메소드 호출");
		String result = ms.checkKey(key);
		return result;
	}
	@RequestMapping(value = "/pwchangeForm", method = RequestMethod.GET)
	public ModelAndView pwchange(){
		if(session.getAttribute("ID") != null) {
			mav = ms.pwchange((String) session.getAttribute("ID"));
		}else {
			mav.setViewName("redirect:/");
		}
		
		return mav;
	}
	//로그인 유무 확인
	@RequestMapping(value = "/pwchange", method = RequestMethod.POST)
	public ModelAndView pwchange2(@ModelAttribute MemberVO memberVO) throws IOException{
		if(session.getAttribute("ID") != null) {
			mav = ms.pwchange2(memberVO);
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	@RequestMapping(value = "/memberByeForm", method = RequestMethod.GET)
	public ModelAndView memberByeForm(){
		if(session.getAttribute("ID") != null) {
			mav = ms.memberByeForm((String) session.getAttribute("ID"));
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	@RequestMapping(value = "/memberBye", method = RequestMethod.GET)
	public ModelAndView memberBye() {
		if(session.getAttribute("ID") != null) {
			mav = ms.memberBye((String) session.getAttribute("ID"));
			session.invalidate();
		}else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	

}
