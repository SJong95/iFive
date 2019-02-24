package com.ifive.ael.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifive.ael.vo.NoticeVO;
import com.ifive.ael.vo.PageVO;


@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	public int noticeWrite(NoticeVO noticeVO) {
		return sql.insert("notice.noticeWrite", noticeVO);
	}
//
//	public List<NoticeVO> noticeList() {
//		return sql.selectList("notice.noticeList");
//	}

	public NoticeVO noticeDetail(int nNUM) {
		return sql.selectOne("notice.noticeDetail", nNUM);
	}

	public int listCount() {
		return sql.selectOne("notice.listCount");
	}
	
	public List<NoticeVO> noticeList(PageVO pageVO) {
		return sql.selectList("notice.noticeListPaging", pageVO);
	}

}
