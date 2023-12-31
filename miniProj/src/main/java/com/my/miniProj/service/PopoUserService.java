package com.my.miniProj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.miniProj.model.AdminDTO;
import com.my.miniProj.model.Pages;
import com.my.miniProj.model.PopoUserDAO;
import com.my.miniProj.model.PopoUserDTO;

@Service
public class PopoUserService{

	@Autowired
    private PopoUserDAO popoUserDAO;
    
    public String findId(String name, String email) {
    	return popoUserDAO.findId(name, email);
    }
    public int checkDuplicate(String id) {
    	return popoUserDAO.checkDuplicate(id);
    }
    public void registerUser(PopoUserDTO popo) {
    	popoUserDAO.registerUser(popo);
    }
    
    // 회원 정보 수정
    public void updateInfo(PopoUserDTO popo) {
    	popoUserDAO.updateInfo(popo);
    }
    
    // 회원 관리 목록
    public List<PopoUserDTO> popoList(Pages pages) throws Exception {
		List<PopoUserDTO> popoList = popoUserDAO.popoList(pages);
    	return popoList;
    }    
    
    public int countUsers() {
    	return popoUserDAO.countUsers();
    }
    
    // popoUser 차단
    public void popoBan(int popoNum) {
    	popoUserDAO.banUser(popoNum);
    }
    
    // popoUser 차단해제
    public void popoUnban(int popoNum) {
    	popoUserDAO.unbanUser(popoNum);
	}
    
    public int checkBan(String id) {
    	return popoUserDAO.checkBan(id);

    }
  
	public PopoUserDTO loginAction(String id, String pw) {
		return popoUserDAO.loginAction(id, pw);		
	}

	public void quitUser(PopoUserDTO popo) {
		popoUserDAO.quitUser(popo);		
	}
	
	public int checkDuplicateEmail(String email) {
		return popoUserDAO.checkDuplicateEmail(email);
	}
	public PopoUserDTO getPopoById(String id) {
		return popoUserDAO.getPopoById(id);
	}
 
	public AdminDTO adminLoginAction(String id, String pw) {
		return popoUserDAO.adminLoginAction(id, pw);
	}
}
