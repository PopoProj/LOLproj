package com.my.miniProj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.miniProj.model.Board;
import com.my.miniProj.model.BoardDao;
import com.my.miniProj.model.Pages;

@Service
public class BoardServiceImpl {

	@Autowired
	private BoardDao boardDao;

	// 게시글 등록 처리
	public void register(Board board) throws Exception {
		boardDao.create(board);
	}

	// 게시글 목록 페이지
	public List<Board> list(Pages pages) throws Exception {
		System.out.println("게시물 목록 서비스");
		List<Board> list = boardDao.list(pages);
		return list;
	}

	// 게시글 상세 페이지
	public Board read(Integer boardNum) throws Exception {
		System.out.println("게시물 상세보기 서비스");
		Board board = boardDao.read(boardNum);
		return board;
	}

	// 게시글 수정 처리
	public void modify(Board board) throws Exception {
		System.out.println("게시물 수정 서비스");
		boardDao.update(board);
	}

	// 게시글 삭제 처리
	public void remove(Integer boardNum) throws Exception {
		System.out.println("게시물 삭제 서비스");
		boardDao.delete(boardNum);

	}

	// 게시글 전체 건수 반환
		public int count() throws Exception {
			int result =  boardDao.count();
			System.out.println("게시물 개수 : "+result);
			return result;
		}
		
		// 게시글 조회수 증가
		public void views(Integer boardNum) throws Exception{
			boardDao.views(boardNum);
		}

}