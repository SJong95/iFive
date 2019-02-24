package com.ifive.ael.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.dao.*;
import com.ifive.ael.vo.*;

@Service
public class BasketService {
	
	@Autowired
	private BasketDAO basDAO;
	@Autowired
	private ResDAO resDAO;
	@Autowired
	private OrdersDAO ordersDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private JusoDAO jusoDAO;
	private ModelAndView mav;
	
	public BasketVO basketIn(BasketVO basVO) {
	      basVO.setBAMOUNT(1);
	      return basDAO.basketIn(basVO);
	}

	public ModelAndView myBas(String ID) {
		mav = new ModelAndView();
		List<BasketVO> basList = basDAO.myBas(ID);
		List<ResVO> resList = resDAO.resList();
		mav.addObject("basList",basList);
		mav.addObject("resList",resList);
		mav.setViewName("myBas");
		return mav;
	}

	public String amountModify(BasketVO basVO, int admi) {
		String result="0";
		if(admi == 1) {
			result = String.valueOf(basDAO.amountAdd(basVO));
		}else if(admi == -1) {
			result = String.valueOf(basDAO.amountMinu(basVO));
		}
		return result;
	}

	public String basketCancle(BasketVO basVO) {
		return String.valueOf(basDAO.basketCancle(basVO));
	}

	public List<BasketVO> payList(BasketVO basVO) {
		
		return basDAO.payList(basVO);
	}

	public String payOrders(OrdersVO ordersVO, int point) { // 결제 완료시 실행
		List<OrdersVO> payList = basDAO.payOrders(ordersVO);
		for(int i=0;i<payList.size();i++) {
			System.out.println(payList.get(i).toString());
		}
		int result = 0;
		int total = 0;
		for(int i=0;i<payList.size();i++) {
			OrdersVO chaOrders = changeVO(payList.get(i), ordersVO);
			result = ordersDAO.ordersIn(chaOrders);
			total+=chaOrders.getORPRICE()*chaOrders.getOAMOUNT();
		}

		if(result!=0) {
			result = basDAO.basketDel(ordersVO);
			if(point == 0) {
				memberDAO.pointAdd(new MemberVO(ordersVO.getID(),(int)(total*0.02)));	
			}
			memberDAO.pointMin(new MemberVO(ordersVO.getID(),point));
		}
		return String.valueOf(result);
	}
	private OrdersVO changeVO(OrdersVO ordersVO, OrdersVO oldOrders) {
		ordersVO.setONUM("-");
		ordersVO.setOCHOICE(oldOrders.getOCHOICE());
		ordersVO.setOJTOTALADDR(oldOrders.getOJTOTALADDR());
		ordersVO.setOCALL(oldOrders.getOCALL());
		ordersVO.setOSTATUS("주문 접수 중");
		ordersVO.setOPAY("카카오 페이");
		return ordersVO;
		
	}

	public ModelAndView payForm(String ID,String RBNUM) { // 결제 폼으로 이동 시
		mav=new ModelAndView();
		MemberVO memberVO = memberDAO.idOverlap(ID);
		List<BasketVO> basList = basDAO.payList(new BasketVO(RBNUM,ID));
		ResVO resVO = resDAO.resDetail(RBNUM);
		int total =0;
		for(int i=0;i<basList.size();i++) {
			total += basList.get(i).getBPRICE()*basList.get(i).getBAMOUNT();
		}
		JusoVO jusoVO = jusoDAO.myLocation(ID);
		mav.addObject("memberVO",memberVO);
		mav.addObject("basList",basList);
		mav.addObject("resVO",resVO);
		mav.addObject("jusoVO",jusoVO);
		mav.addObject("total",total);
		mav.setViewName("myPay");
		return mav;
	}
	
}
