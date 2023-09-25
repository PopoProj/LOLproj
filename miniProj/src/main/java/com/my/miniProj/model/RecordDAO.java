package com.my.miniProj.model;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RecordDAO {
	public void deleteRec(RecordDTO recUser);
	public void addRec(RecordDTO recUser);
	public void deleteOldRec(int popoNum);
	public int countRec(int popoNum);
	public List<RecordDTO> listRec(int popoNum);
	public int checkDupRec(RecordDTO recUser);
	
}
