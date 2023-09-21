package com.my.miniProj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.my.miniProj.model.FavouritesDTO;
import com.my.miniProj.model.PopoUserDTO;
import com.my.miniProj.service.FavouritesService;

@Controller
public class FavouritesController {
	
	@Autowired
	private FavouritesService favouritesService;
	
	@GetMapping("/deleteFav")
	public String delete(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
		String sumName = request.getParameter("sumName");
		FavouritesDTO fav = new FavouritesDTO();
		fav.setPopoNum(loginMember.getPopoNum());
		fav.setSumName(sumName);
		favouritesService.deleteFav(fav);
		return "deleteAction";
	}
	
	@GetMapping("/addFav")
	public String add(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
		int popoNum = loginMember.getPopoNum();
		String sumName = request.getParameter("sumName");
		System.out.println("This is sumName: " + sumName);
		FavouritesDTO favUser = new FavouritesDTO();
		favUser.setPopoNum(popoNum);
		favUser.setSumName(sumName);
		int numOfFavs = favouritesService.countFav(popoNum);
		int dupCount = favouritesService.checkDupfav(favUser);
		if (numOfFavs >= 5) {
			return "favLimitError";
		}
		else if(dupCount != 0){
			return "duplicateFavError";
		}
		else {
			favouritesService.addFav(favUser);
			return "addedToFav";
		}
		
	}
	
	@GetMapping("/toFavourites")
	public String toFavourites(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
		List<FavouritesDTO> favlist = favouritesService.listFav(loginMember.getPopoNum());
		request.setAttribute("favouritesList", favlist);
		return "viewFavourites";
	}
	
}
