package com.ifive.ael.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifive.ael.vo.MemberVO;
import com.ifive.ael.vo.OrdersVO;
import com.ifive.ael.vo.ResVO;

@Repository
public class ResDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	// 사업자 매장 정보 입력 처리.
	public int resinsert(ResVO resVO) {
		return sql.insert("res.resinsert",resVO);
	}
	/*
	 * 삭제
	 * public  ResVO viewres(String ID) {
		return sql.selectOne("res.viewres",ID);
	}*/
	public List<ResVO> resadList() {
		return sql.selectList("res.resadList");
	}
	public ResVO resadView(String ID) {
		return sql.selectOne("res.resadView",ID);
	}
	public int resyes(String rBNUM) {
		return sql.update("res.resyes", rBNUM);
	}
	public int resModify(ResVO resVO) {
		System.out.println(resVO.toString());
		return sql.update("res.modify", resVO);
	}
	public ResVO resModifyForm(ResVO resVO) {
		return sql.selectOne("res.resModifyForm", resVO);
	}
	// 01.28 추가
	public ResVO resDetail(String rbnum) {
		return sql.selectOne("res.resDetail",rbnum);
	}
	// @@@@@@ 추가된 부분 1/29 @@@@@@@@@@@
	public List<ResVO> resReportList(ResVO resVO) {
		return sql.selectList("res.resReportList", resVO);
	}
	public int resAdminDelete(ResVO resVO) {
		return sql.update("res.resAdminDelete", resVO);
	}
	public List<ResVO> resList() {
		return sql.selectList("res.resList");
	}
	public int resno(ResVO resVO) {
		return sql.update("res.resno", resVO);
	}
	public List<ResVO> resList(String RCATE) {
		return sql.selectList("res.resCateList",RCATE);
	}
	public List<ResVO> resListSearch(String search) {
		return sql.selectList("res.resSearchList",search);
		// DB에서 검색 키워드가 음식점 이름에 포함된 정보들을 가져오는 Mapper 실행
	}
	public List<ResVO> myResList(String ID) {
		return sql.selectList("res.myResList",ID);
	}
	public int resPer(String RBNUM) {
		return sql.update("res.resPer", RBNUM);
	}
	public int resDel(String RBNUM) {
		return sql.update("res.resDel", RBNUM);
	}
	public List<ResVO> resDelList() {
		return sql.selectList("res.resDelList");
	}
	public List<OrdersVO> resOrders(String RBNUM) {
		return sql.selectList("res.resOrders",RBNUM);
	}
	public List<ResVO> resListAlignReview(String RCATE) {
		return sql.selectList("res.resListAlignReview",RCATE);
	}
	public List<ResVO> resListAlignOrders(String RCATE) {
		return sql.selectList("res.resListAlignOrders",RCATE);
	}
	public List<ResVO> resListAlignGrade(String RCATE) {
		return sql.selectList("res.resListAlignGrade",RCATE);
	}
	public List<ResVO> resListSearchAlignReview(String search) {
		return sql.selectList("res.resListSearchAlignReview",search);
	}
	public List<ResVO> resListSearchAlignOrders(String search) {
		return sql.selectList("res.resListSearchAlignOrders",search);
	}
	public List<ResVO> resListSearchAlignGrade(String search) {
		return sql.selectList("res.resListSearchAlignGrade",search);
	}
	
}
