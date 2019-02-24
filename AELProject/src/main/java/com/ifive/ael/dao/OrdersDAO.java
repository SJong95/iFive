package com.ifive.ael.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifive.ael.vo.*;

@Repository
public class OrdersDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public int ordersIn(OrdersVO ordersVO) {
		return sql.insert("Orders.ordersIn", ordersVO);
	}

	// 2/7
	public List<OrdersVO> ordersList(String ID) {
		return sql.selectList("Orders.ordersList", ID);
	}

	public List<OrdersVO> ordersDetail(String oNUM) {
		return sql.selectList("Orders.ordersDetail", oNUM);
	}

	public List<OrdersVO> ordersRe(String ONUM) {
		return sql.selectList("Orders.ordersRe", ONUM);
	}

	public void ordersPer(OrdersVO ordersVO) {
		sql.update("Orders.ordersPer", ordersVO);		
	}
	public String ordersStatus(String ONUM) {
		return sql.selectOne("Orders.ordersStatus",ONUM);
	}

	public void ordersWait(OrdersVO ordersVO) {
		sql.update("Orders.ordersWait",ordersVO);
		
	}
	public int basketRe(OrdersVO ordersVO) {
		return sql.insert("Orders.basketRe", ordersVO);
	}

	public List<OrdersVO> isBas(OrdersVO ordersVO) {
		return sql.selectList("Orders.isBas", ordersVO);
	}

	public String orderSelbnum(String ONUM) {
		// TODO Auto-generated method stub
		return sql.selectOne("Orders.orderSelbnum",ONUM);
	}
}
