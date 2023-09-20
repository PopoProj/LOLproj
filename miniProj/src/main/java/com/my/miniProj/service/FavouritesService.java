package com.my.miniProj.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.miniProj.model.FavouritesDAO;

@Service
public class FavouritesService {
	@Autowired
	private FavouritesDAO favouritesDAO;
	
	public void delete(Map<String, Object> idNameMap) {
		favouritesDAO.delete(idNameMap);
	}
	
	public void add(Map<String, Object> idNameMap) {
		favouritesDAO.add(idNameMap);
	}

}
