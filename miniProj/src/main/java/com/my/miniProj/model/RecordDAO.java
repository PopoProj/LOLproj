package com.my.miniProj.model;


import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RecordDAO {
	public void delete(Map<String, Object> idNameMap);
	public void add(Map<String, Object> idNameMap);
	
}
