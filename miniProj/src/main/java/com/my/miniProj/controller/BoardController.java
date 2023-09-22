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
	@RequestMapping(value = "/boardRegister", method = RequestMethod.GET)
	public void registerForm(Model model) throws Exception {
		System.out.println("게시글 등록");
		Board board = new Board();
		
		// 로그인 popoUser 가져와서 boardWriter 채우기
		// session.setAttribute("loginDto", popouser) 하면 loginDto.어쩌구 사용할 수 있음
		
		String tempWriter = "임시작성자";
		model.addAttribute("tempWriter", tempWriter);
		
		model.addAttribute(board);
	}

	// 게시글 등록 처리
	@RequestMapping(value = "/boardRegister", method = RequestMethod.POST)
	public String register(Board board, RedirectAttributes rttr) throws Exception {
		boardService.register(board);

		rttr.addFlashAttribute("msg", "SUCCESS");
		System.out.println("게시글 등록 처리");

		return "redirect:/boardList";
	}

	// 게시글 목록 페이지
	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public String list(@ModelAttribute("pages") Pages pages, Model model) throws Exception {
		System.out.println("게시글 목록 컨트롤러");
		
		String url = "boardList";
		
		List<Board> boardList = boardService.list(pages);
		System.out.println(boardList.toString());
		model.addAttribute("boardList", boardList);
		
		// 페이징 네비게이션 정보를 뷰에 전달한다.
		Pagination pagination = new Pagination();
		pagination.setPages(pages);
		pagination.setTotalCount(boardService.count());
		model.addAttribute("pagination", pagination);
		System.out.println(model.toString());
		
		return url;
	}

	// 게시글 상세 페이지
	@RequestMapping(value = "/boardRead", method = RequestMethod.GET)
	public String read(@ModelAttribute("pages") Pages pages, int boardNum, Model model) throws Exception {
		System.out.println("게시글 상세 컨트롤러");
		
		String url = "boardRead";
		
		Board board = boardService.read(boardNum);
		model.addAttribute(board);
		
		// 게시글 조회수 증가
		boardService.views(boardNum);
		System.out.println("조회수 증가 컨트롤러 : " + board.getBoardViews());

		return url;

	}

	// 게시글 수정 페이지
	@RequestMapping(value = "/boardModify", method = RequestMethod.GET)
	public void modifyForm(@ModelAttribute("pages") Pages pages, int boardNum, Model model) throws Exception {
		System.out.println("게시글 수정 컨트롤러");
		
		// 조회한 게시글 상세 정보를 뷰에 전달한다.
		model.addAttribute(boardService.read(boardNum));
	}

	// 게시글 수정 처리
	@RequestMapping(value = "/boardModify", method = RequestMethod.POST)
	public String modify(Board board, Pages pages, RedirectAttributes rttr) throws Exception {
		System.out.println("게시글 수정처리 컨트롤러");
		
		boardService.modify(board);

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pages.getPage());
		rttr.addAttribute("sizePerPages", pages.getSizePerPage());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/boardList";
	}

	// 게시글 삭제 처리
	@RequestMapping(value = "/boardRemove", method = RequestMethod.POST)
	public String remove(@ModelAttribute("pages") Pages pages, int boardNum, RedirectAttributes rttr) throws Exception {
		boardService.remove(boardNum);

		// RedirectAttributes 객체에 일회성 데이터를 지정하여 전달한다.
		rttr.addAttribute("page", pages.getPage());
		rttr.addAttribute("sizePerPages", pages.getSizePerPage());
		rttr.addFlashAttribute("msg", "SUCCESS");
		System.out.println("게시글 삭제처리");

		return "redirect:/board" + "" + "List";
	}
	
	// 마이페이지 내가 쓴 글
	@RequestMapping(value = "/toMyBoard", method = RequestMethod.GET)
	public String toMyBoard(HttpServletRequest request, Pages pages, Model model) throws Exception {
		HttpSession session = request.getSession(false);
		PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
		
		List<Board> myList = boardService.listMyBoard(pages, loginMember.getPopoNum());
		model.addAttribute("myList", myList);
		System.out.println(myList.toString());
		
		return "viewMyBoard";
	}
	
}
