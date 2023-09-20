package com.my.miniProj.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.my.miniProj.service.RecordService;

@Controller
public class RecordController {
	
	@Autowired
	private RecordService recordService;
	
	@RequestMapping("/deleteRec")
	//idNameMap = {popoId=int, sumName=String}
	public void delete(Map<String, Object> idNameMap) {
		recordService.delete(idNameMap);
	}
	
	@RequestMapping("/addRec")
	public void add(Map<String, Object> idNameMap) {
		recordService.add(idNameMap);
	}
	
	

}
