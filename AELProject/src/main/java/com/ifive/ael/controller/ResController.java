package com.ifive.ael.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ifive.ael.service.*;
import com.ifive.ael.vo.*;

@Controller
public class ResController {

	@Autowired
	private ResService rs;

	@Autowired
	private MenuService mns;
	
	@Autowired
	private FavoriteService fs;
	
	@Autowired
	private BasketService bs;

	private ModelAndView mav = new ModelAndView();

	@Autowired
	private HttpSession session;

	// 시작페이지
		@RequestMapping(value = "/resinsertForm", method = RequestMethod.GET)
		public String insertForm() {
			if(session.getAttribute("ID") != null) {
				return "resinsert";
			}
			return "redirect:/";
		}

		// 사업자 매장정보 등록
		@RequestMapping(value = "/resinsert", method = RequestMethod.POST)
		public ModelAndView resinsert(@ModelAttribute ResVO resVO)throws Exception {
			if(session.getAttribute("ID") != null) {
				MultipartFile MFile = resVO.getRFile();
				if(!MFile.isEmpty()) {
					String fileName = MFile.getOriginalFilename();
					String fileLocation = "C:\\Users\\pc\\Documents\\workspace-sts-3.9.6.RELEASE\\AELProject\\src\\main\\webapp\\resources\\resImg\\";
					MFile.transferTo(new File(fileLocation+fileName));
				}
				resVO.setRES_IMG(MFile.getOriginalFilename());
				mav = rs.resinsert(resVO);
			}else {
				mav.setViewName("redirect:/");
			}			
			return mav;
		}
		// 매장 정보 수정 폼으로 가기
		@RequestMapping(value = "/resModifyForm", method = RequestMethod.GET)
		public ModelAndView resModifyForm(@ModelAttribute ResVO resVO) {
			if(session.getAttribute("ID") != null) {
				mav = rs.resModifyForm(resVO);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		// 매장 정보 수정 처리
		@RequestMapping(value = "/resmodify", method = RequestMethod.POST)
		public ModelAndView resModify(@ModelAttribute ResVO resVO) {
			if(session.getAttribute("ID") != null) {
				mav = rs.resModify(resVO);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		// 매장 메뉴 수정 폼
		@RequestMapping(value = "/menuModifyForm", method = RequestMethod.GET)
		public ModelAndView menuModifyForm(@ModelAttribute MenuVO menuVO) {
			if(session.getAttribute("ID") != null) {
				mav = mns.menuModifyForm(menuVO);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		// 메뉴 리스트 
		@RequestMapping(value = "/menuAdmin", method = RequestMethod.GET)
		public ModelAndView menuAdmin(@RequestParam("RBNUM") String RBNUM ) {
			if(session.getAttribute("ID") != null) {
				mav = mns.menuAdmin(RBNUM);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		
		// 메뉴 수정 처리
		@RequestMapping(value = "/menuModify", method = RequestMethod.POST)
		public ModelAndView menuModify(@ModelAttribute MenuVO menuVO) throws Exception {
			if(session.getAttribute("ID") != null) {
				MultipartFile MFile = menuVO.getMFile();
				if(!MFile.isEmpty()) {
					String fileName = MFile.getOriginalFilename();
					String fileLocation = "C:\\Users\\pc\\Documents\\workspace-sts-3.9.6.RELEASE\\AELProject\\src\\main\\webapp\\resources\\menuImg\\";
					MFile.transferTo(new File(fileLocation+fileName));
					menuVO.setMIMG(MFile.getOriginalFilename());
				}
				mav = mns.menuModify(menuVO);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		// 매장 메뉴 등록 폼으로 가기
		@RequestMapping(value = "/menuAddForm", method = RequestMethod.GET)
		public ModelAndView menuAddForm(@RequestParam("RBNUM") String RBNUM) {
			if(session.getAttribute("ID") != null) {
				mav.addObject("RBNUM", RBNUM);
				mav.setViewName("menuAdd");
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		// 메뉴 등록 처리 ( @@ 파일 등록 경로 수정 하기 @@ )
		@RequestMapping(value = "/menuAdd", method = RequestMethod.POST)
		public ModelAndView menuAdd(@ModelAttribute MenuVO menuVO) throws Exception {
			if(session.getAttribute("ID") != null) {
				MultipartFile MFile = menuVO.getMFile();
				if(!MFile.isEmpty()) {
					String fileName = MFile.getOriginalFilename();
					String fileLocation = "C:\\Users\\pc\\Documents\\workspace-sts-3.9.6.RELEASE\\AELProject\\src\\main\\webapp\\resources\\menuImg\\";
					MFile.transferTo(new File(fileLocation+fileName));
				}
				menuVO.setMIMG(MFile.getOriginalFilename());
				mav = mns.menuAdd(menuVO);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		// 메뉴 삭제 처리
		@RequestMapping(value = "/menuDelete", method = RequestMethod.GET)
		public ModelAndView menuDelete(@ModelAttribute MenuVO menuVO) {
			if(session.getAttribute("ID") != null) {
				mav = mns.menuDelete(menuVO);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		
		
		@RequestMapping(value = "/resManage", method = RequestMethod.GET)
		public ModelAndView resManage() {
			if(session.getAttribute("ID") != null) {
				mav = rs.resView((String)session.getAttribute("ID"));
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}

		@RequestMapping(value = "/resadList", method = RequestMethod.GET)
		public ModelAndView resadList(HttpSession session) {
			if(session.getAttribute("ID") != null) {
				mav = rs.resadList();
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		@RequestMapping(value = "/resadView", method = RequestMethod.GET)
		public ModelAndView resadView(@RequestParam("resID") String ID) {
			if(session.getAttribute("ID") != null) {
				mav = rs.resadView(ID);
			}else {
				mav.setViewName("redirect:/");
			}			
			return mav;
		}
		@RequestMapping(value = "/resyes", method = RequestMethod.GET)
		public ModelAndView resyes(@RequestParam("RBNUM") String RBNUM) {
			if(session.getAttribute("ID") != null) {
				mav = rs.resyes(RBNUM);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		
		/* 추가 부분 */
		@RequestMapping(value = "/resDetail")
		public ModelAndView resDeatil(@RequestParam("RBNUM") String RBNUM) {
			if(session.getAttribute("ID") != null) {
				mav = rs.resDetail(RBNUM);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		//@@@@@ 추가 내용  1/29 @@@@@@
		@RequestMapping(value = "/resAdminDelete", method = RequestMethod.GET)
		public ModelAndView resAdminDelete(@ModelAttribute ResVO resVO) {
			if(session.getAttribute("ID") != null) {
				mav = rs.resAdminDelete(resVO);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		//01.29 추가 장바구니
		@RequestMapping(value="/basketIn",method=RequestMethod.POST)
		@ResponseBody
		public BasketVO basketIn(@ModelAttribute BasketVO basVO ) {
			System.out.println(basVO.toString());
			BasketVO newBas =bs.basketIn(basVO);
			System.out.println(newBas.toString());
			return newBas;
		}
		@RequestMapping(value = "/myBas", method = RequestMethod.GET)
		public ModelAndView myBas() {
			if(session.getAttribute("ID") != null) {
				mav = bs.myBas((String)session.getAttribute("ID"));
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		@RequestMapping(value="/amountModify",method=RequestMethod.POST)
		@ResponseBody
		public String amountModify(@ModelAttribute BasketVO basVO, @RequestParam("admi") int admi) {
			System.out.println(basVO.toString());
			return bs.amountModify(basVO, admi);
		}
		
		@RequestMapping(value="/basketCancle",method=RequestMethod.POST)
		@ResponseBody
		public String basketCancle(@ModelAttribute BasketVO basVO) {
			if(session.getAttribute("ID") != null) {
				return bs.basketCancle(basVO);
			}
			return "999";
		}
		//02.01
		@RequestMapping(value = "/resno", method = RequestMethod.GET)
		public ModelAndView resno(@ModelAttribute ResVO resVO) {
			if(session.getAttribute("ID") != null) {
				mav = rs.resno(resVO);
				
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		//02.03
		@RequestMapping(value = "/resList", method = RequestMethod.GET)
		public ModelAndView resList(HttpServletRequest request) { // 음식점 리스트
			if(session.getAttribute("ID") != null) { // 로그인 여부 체크
				String RCATE = "";	 String search="";	 String align ="";	//카테고리, 검색, 정렬 정보 받을 변수
				if(request.getParameter("align") != null) { // 정렬 정보가 있을 경우
					align = request.getParameter("align");	// 정렬 정보 align에 저장
					System.out.println("정렬 진입");
					if(request.getParameter("cate") != null) { // 정렬,카테고리 정보가 있을 경우
						System.out.println("정렬 cate 진입");
						RCATE = request.getParameter("cate");  // 카테고리 정보 RCATE에 저장
						mav=rs.resListAlign(RCATE,align, (String)session.getAttribute("ID"));
						// 정렬, 카테고리에 해당하는 정보를 가져오기 위해 서비스 메소드 호출
					}else if(request.getParameter("search") != null){ // 정렬, 검색 정보가 있을 경우
						System.out.println("정렬 search 진입");
						search = request.getParameter("search"); // 검색 정보 search에 저장
						mav = rs.resListSearchAlign(search,align, (String)session.getAttribute("ID"));
						// 정렬, 검색에 해당하는 정보를 가져오기 위해 서비스 메소드 호출
					}
				}else {	//정렬 정보가 없을 경우
					if(request.getParameter("cate") != null) { // 카테고리만 있을 경우
						RCATE = request.getParameter("cate"); // 카테고리 정보 RCATE에 저장
						System.out.println(RCATE);
						mav = rs.resList(RCATE, (String)session.getAttribute("ID"));
						
					}else if(request.getParameter("search") != null){ //검색만 있을 경우
						search = request.getParameter("search"); // 검색 정보 search에 저장
						mav = rs.resListSearch(search, (String)session.getAttribute("ID"));
						//검색에 해당하는 정보를 가져오기 위해 서비스 메소드 호출
					}
				}
			}else { mav.setViewName("redirect:/"); } return mav; }
		//02.07
		@RequestMapping(value = "/resPer", method = RequestMethod.GET)
		public ModelAndView resPer(@RequestParam("RBNUM") String RBNUM) {
			if(session.getAttribute("ID") != null) {
				mav = rs.resPer(RBNUM);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		@RequestMapping(value = "/resDel", method = RequestMethod.GET)
		public ModelAndView resDel(@RequestParam("RBNUM") String RBNUM) {
			if(session.getAttribute("ID") != null) {
				mav = rs.resDel(RBNUM);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		@RequestMapping(value = "/resOrders", method = RequestMethod.GET)
		public ModelAndView resOrders(@RequestParam("RBNUM") String RBNUM) {
			if(session.getAttribute("ID") != null) {
				mav = rs.resOrders(RBNUM);
			}else {
				mav.setViewName("redirect:/");
			}
			return mav;
		}
		// 2월 7일 장바구니 추가
				@RequestMapping(value="/favoriteIn",method=RequestMethod.POST)
				@ResponseBody
				public String favoriteIn(@ModelAttribute FavoriteVO favVO ) {
					return fs.favoriteIn(favVO);
				}
				// 내 즐겨찾기 목록 추가
				@RequestMapping(value = "/myFav", method = RequestMethod.GET)
				public ModelAndView myFav() {
					if(session.getAttribute("ID") != null) {
						mav = fs.myFav((String)session.getAttribute("ID"));
					}else {
						mav.setViewName("redirect:/");
					}
					return mav;
				}
				
				// 즐겨찾기 삭제
				@RequestMapping(value="/favDel", method=RequestMethod.GET)
				public ModelAndView favDel(@RequestParam("RBNUM") String RBNUM) {
					System.out.println(RBNUM);
					mav = fs.favDel(RBNUM);
					return mav;
				}
}
