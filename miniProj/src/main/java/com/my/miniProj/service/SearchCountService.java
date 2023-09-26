package com.my.miniProj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.miniProj.model.SearchCountDAO;
import com.my.miniProj.model.SearchCountDTO;

@Service
public class SearchCountService {
	@Autowired
	private SearchCountDAO searchCountDAO;
	
	public void addCount(String sumName) {
		searchCountDAO.addCount(sumName);
	}
	public void addNewCount(String sumName) {
		searchCountDAO.addNewCount(sumName);
	}
	public void emptyCount() {
		searchCountDAO.emptyCount();
	}
	public List<SearchCountDTO> getMostSearched(){
		return searchCountDAO.getMostSearched();
	}
	public int checkExist(String sumName) {
		return searchCountDAO.checkExist(sumName);
	}
	public int checkIfEmpty() {
		return searchCountDAO.checkIfEmpty();
	}
}
