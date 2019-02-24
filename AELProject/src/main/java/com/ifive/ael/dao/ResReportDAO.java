package com.ifive.ael.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifive.ael.vo.ResReportVO;

@Repository
public class ResReportDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public int resReportAccept(ResReportVO resReportVO) {
		return sql.insert("resRe.resReportAccept", resReportVO);
	}

	public List<ResReportVO> resReportList(ResReportVO resReportVO) {
		return sql.selectList("resRe.resReportList", resReportVO);
	}

}
