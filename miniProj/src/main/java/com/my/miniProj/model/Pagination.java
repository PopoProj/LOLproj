package com.my.miniProj.model;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Pagination {

	private int totalCount;// 전체 게시글 수

	private int startPage;// 시작페이지
	private int endPage; // 끝 페이지

	private boolean prev; // 이전글 목록
	private boolean next; // 다음글 목록

	private int displayPageNum = 10; // 한 페이지에 보여지는 게시글 수 = 10개

	private Pages pages;

	public void setPageRequest(Pages pages) {
		this.pages = pages;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		// 페이징 데이터 함수
		calcData();
	}

	private void calcData() {

		// 끝 페이지 = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 개수) * 화면에 보여질 페이지 번호의 개수
		endPage = (int) (Math.ceil(pages.getPage() / (double) displayPageNum) * displayPageNum);

		// 시작 페이지 = (끝 페이지 - 한 페이지에 보여지는 게시글 수) + 1
		startPage = (endPage - displayPageNum) + 1;

		// 마지막 번호 다시 계산 = 총 게시글 / 한 페이지당 보여줄 게시글의 갯수
		int tempEndPage = (int) (Math.ceil(totalCount / (double) pages.getSizePerPage()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		// 이전버튼 생성 여부 (시작페이지 번호가 1이 아니면 생성) 

		prev = startPage == 1 ? false : true;

		// 다음 버튼 생성 여부 = 끝 페이지 번호 * 한 페이지당 보여줄 게시글의 개수가
		//총 게시글의 수보다 크거나 같으면 false, 아니면 true
		next = endPage * pages.getSizePerPage() >= totalCount ? false : true;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public Pages getPages() {
		return pages;
	}

	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", pages.getSizePerPage())
				.build();

		return uriComponents.toUriString();
	}
}