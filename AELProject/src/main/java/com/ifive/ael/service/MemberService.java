package com.ifive.ael.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

/* 자바 메일 import */
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.dao.JusoDAO;
import com.ifive.ael.dao.MemberDAO;
import com.ifive.ael.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;

	private ModelAndView mav;

	private MemberVO memberVO;
	@Autowired
	private JusoDAO jusoDAO;
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private HttpSession session;

	public void idOverlap(String id, HttpServletResponse response) throws IOException {
		memberVO = new MemberVO();
		memberVO = memberDAO.idOverlap(id);
		System.out.println(id + "서비스");
		if (memberVO == null) { // 해당아이디로 조회가 안되야 아이디를 쓸수있음(주의) 널일때가성공임.
			response.getWriter().print("1");
		} else {
			response.getWriter().print("0");
		}
	}
	/* 01.28 수정 */
	public ModelAndView memberLogin(MemberVO memberVO, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		mav = new ModelAndView();
		MemberVO mVO = memberDAO.memberLogin(memberVO);
		String juso = jusoDAO.jusoSel(memberVO.getID());
		// MIMG 부분 추가 (1.28)
		// PW부분 추가
		if (mVO != null) {
			session.setAttribute("JUSO", juso);
			session.setAttribute("WHO", mVO.getWHO());
			session.setAttribute("ID", mVO.getID());
			session.setAttribute("MIMG", mVO.getMEMBER_IMG());
			session.setMaxInactiveInterval(3600);
			mav.setViewName("redirect:/");
		} else {
			out.println("<script>");
			out.println("alert('아이디 또는 비밀번호가 틀립니다.')");
			out.println("history.go(-1);</script>");
			out.close();
		}
		return mav;
	}

	public ModelAndView memberJoin(MemberVO memberVO) {
		mav = new ModelAndView();
		if(memberVO.getMEMBER_IMG() == null || memberVO.getMEMBER_IMG().equals("") ) {
			memberVO.setMEMBER_IMG("defalutprofile8888.jpg");
		}
		int result = memberDAO.memberJoin(memberVO);
		if (result == 0) {
			mav.setViewName("JoinForm");
		} else {
			// 회원가입 성공
			mav.setViewName("memberLogin");
		}
		return mav;
	}

	public ModelAndView memberView(String ID) {
		mav = new ModelAndView();
		MemberVO viewMember = memberDAO.memberView(ID);
		mav.addObject("viewMember1", viewMember);
		mav.setViewName("Page");
		return mav;
	}

	public boolean overKey(String key) {
		int result = memberDAO.overKey(key);
		if (result == 0) {
			return true;
		}
		return false;
	}

	public void mailSending(String tomail, String title, String key) {
		String setfrom = "ektltlwkr159@gmail.com";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(key); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public String checkKey(String key) {
		String selKey = memberDAO.checkKey(key);
		if (selKey != null) {
			return "1";
		}
		return "0";
	}

	public String createKey(int size, boolean lowerCheck) {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	//02.01
		public ModelAndView pwchange(String ID){
			mav = new ModelAndView();
			MemberVO pwchange = memberDAO.memberView(ID);
			mav.addObject("pwchange", pwchange);
			mav.setViewName("pwchange");
			return mav;
		}
		public ModelAndView pwchange2(MemberVO memberVO){
			mav = new ModelAndView();
			int result = memberDAO.pwchange2(memberVO);
			if (result == 0) {
				mav.setViewName("pwchange");
			} else {
				mav.setViewName("main");
			}
			return mav;
		}
		public ModelAndView memberByeForm(String ID){
			mav = new ModelAndView();
			MemberVO memberbye = memberDAO.memberView(ID);
			mav.addObject("memberbye", memberbye);
			mav.setViewName("memberBye");
			return mav;
		}
		public ModelAndView memberBye(String ID){
			mav = new ModelAndView();
			int result = memberDAO.memberBye(ID);
			if(result == 1) {
				mav.setViewName("memberLogin");
			}else {
				mav.setViewName("memberBye");
			}
			return mav;
		}
	
}
