package com.my.miniProj.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.miniProj.model.FavouritesDAO;
import com.my.miniProj.model.FavouritesDTO;

@Service
public class FavouritesService {
	@Autowired
	private FavouritesDAO favouritesDAO;
	
	public void deleteFav(FavouritesDTO fav) {
		favouritesDAO.deleteFav(fav);
	}
	
	public void addFav(FavouritesDTO fav) {
		favouritesDAO.addFav(fav);
	}

	public int countFav(int popoNum) {
		return favouritesDAO.countFav(popoNum);
	}
	
	public List<FavouritesDTO> listFav(int popoNum){
		return favouritesDAO.listFav(popoNum);
	}

	public int checkDupfav(FavouritesDTO fav) {
		return favouritesDAO.checkDupfav(fav);
	}
}
