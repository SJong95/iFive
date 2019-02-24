package com.ifive.ael.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ifive.ael.vo.ReviewReVO;
import com.ifive.ael.vo.ReviewVO;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public int reviewWrite(ReviewVO reviewVO) {
		return sql.insert("review.reviewWrite", reviewVO);
	}

	public List<ReviewVO> reviewList(String rbNum) {
		return sql.selectList("review.reviewList", rbNum);
	}

	public int reviewReport(ReviewVO reviewVO) {
		return sql.update("review.reviewReport", reviewVO);

	}

	public ReviewVO reviewDetail(int vNum) {
		return sql.selectOne("review.reviewDetail", vNum);
	}

	public int reviewRe(ReviewReVO reviewReVO) {
		return sql.insert("reviewRe.reviewRe", reviewReVO);
	}

	public List<ReviewReVO> reviewReList(String rbNum) {
		return sql.selectList("reviewRe.reviewReList", rbNum);
	}
	/* 01.28 추가 */
	public void updateGrade(ReviewVO reviewVO) {
		sql.update("res.updateGrade",reviewVO);
		
	}
	// @@@@@ 추가 1/29 @@@@@@@@
	public List<ReviewVO> reviewReportList(ReviewVO reviewVO) {
		return sql.selectList("review.reviewReportList", reviewVO);
	}
	public int reviewAdminDelete(ReviewVO reviewVO) {
		return sql.update("review.reviewAdminDelete", reviewVO);
	}
	//02.01
	public int reviewReportID(ReviewVO reviewVO) {
		return sql.insert("review.reviewReportID", reviewVO);
	}

	public ReviewVO reportID(ReviewVO reviewVO) {
		return sql.selectOne("review.reviewID", reviewVO);
	}

	public List<ReviewVO> reviewPhoto(String rbnum) {
		return sql.selectList("review.reviewPhoto", rbnum);
	}

	public List<ReviewVO> reviewMember(String id) {
		return sql.selectList("review.reviewMember", id);
	}
	//02.07
	public ReviewVO reviewWriteCheck(ReviewVO reviewVO) {
		return sql.selectOne("review.reviewWriteCheck", reviewVO);
	}
}
