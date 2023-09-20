package com.my.miniProj.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.my.miniProj.model.PopoUserDAO;
import com.my.miniProj.model.PopoUserDTO;

@Service
public class PopoUserService{

	@Autowired
    private PopoUserDAO popoUserDAO;
    
    public String findId(String name, String email) {
    	return popoUserDAO.findId(name, email);
    }
    public void updatePassword(PopoUserDTO popo) {
    	popoUserDAO.updatePassword(popo);
	}
    public PopoUserDTO readByUserId(String id) {
    	return popoUserDAO.readByUserId(id);
    }
    public int checkDuplicate(String id) {
    	return popoUserDAO.checkDuplicate(id);
    }
    public void registerUser(PopoUserDTO popo) {
    	popoUserDAO.registerUser(popo);
    }
    public void createAuth() {
    	popoUserDAO.createAuth();
    }
    public PopoUserDTO getUserById(String id) {
    	return popoUserDAO.getUserById(id);
    }
    public void updateInfo(PopoUserDTO popo) {
    	popoUserDAO.updateInfo(popo);
    }
    public List<PopoUserDTO> listUsers(){
    	return popoUserDAO.listUsers();
    }
    public int countUsers() {
    	return popoUserDAO.countUsers();
    }
    public PopoUserDTO getUserDetails(int num) {
    	return popoUserDAO.getUserDetails(num);
    }
    public void banUser(int num) {
    	popoUserDAO.banUser(num);
    }
    public List<PopoUserDTO> listBanned(){
    	return popoUserDAO.listBanned();
    }
    public List<PopoUserDTO> listQuit(){
    	return popoUserDAO.listQuit();
    }
	public int loginAction(String id, String pw) {
		int result = popoUserDAO.loginAction(id, pw);
		return result;		
	}
    

}
