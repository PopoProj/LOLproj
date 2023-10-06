package com.my.miniProj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void register(Board board, String popoId) throws Exception {
		boardDao.create(board, popoId);
	}

	// 게시글 목록 페이지
	public List<Board> list(Pages pages) throws Exception {
		List<Board> list = boardDao.list(pages);
		return list;
	}

	// 게시글 상세 페이지
	public Board read(Integer boardNum) throws Exception {
		Board board = boardDao.read(boardNum);
		return board;
	}

	// 게시글 수정 처리
	public void modify(Board board) throws Exception {
		boardDao.update(board);
	}

	// 게시글 삭제 처리
	public void remove(Integer boardNum) throws Exception {
		boardDao.delete(boardNum);

	}

	// 게시글 전체 건수 반환
		public int count() throws Exception {
			int result =  boardDao.count();
			return result;
		}

		// 게시글 조회수 증가
		public void views(Integer boardNum) throws Exception{
			boardDao.views(boardNum);
		}
		
	// 내가 쓴 게시글 목록
		public List<Board> listMyBoard(Pages pages, Integer popoNum) throws Exception {
			Map<String, Object> map = new HashMap<>();
			map.put("page", pages.getPage());
			map.put("sizePerPage", pages.getSizePerPage());
			map.put("popoNum", popoNum);
			List<Board> board = boardDao.listMyBoard(map);
			return board;
		}
		
	// 내가 쓴 게시글 건수 반환
		public int myCount(Integer popoNum) throws Exception {
			int result = boardDao.myCount(popoNum);
			return result;
		}

		public List<Board> getMostLikedArt() {
			return boardDao.getMostLikedArt();
		}

		// 게시글 추천
		public void like(int popoNum, int boardNum) throws Exception {
			Map<String, Integer> map = new HashMap<>();
			map.put("popoNum", popoNum);
			map.put("boardNum", boardNum);
			boardDao.like(map);
		} 
		
		// 게시글 추천 취소
		public void cancel(int popoNum, int boardNum) throws Exception {
			Map<String, Integer> map = new HashMap<>();
			map.put("popoNum", popoNum);
			map.put("boardNum", boardNum);
			boardDao.cancel(map);
		}
		
		// 유저가 게시글을 추천했는지 여부
		public int likeStatus(int popoNum, int boardNum) throws Exception {
			Map<String, Integer> map = new HashMap<>();
			map.put("popoNum", popoNum);
			map.put("boardNum", boardNum);
			int result = boardDao.likeStatus(map);
			return result;
		}

		// 게시글 추천수 +1
		public void likeUp(int boardNum) throws Exception {
			boardDao.likeUp(boardNum);
		}

		// 게시글 추천수 -1
		public void likeDown(int boardNum) throws Exception {
			boardDao.likeDown(boardNum);
		}
}