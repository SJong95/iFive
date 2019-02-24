package com.ifive.ael.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifive.ael.vo.PageVO;
import com.ifive.ael.vo.QnAVO;


@Repository
public class QnADAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public int qnaWrite(QnAVO qnaVO) {
		return sql.insert("qna.qnaWrite", qnaVO);
	}

//	public List<QnAVO> qnaList() {
//		return sql.selectList("qna.qnaList");
//	}

	public QnAVO qnadetail(int qNUM) {
		
		return sql.selectOne("qna.qnadetail", qNUM);
	}

	public int qnaReWrite(QnAVO qnaVO) {
		sql.update("qna.qnaReWrite1", qnaVO);
		return sql.insert("qna.qnaReWrite", qnaVO);
	}

	public int listCount() {
		return sql.selectOne("qna.listCount");
	}

	public List<QnAVO> qnaList(PageVO pageVO) {
		return sql.selectList("qna.qnaListPaging", pageVO);
	}

	public List<QnAVO> qnaRe() {
		return sql.selectList("qna.qnaRe");
	}
	public List<QnAVO> myQnA(String ID) {
		return sql.selectList("qna.myQnA", ID);
	}
	

}