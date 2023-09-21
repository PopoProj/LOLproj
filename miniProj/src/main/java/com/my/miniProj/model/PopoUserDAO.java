package com.my.miniProj.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper 
public interface PopoUserDAO {

	    public String findId(@Param("name") String name, @Param("email") String email);
	    public void updatePassword(PopoUserDTO popo);
	    public PopoUserDTO readByUserId(String id);
	    public int checkDuplicate(String id);
	    public void registerUser(PopoUserDTO popo);
	    public void createAuth();
	    public PopoUserDTO getUserById(String id);
	    public void updateInfo(PopoUserDTO popo);
	    public List<PopoUserDTO> listUsers();
	    public int countUsers();
	    public PopoUserDTO getUserDetails(int num);
	    public void banUser(int num);
	    public List<PopoUserDTO> listBanned();
	    public List<PopoUserDTO> listQuit();
		public int loginAction(@Param("id") String id, @Param("pw") String pw);
}
