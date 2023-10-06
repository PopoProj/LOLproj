package com.my.miniProj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.miniProj.model.Board;
import com.my.miniProj.model.Pages;
import com.my.miniProj.model.Pagination;
import com.my.miniProj.model.PopoUserDTO;
import com.my.miniProj.service.BoardServiceImpl;

@Controller
@MapperScan(basePackages = "com.my.miniProj.model") // BoardDao 위치
public class BoardController {

	@Autowired
	private BoardServiceImpl boardService;

	// 게시글 등록 페이지
	@RequestMapping(value = "/boardRegisterForm", method = RequestMethod.GET)
	public String registerForm(HttpServletRequest request, Model model) throws Exception {
		
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			return "needLogin";
		}
		
		PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
		if (loginMember == null) {
			return "needLogin";
		}
		
		Board board = new Board();

		model.addAttribute(board);
		return "/boardRegister";
	}

	// 게시글 등록 처리
	@RequestMapping(value = "/boardRegister", method = RequestMethod.POST)
	public String register(HttpServletRequest request, Board board, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = request.getSession(false);
		PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
		String popoId = loginMember.getPopoId();
		
		boardService.register(board, popoId);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/boardList";
	}

	// 게시글 목록 페이지
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String list(@ModelAttribute("pages") Pages pages, Model model) throws Exception {

		String url = "boardList";

		List<Board> boardList = boardService.list(pages);
		model.addAttribute("boardList", boardList);

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPages(pages);
		pagination.setTotalCount(boardService.count());
		model.addAttribute("pagination", pagination);

		return url;
	}

	// 게시글 상세 페이지
	@RequestMapping(value = "/boardRead", method = RequestMethod.GET)
	public String read(HttpServletRequest request, @ModelAttribute("pages") Pages pages, int boardNum, Model model) throws Exception {

		String url = "boardRead";

		Board board = boardService.read(boardNum);
		model.addAttribute(board);

		// 게시글 조회수 증가
		boardService.views(boardNum);

		// 로그인 계정과 게시글 글쓴이가 같은지 판별
		HttpSession session = request.getSession(false);
	
		if (session.getAttribute("userSessionID") != null) { //  일반 회원 로그인 상태
			PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
			model.addAttribute("session", loginMember);
			
			// 로그인 계정이 해당 게시글을 추천했는지 판별 0:추천안함 1:추천함
			int result = boardService.likeStatus(loginMember.getPopoNum(), boardNum);
			model.addAttribute("result", result);
		} else if (session.getAttribute("adminLogin") != null) { // 관리자 로그인 상태
			return "alertAdmin";
		}
		
		return url;

	}

	// 게시글 수정 페이지
	@RequestMapping(value = "/boardModifyForm", method = RequestMethod.GET)
	public String modifyForm(@ModelAttribute("pages") Pages pages, int boardNum, Model model) throws Exception {

		// 조회한 게시글 상세 정보를 뷰에 전달한다.
		model.addAttribute(boardService.read(boardNum));
		
		return "/boardModify";
	}

	// 게시글 수정 처리
	@RequestMapping(value = "/boardModify", method = RequestMethod.POST)
	public String modify(Board board, Pages pages, RedirectAttributes rttr) throws Exception {

		boardService.modify(board);
		
		rttr.addAttribute("boardNum", board.getBoardNum());

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pages.getPage());
		rttr.addAttribute("sizePerPages", pages.getSizePerPage());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/boardRead";
	}

	// 게시글 삭제 처리
	@RequestMapping(value = "/boardRemove", method = RequestMethod.POST)
	public String remove(@ModelAttribute("pages") Pages pages, int boardNum, RedirectAttributes rttr) throws Exception {
		boardService.remove(boardNum);

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pages.getPage());
		rttr.addAttribute("sizePerPages", pages.getSizePerPage());
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/board" + "" + "List";
	}

	// 마이페이지 내가 쓴 게시글 목록
	@RequestMapping(value = "/boardMyList", method = RequestMethod.GET)
	public String toMyBoard(HttpServletRequest request, @ModelAttribute("pages") Pages pages, Model model) throws Exception {
		HttpSession session = request.getSession(false);
		PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");

		List<Board> myList = boardService.listMyBoard(pages, loginMember.getPopoNum());
		model.addAttribute("myList", myList);

		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPages(pages);
		pagination.setTotalCount(boardService.myCount(loginMember.getPopoNum()));
		model.addAttribute("pagination", pagination);

		return "viewMyBoard";
	}
	
	// 마이페이지 내가 쓴 게시글 상세보기
	// value는 jsp 파일에서 href=에 붙는 이름
	@RequestMapping(value = "/myBoardRead", method = RequestMethod.GET)
	public String myRead(@ModelAttribute("pages") Pages pages, int boardNum, Model model) throws Exception {

		Board board = boardService.read(boardNum);
		model.addAttribute(board);

		// 게시글 조회수 증가
		boardService.views(boardNum);

		return "viewMyBoardRead";
	}
	
	// 마이페이지 내가 쓴 게시글 수정 페이지
	@RequestMapping(value = "/myBoardModifyForm", method = RequestMethod.GET)
	public String myModify1(@ModelAttribute("pages") Pages pages, int boardNum, Model model) throws Exception {
		
		Board board = boardService.read(boardNum);
		model.addAttribute("board", board);
		
		return "viewMyBoardModify";
	}

		// 게시글 수정 처리
		@RequestMapping(value = "/myBoardModify", method = RequestMethod.POST)
		public String myModify(Board board, Pages pages, RedirectAttributes rttr) throws Exception {

			boardService.modify(board);

			// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
			rttr.addAttribute("page", pages.getPage());
			rttr.addAttribute("sizePerPages", pages.getSizePerPage());
			rttr.addFlashAttribute("msg", "SUCCESS");

			return "viewMyBoardRead";
		}
		
		// 내 게시글 삭제 처리
		@RequestMapping(value = "/myBoardRemove", method = RequestMethod.POST)
		public String myRemove(@ModelAttribute("pages") Pages pages, int boardNum, RedirectAttributes rttr) throws Exception {
			boardService.remove(boardNum);

			// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
			rttr.addAttribute("page", pages.getPage());
			rttr.addAttribute("sizePerPages", pages.getSizePerPage());
			rttr.addFlashAttribute("msg", "SUCCESS");

			return "redirect:/boardMyList";
		}
		
		// 게시글 추천/추천취소
		@RequestMapping(value = "likeBoard", method = RequestMethod.POST)
		public String likeBoard(HttpServletRequest request, int boardNum) throws Exception {
			
			HttpSession session = request.getSession(false);
			PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
			int popoNum = loginMember.getPopoNum();
			
			if (boardService.likeStatus(popoNum, boardNum)==0) {
				boardService.like(popoNum, boardNum);
				boardService.likeUp(boardNum);
			} else {
				boardService.cancel(popoNum, boardNum);
				boardService.likeDown(boardNum);
			}
			
			return "redirect:/board" + "" + "List";
		}

}
