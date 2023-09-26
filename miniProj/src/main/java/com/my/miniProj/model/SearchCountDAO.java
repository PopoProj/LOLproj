package com.my.miniProj.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SearchCountDAO {
	public void addCount(String sumName);
	public void emptyCount();
	public List<SearchCountDTO> getMostSearched();
	public void addNewCount(String sumName);
	public int checkExist(String sumName);
	public int checkIfEmpty();
}
