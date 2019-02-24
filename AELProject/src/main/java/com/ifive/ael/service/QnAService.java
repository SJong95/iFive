package com.ifive.ael.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.dao.QnADAO;
import com.ifive.ael.vo.PageVO;
import com.ifive.ael.vo.QnAVO;

@Service
public class QnAService {
	
	@Autowired
	private QnADAO qnaDAO;
	
	private ModelAndView mav;
	@Autowired
	private HttpSession session;

	// 글쓰기
	public ModelAndView qnaWrite(QnAVO qnaVO) {
		mav = new ModelAndView();
		int result = qnaDAO.qnaWrite(qnaVO);
		if(result == 0) {
			mav.setViewName("qnaWrite");
		} else {
			mav.setViewName("redirect:/qnaList?page=1");
			
		}
		return mav;
	}

//	// 글목록
//	public ModelAndView qnaList() {
//		mav = new ModelAndView();
//		List<QnAVO> qnaList = qnaDAO.qnaList();
//		mav.addObject("qnaList", qnaList);
//		mav.setViewName("qnaList_paging");
//		return mav;
//	}
	// 글목록페이징
		public ModelAndView qnaList(int page) {
			
			int limit = 10;
			PageVO pageVO = new PageVO();
			pageVO.setLimit(limit);
			pageVO.setPage(page);
			
			int startRow = (page-1)*limit+1;
			int endRow = page*limit; // 1페이지 5, 2페이지 10, 3페이지 15
			
			pageVO.setStartRow(startRow);
			pageVO.setEndRow(endRow);
			
			int listCount = qnaDAO.listCount();
			pageVO.setListCount(listCount);
			
			
			int maxPage = (int)((double)listCount/limit + 1);
			int startPage = (((int)((double)page/10+0.9))-1) *10 + 1;
			
			int endPage = startPage + 10 - 1;
			
			if(endPage>maxPage) {
				endPage = maxPage;
				
			}
			pageVO.setStartPage(startPage);
			pageVO.setEndPage(endPage);
			pageVO.setMaxPage(maxPage);
			
			List<QnAVO> qnaList = qnaDAO.qnaList(pageVO);
			List<QnAVO> qnaVO = qnaDAO.qnaRe();
			
			mav = new ModelAndView();
			mav.addObject("qnaRe", qnaVO);
			mav.addObject("qnaList", qnaList);
			mav.addObject("pageVO", pageVO);
			mav.setViewName("qnaList_paging");
			
			
			
			
			
			return mav;
		}
	
	

	// 글 상세보기
	public ModelAndView qnadetail(int QNUM) {
		List<QnAVO> qnaVO = qnaDAO.qnaRe();
		mav = new ModelAndView();
		QnAVO qnadetail = qnaDAO.qnadetail(QNUM);
		mav.addObject("qnadetail", qnadetail);
		mav.addObject("qnaRe", qnaVO);
		mav.setViewName("qnadetail");
		
		return mav;
	}

	// 답글쓰기
	public ModelAndView qnaReWrite(QnAVO qnaVO) {
		mav = new ModelAndView();
		int result = qnaDAO.qnaReWrite(qnaVO);
		if(result == 0) {
			mav.setViewName("redirect:/qnaRe?QNUM="+qnaVO.getQRE());
		} else {
			mav.setViewName("redirect:/adqnaList?page=1");
		}
		return mav;
	}
	public ModelAndView myQnA(String ID) {
		mav = new ModelAndView();
		System.out.println(ID);
		List<QnAVO> myQna = qnaDAO.myQnA(ID);
		mav.addObject("myQna", myQna);
		mav.setViewName("myQnA");
		return mav;
	}
	
public ModelAndView adqnaList(int page) {
		
		int limit = 10;
		PageVO pageVO = new PageVO();
		pageVO.setLimit(limit);
		pageVO.setPage(page);
		
		int startRow = (page-1)*limit+1;
		int endRow = page*limit; // 1페이지 5, 2페이지 10, 3페이지 15
		
		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);
		
		int listCount = qnaDAO.listCount();
		pageVO.setListCount(listCount);
		
		
		int maxPage = (int)((double)listCount/limit + 1);
		int startPage = (((int)((double)page/10+0.9))-1) *10 + 1;
		
		int endPage = startPage + 10 - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
			
		}
		pageVO.setStartPage(startPage);
		pageVO.setEndPage(endPage);
		pageVO.setMaxPage(maxPage);
		
		List<QnAVO> qnaList = qnaDAO.qnaList(pageVO);
		List<QnAVO> qnaVO = qnaDAO.qnaRe();
		
		mav = new ModelAndView();
		mav.addObject("qnaRe", qnaVO);
		mav.addObject("qnaList", qnaList);
		mav.addObject("pageVO", pageVO);
		mav.setViewName("adQnaList_paging");
								
		return mav;
	}
	public ModelAndView adqnadetail(int QNUM) {
		List<QnAVO> qnaVO = qnaDAO.qnaRe();
		mav = new ModelAndView();
		QnAVO qnadetail = qnaDAO.qnadetail(QNUM);
		mav.addObject("qnadetail", qnadetail);
		mav.addObject("qnaRe", qnaVO);
		mav.setViewName("adQnadetail");
		
		return mav;
	}
}


