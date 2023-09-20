package com.my.miniProj.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.miniProj.model.RecordDAO;

@Service
public class RecordService {
	@Autowired
	private RecordDAO recordDAO;
	
	public void delete(Map<String, Object> idNameMap) {
		recordDAO.delete(idNameMap);
	}
	
	public void add(Map<String, Object> idNameMap) {
		recordDAO.add(idNameMap);
	}

}
