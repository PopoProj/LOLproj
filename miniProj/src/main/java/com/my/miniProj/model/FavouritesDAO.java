package com.my.miniProj.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;



@Mapper
public interface FavouritesDAO {
	public void deleteFav(FavouritesDTO fav);
	public void addFav(FavouritesDTO fav);
	public int countFav(int popoNum);
	public List<FavouritesDTO> listFav(int popoNum);
	public int checkDupfav(FavouritesDTO fav);
	}

