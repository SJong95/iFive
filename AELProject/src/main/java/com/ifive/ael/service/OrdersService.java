package com.ifive.ael.service;

import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.dao.*;
import com.ifive.ael.vo.*;

@Service
public class OrdersService {

	@Autowired
	private OrdersDAO ordersDAO;
	
	@Autowired
	private BasketDAO basDAO;

	private ModelAndView mav;

	public ModelAndView ordersList(String ID) {

		List<OrdersVO> ordersList = ordersDAO.ordersList(ID);

		mav = new ModelAndView();
		mav.addObject("ordersList", ordersList);
		mav.setViewName("ordersList");
		return mav;
	}

	public ModelAndView ordersDetail(String oNUM) {
		List<OrdersVO> ordersDetail = ordersDAO.ordersDetail(oNUM);
		for (int i = 0; i < ordersDetail.size(); i++) {
			// ordersDetail.get(i).setOTIME(ordersDetail.get(i).getODATE());
		}
		mav = new ModelAndView();
		mav.addObject("ordersDetail", ordersDetail);
		mav.setViewName("ordersDetail");
		return mav;
	}

	public ModelAndView ordersRe(String ONUM) { // 재주문
		// 기존 주문내역 selectList
		List<OrdersVO> ordersRe = ordersDAO.ordersRe(ONUM);
		// 장바구니 테이블로 insert
		for (int i = 0; i < ordersRe.size(); i++) {
			if(ordersDAO.isBas(ordersRe.get(i)) != null) {
				basDAO.basketDel(ordersRe.get(i));
			}
			ordersDAO.basketRe(ordersRe.get(i));
		}
		mav = new ModelAndView();
		mav.addObject("ID", ordersRe.get(0).getID());
		mav.addObject("RBNUM", ordersRe.get(0).getRBNUM());
		mav.setViewName("redirect:/payForm");
		return mav;
	}

	public ModelAndView ordersPer(String ONUM, int time) {
		ordersTimer(ONUM, time);
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setONUM(ONUM);
		ordersVO.setOAMOUNT(time);
		ordersVO.setRBNUM(ordersDAO.orderSelbnum(ONUM));
		ordersDAO.ordersWait(ordersVO);
		mav = new ModelAndView();
		mav.setViewName("redirect:/resOrders?RBNUM="+ordersVO.getRBNUM());
		return mav;
	}

	private void ordersTimer(String ONUM, int time) {
		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setONUM(ONUM);
		String status = ordersDAO.ordersStatus(ONUM);
		int chaTime = 0;
		Timer timer = new Timer();
		if (ONUM.substring(0, 1).equals("D")) { // 배달
			if (status.equals("주문 접수 중")) {
				chaTime = 0;
				ordersVO.setOSTATUS("접수 완료");
			} else if (status.equals("접수 완료")) {
				chaTime = 1;
				ordersVO.setOSTATUS("조리 중");
			} else if (status.equals("조리 중")) {
				chaTime = time / 2 - 2;
				ordersVO.setOSTATUS("배달 시작");
			} else if (status.equals("배달 시작")) {
				chaTime = 1;
				ordersVO.setOSTATUS("배달 중");
			} else if (status.equals("배달 중")) {
				chaTime = time / 2 - 1;
				ordersVO.setOSTATUS("배달 완료");
			}
			TimerTask timeTask = new TimerTask() {
				@Override
				public void run() {
					ordersDAO.ordersPer(ordersVO);
					ordersTimer(ONUM, time);
				}
			};
			if (!status.equals("배달 완료")) {
				timer.schedule(timeTask, chaTime * 60 * 1000);
			}
		} else if (ONUM.substring(0, 1).equals("V")) { // 방문 예약
			if (status.equals("주문 접수 중")) {
				chaTime = 0;
				ordersVO.setOSTATUS("접수 완료");
			} else if (status.equals("접수 완료")) {
				chaTime = 1;
				ordersVO.setOSTATUS("조리 중");
			} else if (status.equals("조리 중")) {
				chaTime = time - 3;
				ordersVO.setOSTATUS("조리 완료");
			} else if (status.equals("조리 완료")) {
				chaTime = 1;
				ordersVO.setOSTATUS("방문 완료");
			}
			TimerTask timeTask = new TimerTask() {
				@Override
				public void run() {
					ordersDAO.ordersPer(ordersVO);
					ordersTimer(ONUM, time);
				}
			};
			if (!status.equals("방문 완료")) {
				timer.schedule(timeTask, chaTime * 60 * 1000);
			}
		} else if (ONUM.substring(0, 1).equals("T")) { // 방문 포장
			if (status.equals("주문 접수 중")) {
				chaTime = 0;
				ordersVO.setOSTATUS("접수 완료");
			} else if (status.equals("접수 완료")) {
				chaTime = 1;
				ordersVO.setOSTATUS("조리 중");
			} else if (status.equals("조리 중")) {
				chaTime = time - 13;
				ordersVO.setOSTATUS("포장 중");
			} else if (status.equals("포장 중")) {
				chaTime = 10;
				ordersVO.setOSTATUS("포장 완료");
			} else if (status.equals("포장 완료")) {
				chaTime = 1;
				ordersVO.setOSTATUS("픽업 완료");
			}
			TimerTask timeTask = new TimerTask() {
				@Override
				public void run() {
					ordersDAO.ordersPer(ordersVO);
					ordersTimer(ONUM, time);
				}
			};
			if (!status.equals("픽업 완료")) {
				timer.schedule(timeTask, chaTime * 60 * 1000);
			}
		}
	}
}
