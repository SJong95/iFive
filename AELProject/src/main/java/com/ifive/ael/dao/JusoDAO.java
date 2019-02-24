package com.ifive.ael.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifive.ael.vo.*;

@Repository
public class JusoDAO {
	@Autowired
	private SqlSessionTemplate sql;
	
	public List<JusoVO> jusoList(String ID) {
		return sql.selectList("Juso.jusoList", ID);
	}

	public int juso(JusoVO jusoVO) {
		return sql.insert("Juso.juso", jusoVO);
	}

	public String jusoSel(String ID) {
		return sql.selectOne("Juso.jusoSel", ID);
	}

	public int mainjuso1(String id) {
		return sql.update("Juso.mainjuso1", id);
	}

	public int mainjuso2(String JTOTALADDR, String id) {
		return sql.update("Juso.mainjuso2", JTOTALADDR);
	}

	public int mainjuso3(String id) {
		return sql.update("Juso.mainjuso3", id);
	}

	public JusoVO jusocheck1(JusoVO jusoVO) {
		return sql.selectOne("Juso.jusocheck1", jusoVO);
	}

	public String jbestcheck(JusoVO jusoVO) {
		return sql.selectOne("Juso.jbestcheck", jusoVO);
	}
	
	
	public JusoVO myLocation(String iD) { // 회원 위치 정보 DAO
		return sql.selectOne("Juso.myLocation",iD);
		// DB에 Juso 값이 있는 지 확인하는 Mapper 실행 
	}

	public List<ResVO> resList() {
		return sql.selectList("Juso.resList");
		// DB에서 음식점 정보들을 가져오는 Mapper 실행
	}

	public String resJusoCha(String JTOTALADDR) {
		// TODO Auto-generated method stub
		return sql.selectOne("Juso.resJusoCha",JTOTALADDR);
	}
	public int jusoDel(String JTOTALADDR) {
		return sql.delete("Juso.jusoDel", JTOTALADDR);
	}

}
