package com.ifive.ael.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifive.ael.vo.BasketVO;
import com.ifive.ael.vo.MenuVO;
import com.ifive.ael.vo.OrdersVO;

@Repository
public class BasketDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public BasketVO basketIn(BasketVO basVO) {
	    BasketVO basSel = sql.selectOne("Bas.basSel", basVO);
	    if (basSel == null) {
	        if (sql.insert("Bas.basketIn", basVO) != 0) {
	        	return basVO;
	        }
	    }else {
	        if(sql.update("Bas.basketAdd",basVO)!=0) {
	        	return sql.selectOne("Bas.basSel", basVO);
	        }
	    }
	    return new BasketVO();
	}

	public List<BasketVO> myBas(String ID) {
		return sql.selectList("Bas.basList",ID);
	}

	public int amountAdd(BasketVO basVO) {
		return sql.update("Bas.basketAdd",basVO);
	}

	public int amountMinu(BasketVO basVO) {
		return sql.update("Bas.basketMinu",basVO);
	}

	public int basketCancle(BasketVO basVO) {
		return sql.delete("Bas.basketCancle",basVO);
	}

	public List<BasketVO> payList(BasketVO basVO) {
		return sql.selectList("Bas.payList",basVO);
	}

	public int basketDel(OrdersVO ordersVO) {
		return sql.delete("Bas.basketDel",ordersVO);
	}

	public List<OrdersVO> payOrders(OrdersVO ordersVO) {
		return sql.selectList("Bas.payOrders",ordersVO);
	}

}
