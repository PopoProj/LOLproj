package com.my.miniProj.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.miniProj.model.RecordDAO;
import com.my.miniProj.model.RecordDTO;

@Service
public class RecordService {
	@Autowired
	private RecordDAO recordDAO;
	
	public void deleteRec(RecordDTO recUser) {
		recordDAO.deleteRec(recUser);
	}
	
	public void addRec(RecordDTO recUser) {
		recordDAO.addRec(recUser);
	}
	
	public void deleteOldRec(int popoNum) {
		recordDAO.deleteOldRec(popoNum);
	}
	
	public int countRec(int popoNum) {
		return recordDAO.countRec(popoNum);
	}
	public List<RecordDTO> listRec(int popoNum) {
		return recordDAO.listRec(popoNum);
	}
	
	public int checkDupRec(RecordDTO recUser) {
		return recordDAO.checkDupRec(recUser);
	}

}
