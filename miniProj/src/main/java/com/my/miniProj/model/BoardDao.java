package com.my.miniProj.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDao {
	// 게시글 등록 처리
		public void create(Board board) throws Exception;

		// 게시글 목록 페이지
		public List<Board> list(Pages pages) throws Exception;

		// 게시글 상세 페이지
		public Board read(Integer boardNum) throws Exception;

		// 게시글 수정 처리
		public void update(Board board) throws Exception;

		// 게시글 삭제 처리
		public void delete(Integer boardNum) throws Exception;
		
		// 게시글 전체 건수 반환
		public int count() throws Exception;

		// 게시글 조회수 증가
		public void views(Integer boardNum)throws Exception;

		// 내가 쓴 게시글 목록
		public Board listMyBoard(Integer popoNum) throws Exception;
}
