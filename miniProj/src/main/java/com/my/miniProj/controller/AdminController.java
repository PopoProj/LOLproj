package com.my.miniProj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.miniProj.model.AdminDTO;
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
	
	@GetMapping("/adminLogin")
	public String adminLogin(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			if(session.getAttribute("userSessionID") != null) {
				return "needLogout";
			}
			else if (session.getAttribute("adminLogin") != null) {
				return "redirect:/admin";
			}
		}
		return "adminLogin";
	}
	
	@PostMapping("/adminLoginAction")
	public String adminLoginAction(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		AdminDTO admin = popoUserService.adminLoginAction(id, pw);
		request.setAttribute("result", admin);	
		HttpSession session = request.getSession();
		session.setAttribute("adminLogin", admin);
		return "adminLoginAction";
	}
	
	@GetMapping("/adminLogout")
	public String adminLogout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "logoutAction";
	}
	
	
	// 게시글 관리 목록 페이지
	@RequestMapping(value = "/adminBoardList")
	public String adminBoard(@ModelAttribute("pages") Pages pages, Model model) throws Exception {
		
		System.out.println("관리자 게시글 목록 컨트롤러");

		List<Board> boardList = boardService.list(pages);
		System.out.println(boardList.toString());
		model.addAttribute("boardList", boardList);

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPages(pages);
		pagination.setTotalCount(boardService.count());
		model.addAttribute("pagination", pagination);
		System.out.println(model.toString());
		
		return "adminBoardList";
	}
	
	// 게시글 관리 상세 페이지
	@RequestMapping(value = "/adminBoardRead", method = RequestMethod.GET)
	public String adminRead(HttpServletRequest request, @ModelAttribute("pages") Pages pages, int boardNum, Model model) throws Exception {
		System.out.println("관리자 게시글 상세 컨트롤러");

		Board board = boardService.read(boardNum);
		model.addAttribute(board);
				
		return "adminBoardRead";
	}
	
	// 게시글 수정 페이지
		@RequestMapping(value = "/adminBoardModifyForm", method = RequestMethod.GET)
		public String adminModifyForm(@ModelAttribute("pages") Pages pages, int boardNum, Model model) throws Exception {
			System.out.println("게시글 수정 컨트롤러");

			// 조회한 게시글 상세 정보를 뷰에 전달한다.
			model.addAttribute(boardService.read(boardNum));
			
			return "/adminBoardModifyForm";
		}
		
		// 게시글 수정 처리
		@RequestMapping(value = "/adminBoardModify", method = RequestMethod.POST)
		public String adminModify(Board board, Pages pages, RedirectAttributes rttr) throws Exception {
			System.out.println("게시글 수정처리 컨트롤러");

			boardService.modify(board);
			
			rttr.addAttribute("boardNum", board.getBoardNum());

			// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
			rttr.addAttribute("page", pages.getPage());
			rttr.addAttribute("sizePerPages", pages.getSizePerPage());
			rttr.addFlashAttribute("msg", "SUCCESS");

			return "redirect:/admin/adminBoardRead";
		}
		
		// 게시글 삭제 처리
		@RequestMapping(value = "/adminBoardRemove", method = RequestMethod.POST)
		public String remove(@ModelAttribute("pages") Pages pages, int boardNum, RedirectAttributes rttr) throws Exception {
			boardService.remove(boardNum);

			// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
			rttr.addAttribute("page", pages.getPage());
			rttr.addAttribute("sizePerPages", pages.getSizePerPage());
			rttr.addFlashAttribute("msg", "SUCCESS");
			System.out.println("게시글 삭제처리");

			return "redirect:/admin/adminBoard" + "" + "List";
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
	
//    @GetMapping("listBanned")
//    public String listBanned() {
//    	List<PopoUserDTO> bannedUsers = popoUserService.listBanned();
//    	return "listBanned";
//    }
//    
//    @GetMapping("listQuit")
//    public String listQuit() {
//    	List<PopoUserDTO> quitUsers = popoUserService.listQuit();
//    	return "listQuit";
//    }
	
}
