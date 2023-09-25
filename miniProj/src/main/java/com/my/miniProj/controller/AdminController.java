package com.my.miniProj.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.miniProj.model.Board;
import com.my.miniProj.model.Pages;
import com.my.miniProj.model.Pagination;
import com.my.miniProj.model.PopoUserDTO;
import com.my.miniProj.service.BoardServiceImpl;
import com.my.miniProj.service.PopoUserService;

@Controller
@RequestMapping("/admin")
@MapperScan(basePackages = "com.my.miniProj.model") // BoardDao, PopoUser 위치
public class AdminController {
	
	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	private PopoUserService popoUserService;
	
	// 관리자 로그인시 관리자 메인 페이지로 전환
	@GetMapping("")
	public String admin(){
		return "admin";
	}
	
	// 게시글 관리 페이지
	@RequestMapping(value = "/boardList")
	public String adminBoard() throws Exception {
		return "boardList";
	}
	
	// 회원 관리 목록 페이지
	@RequestMapping(value = "/popoList", method = RequestMethod.GET)
	public String popoList(@ModelAttribute("pages") Pages pages, Model model) throws Exception {
		System.out.println("회원 관리 목록 컨트롤러");
		
		String url = "popoList";
		
		List<PopoUserDTO> popoList = popoUserService.popoList(pages);
		System.out.println(popoList.toString());
		model.addAttribute("popoList", popoList);
		
		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPages(pages);
		pagination.setTotalCount(popoUserService.countUsers());
		model.addAttribute("pagination", pagination);
		System.out.println(model.toString());
		
		return url;
	}
	
	// 회원 관리 차단 기능
	@RequestMapping(value = "/popoBan", method = RequestMethod.POST)
	public String popoBan(@ModelAttribute("pages") Pages pages, int popoNum, int popoBan, RedirectAttributes rttr) throws Exception {
		
		if (popoBan == 0) {
		// 차단하기 popoBan이 0이면 1로 변경
		popoUserService.popoBan(popoNum);
		} else {
		// 차단해제하기 popoBan이 1이면 0으로 변경
		popoUserService.popoUnban(popoNum);
		}
		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달
		rttr.addAttribute("page", pages.getPage());
		rttr.addAttribute("sizePerPages", pages.getSizePerPage());
		rttr.addFlashAttribute("msg", "SUCCESS");
		System.out.println("회원 차단처리");
		
		return "redirect:/admin/popoList";
	}
	
}
