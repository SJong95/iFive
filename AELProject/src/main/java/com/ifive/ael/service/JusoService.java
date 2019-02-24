package com.ifive.ael.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.dao.JusoDAO;
import com.ifive.ael.vo.JusoVO;
import com.ifive.ael.vo.ResVO;

import oracle.net.aso.i;

@Service
public class JusoService {
	@Autowired
	private JusoDAO jusoDAO;

	private ModelAndView mav;

	@Autowired
	private HttpSession session;
	
	public ModelAndView juso(JusoVO jusoVO) {
		mav = new ModelAndView();
		String result1 = jusoDAO.jbestcheck(jusoVO);
		if (result1 == null) {
			jusoVO.setJBEST("1");
		} else {
			jusoVO.setJBEST("0");
		}
		jusoVO.setJTOTALADDR();
		int result = jusoDAO.juso(jusoVO);
		if (result == 0) {
			mav.setViewName("jusoForm");
		} else {
			String juso = jusoDAO.jusoSel(jusoVO.getID());
			session.setAttribute("JUSO", juso);
			mav.setViewName("redirect:/jusoList");
		}
		return mav;
	}

	public ModelAndView jusoList(String ID) {
		mav = new ModelAndView();
		List<JusoVO> list = jusoDAO.jusoList(ID);
		mav.addObject("jusoList", list);
		mav.setViewName("jusoList");
		return mav;
	}

	public ModelAndView mainjuso(String JTOTALADDR, String id) {
		mav = new ModelAndView();
		int result = 0;
		if (jusoDAO.mainjuso1(id) != 0) {
			if (jusoDAO.mainjuso2(JTOTALADDR, id) != 0) {
				result = jusoDAO.mainjuso3(id);
			}
		}else {
			jusoDAO.mainjuso2(JTOTALADDR, id);
		}
		if (result 	== 0) {
			String juso = jusoDAO.jusoSel(id);
			session.setAttribute("JUSO", juso);
			mav.setViewName("redirect:/jusoList");
		} else {
			String juso = jusoDAO.jusoSel(id);
			session.setAttribute("JUSO", juso);
			mav.setViewName("main");
		}
		return mav;
	}

	
	public void jusocheck(JusoVO jusoVO, HttpServletResponse response) throws IOException {
		jusoVO.setJTOTALADDR();
		jusoVO = jusoDAO.jusocheck1(jusoVO);
		if (jusoVO == null) {
			response.getWriter().print("1");
		} else {
			response.getWriter().print("0");
		}
	}
	
	
	public ModelAndView myLocation(String iD) { // 회원 위치 정보 서비스
		mav = new ModelAndView();
		JusoVO myJuso = jusoDAO.myLocation(iD);
			// DAO의 myLocation 메소드 호출
		if(myJuso == null) { // 받은 값이 없을경우
			System.out.println("등록된 주소 없음");
			// 서버에서만 확인 가능 유저는 페이지 이동이 안된다.
		}else {
			mav.addObject("myJuso",myJuso);
			// myJuso에 담은 값을 myJuso라는 이름의 attribute로 저장
			mav.setViewName("myLocation");
			// myLocation.jsp로 경로 설정
		}
		return mav;
	}

	public List<ResVO> resList() {
		return jusoDAO.resList();
		// DAO의 resList 메소드 호출
	}

	public ModelAndView resJusoCha(String JTOTALADDR) {
		mav = new ModelAndView();
		String rbnum = jusoDAO.resJusoCha(JTOTALADDR);
		mav.setViewName("redirect:/resDetail?RBNUM="+rbnum);
		return mav;
	}
	//새로추가
		public ModelAndView jusoDel(String JTOTALADDR, String id) {
			mav = new ModelAndView();
			int result = 0;
			result = jusoDAO.jusoDel(JTOTALADDR);
			if (result 	== 0) {
				mav.setViewName("jusoList");
				System.out.println("삭제 실패");
			} else {
				String juso = jusoDAO.jusoSel(id);
				session.setAttribute("JUSO", juso);
				mav.setViewName("main");
			}
			return mav;
		}

}
