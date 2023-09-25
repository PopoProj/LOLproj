package com.my.miniProj.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper 
public interface PopoUserDAO {

	    public String findId(@Param("name") String name, @Param("email") String email);
//	    public void updatePassword(PopoUserDTO popo);
//	    public PopoUserDTO readByUserId(String id);
	    public int checkDuplicate(String id);
	    public void registerUser(PopoUserDTO popo);
//	    public void createAuth();
//	    public PopoUserDTO getUserById(String id);
	    
	    // 회원 정보 수정
	    public void updateInfo(PopoUserDTO popo);
	    
	    // 회원 관리 목록
	    public List<PopoUserDTO> popoList(Pages pages) throws Exception;
	   
	    public int countUsers();
	    
	    // 회원 차단
	    public void banUser(int popoNum);
	    
	    // 회원 차단해제
	    public void unbanUser(int popoNum);
	    
//	    public List<PopoUserDTO> listBanned();
//	    public List<PopoUserDTO> listQuit();
		public PopoUserDTO loginAction(@Param("id") String id, @Param("pw") String pw);
}

