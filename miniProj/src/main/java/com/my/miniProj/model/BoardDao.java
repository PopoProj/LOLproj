package com.my.miniProj.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface BoardDao {
	// 게시글 등록 처리
		public void create(Board board, String popoId) throws Exception;

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
		public List<Board> listMyBoard(Map<String, Object> map) throws Exception;

		// 내가 쓴 게시글 건수 반환
		public int myCount(Integer popoNum) throws Exception;
		
		public List<Board> getRecentArt();
		
		// 게시글 추천
		public void like(Map map) throws Exception;
		
		// 유저가 게시글을 추천했는지 여부
		public int likeStatus(Map map) throws Exception;
}
