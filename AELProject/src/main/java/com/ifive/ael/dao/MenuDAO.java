package com.ifive.ael.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifive.ael.vo.MenuVO;

@Repository
public class MenuDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public int menuAdd(MenuVO menuVO) {
		return sql.insert("menu.menuAdd", menuVO);
	}

	public MenuVO menuModifyForm(MenuVO menuVO) {
		return sql.selectOne("menu.menuModifyForm", menuVO);
	}

	public List<MenuVO> menuAdmin(String RBNUM) {
		return sql.selectList("menu.menuAdmin", RBNUM);
	}

	public MenuVO foodModify(String mNAME) {
		return sql.selectOne("menu.foodModify", mNAME);
	}

	public int menuModify(MenuVO menuVO) {
		return sql.update("menu.menuModify", menuVO);
		
	}

	public int menuDelete(MenuVO menuVO) {
		return sql.delete("menu.menuDelete", menuVO);
	}

	public List<MenuVO> resMenu(String rbnum) {
		return sql.selectList("menu.resMenu",rbnum);
	}

}
