package com.ifive.ael.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifive.ael.vo.FavoriteVO;

@Repository
public class FavoriteDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public int favoriteIn(FavoriteVO favVO) {
		FavoriteVO favSel = sql.selectOne("fav.favSel", favVO);
		if(favSel == null) {
			return sql.insert("fav.favoriteIn", favVO);
		}else{
			return 2;
		}
	}

	public List<FavoriteVO> myFav(String ID) {
		return sql.selectList("fav.myFav", ID);
	}

	public int favDel(String rBNUM) {
		return sql.delete("fav.favDel", rBNUM);
	}
	
	public List<FavoriteVO> favList(String ID) {
		return sql.selectList("fav.favList", ID);
	}
	

	
}
