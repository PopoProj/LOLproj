package com.my.miniProj.model;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Pages {

	private int page;// 현재 페이지 번호
	private int sizePerPage;//페이지당 보여줄 게시글의 개수

	//특정 페이지를 조회
	//기본 생성자
	public Pages() {
		this.page = 1;
		this.sizePerPage = 10;

	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setSizePerPage(int size) {
		if (size <= 0 || size > 100) {
			this.sizePerPage = 10;
			return;
		}
		this.sizePerPage = size;
	}

	//현재 페이지 번호
	public int getPage() {
		return page;
	}

	// 마이바티스 SQL 매퍼를 위한 메서드
	// 특정 페이지의 게시글 시작번호, 시작 행 번호
	public int getPageStart() {

		return (this.page - 1) * sizePerPage;
	}

	// 마이바티스 SQL 매퍼를 위한 메서드
	//페이지당 보여줄 개시글의 개수
	public int getSizePerPage() {
		return this.sizePerPage;
	}

	// 멤버 변수를 활용하여 다양한 형태의 쿼리 파라미터를 생성한다.
	public String toUriString() {
		UriComponents uriComponents = UriComponentsBuilder
				.newInstance()
				.queryParam("page", this.page)
				.queryParam("size", this.sizePerPage)
				.build();
		
		return uriComponents.toUriString();
	}

}