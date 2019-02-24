package com.ifive.ael.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifive.ael.vo.*;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sql;

	public MemberVO idOverlap(String id) {
		System.out.println("왜 이게 되지?");
		return sql.selectOne("Member.idOverlap", id);
	}

	public MemberVO memberLogin(MemberVO memberVO) {
		return sql.selectOne("Member.memberLogin", memberVO);
	}

	public int memberJoin(MemberVO memberVO) {
		return sql.insert("Member.memberJoin", memberVO);
	}

	public MemberVO memberView(String ID) {
		return sql.selectOne("Member.memberView", ID);
	}
	public int overKey(String key) {
		return sql.insert("Member.overKey", key);
	}

	public String checkKey(String key) {
		return sql.selectOne("Member.checkKey", key);
	}
	public int pwchange2(MemberVO memberVO) {
		return sql.update("Member.pwchange2", memberVO);
	}
	public int memberBye(String ID) {
		return sql.delete("Member.memberBye", ID);
	}

	public void pointAdd(MemberVO memberVO) {
		sql.update("Member.pointAdd",memberVO);
		
	}

	public void pointMin(MemberVO memberVO) {
		sql.update("Member.pointMin",memberVO);
		
	}
}