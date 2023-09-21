//package com.my.miniProj.controller;
//
//import java.util.List;
//
//import org.mybatis.spring.annotation.MapperScan;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.my.miniProj.model.Board;
//import com.my.miniProj.model.Pages;
//import com.my.miniProj.model.Pagination;
//import com.my.miniProj.service.BoardServiceImpl;
//import com.my.miniProj.service.PopoUserService;
//
//@Controller
//@RequestMapping("/admin")
//@MapperScan(basePackages = "com.my.miniProj.model") // BoardDao, PopoUser 위치
//public class AdminController {
//	
//	@Autowired
//	private BoardServiceImpl boardService;
//	
//	@Autowired
//	private PopoUserService popoService;
//	
//	// 관리자 로그인시 관리자 메인 페이지로 전환
//	@GetMapping("")
//	public String admin(){
//		return "admin";
//	}
//	
//	// 게시글 관리 페이지
//	@RequestMapping(value = "/adminBoard", method=RequestMethod.GET)
//	public String adminBoard(@ModelAttribute("pages") Pages pages, Model model) throws Exception {
//		System.out.println("관리자 게시글 관리 컨트롤러");
//		
//		String url = "adminBoard";
//		
//		List<Board> boardList = boardService.list(pages);
//		model.addAttribute("boardList", boardList);
//		
//		// 페이징 네비게이션 정보를 뷰에 전달한다.
//		Pagination pagination = new Pagination();
//		pagination.setPages(pages);
//		pagination.setTotalCount(boardService.count());
//		model.addAttribute("pagination", pagination);
//		
//		return url;
//	}
//	
//	// 회원 관리 페이지
//	@RequestMapping(value = "/adminManagement")
//	public String adminManagement(@ModelAttribute("pages") Pages pages, Model model) {
//		return null;
//	}
//	
//}
