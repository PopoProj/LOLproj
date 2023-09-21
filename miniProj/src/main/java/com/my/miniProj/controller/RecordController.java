package com.my.miniProj.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.miniProj.model.PopoUserDTO;
import com.my.miniProj.model.RecordDTO;
import com.my.miniProj.service.RecordService;

@Controller
public class RecordController {
	
	@Autowired
	private RecordService recordService;
	
	@GetMapping("/deleteRec")
	public void deleteRec(HttpServletRequest request, RecordDTO recUser) {
		recordService.deleteRec(recUser);
	}
	
	@GetMapping("/addRec")
	public String addRec(HttpServletRequest request, String sumName) {
		
		RecordDTO newRecord = (RecordDTO) request.getAttribute("userRecord");
		System.out.println("in recCont:" + newRecord);
		HttpSession session = request.getSession(false);
		PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
		int popoNum = loginMember.getPopoNum();
		int count = recordService.countRec(popoNum);
		int dupCount = recordService.checkDupRec(newRecord);
		
		if (dupCount == 0) {
			if (count >= 10) {
				recordService.deleteOldRec();
			}
			recordService.addRec(newRecord);
		}
		
		return "searchResult";
	}
	
	
	@GetMapping("/toRecord")
	public String toRecord(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
		List<RecordDTO> recList = recordService.listRec(loginMember.getPopoNum());
		request.setAttribute("recordList", recList);
		return "viewRecord";
	}
	
	

}
