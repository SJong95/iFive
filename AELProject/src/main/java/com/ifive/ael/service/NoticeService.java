package com.ifive.ael.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.dao.NoticeDAO;
import com.ifive.ael.vo.NoticeVO;
import com.ifive.ael.vo.PageVO;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	private ModelAndView mav;
	@Autowired
	private HttpSession session;
	// 공지사항 글쓰기
	public ModelAndView noticeWrite(NoticeVO noticeVO) {
		mav = new ModelAndView();
		int result = noticeDAO.noticeWrite(noticeVO);
		int who = (int)session.getAttribute("WHO");
		if(result == 0) {
			mav.setViewName("noticeWrite");
		} else {
			if(who == 2) {
				mav.setViewName("redirect:/adnoticeList?page=1");
			}else {
				mav.setViewName("redirect:/noticeList?page=1");	
			}
		}
		return mav;
	}

	// 공지사항 리스트
	public ModelAndView noticeList(String NTITLE, int page) {
		int limit = 10;
		PageVO pageVO = new PageVO();
		pageVO.setLimit(limit);
		
		
		int startRow = (page-1)*limit+1;
		int endRow = page*limit; // 1페이지 5, 2페이지 10, 3페이지 15
		
		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);
		pageVO.setNTITLE(NTITLE);
		
		int listCount = noticeDAO.listCount();
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
		pageVO.setPage(page);  
		mav = new ModelAndView();
		
		List<NoticeVO> noticeList = noticeDAO.noticeList(pageVO);
		mav.addObject("pageVO", pageVO);
		mav.addObject("noticeList", noticeList);
		mav.setViewName("noticeList_paging");
		
		return mav;
	}

	// 공지사항 상세보기
	public ModelAndView noticeDetail(int nNUM) {
		mav = new ModelAndView();
		NoticeVO noticeDetail = noticeDAO.noticeDetail(nNUM);
		mav.addObject("noticeDetail", noticeDetail);
		mav.setViewName("noticeDetail");
		return mav;
	}
	

	public ModelAndView adnoticeList(String NTITLE, int page) {
		int limit = 10;
		PageVO pageVO = new PageVO();
		pageVO.setLimit(limit);
		
		
		int startRow = (page-1)*limit+1;
		int endRow = page*limit; // 1페이지 5, 2페이지 10, 3페이지 15
		
		pageVO.setStartRow(startRow);
		pageVO.setEndRow(endRow);
		pageVO.setNTITLE(NTITLE);
		
		int listCount = noticeDAO.listCount();
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
		pageVO.setPage(page);  
		mav = new ModelAndView();
		
		List<NoticeVO> noticeList = noticeDAO.noticeList(pageVO);
		mav.addObject("pageVO", pageVO);
		mav.addObject("noticeList", noticeList);
		mav.setViewName("adNoticeList_paging");
	 
		return mav;
	}
	public ModelAndView adnoticeDetail(int nNUM) {
		mav = new ModelAndView();
		NoticeVO noticeDetail = noticeDAO.noticeDetail(nNUM);
		mav.addObject("noticeDetail", noticeDetail);
		mav.setViewName("adNoticeDetail");
		return mav;
	}
}
