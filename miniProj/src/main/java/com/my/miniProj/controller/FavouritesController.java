package com.my.miniProj.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.my.miniProj.service.FavouritesService;

@Controller
public class FavouritesController {
	
	@Autowired
	private FavouritesService favouritesService;
	
	@RequestMapping("/deleteFav")
	//idNameMap = {popoId=int, sumName=String}
	public void delete(Map<String, Object> idNameMap) {
		favouritesService.delete(idNameMap);
	}
	
	@RequestMapping("/addFav")
	public void add(Map<String, Object> idNameMap) {
		favouritesService.add(idNameMap);
	}
	
	
}
