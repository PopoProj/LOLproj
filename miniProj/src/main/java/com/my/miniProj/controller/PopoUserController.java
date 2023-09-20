package com.my.miniProj.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.servlet.ModelAndView;

import com.my.miniProj.model.PopoUserDTO;
import com.my.miniProj.service.PopoUserService;

@Controller
public class PopoUserController {

	
	@Autowired
    private PopoUserService popoUserService;
    
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/loginAction")
	public String loginAction(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int result = popoUserService.loginAction(id, pw);
		request.setAttribute("result", result);
		return "loginAction";
	}
	
	@GetMapping("/inputForId")
	public String inputForId() {
		return "inputForId";
	}
	
    @GetMapping("/findId")
    public String findId(HttpServletRequest request) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = popoUserService.findId(name, email);
		request.setAttribute("id", id);
		return "findId";
    }
    
    @GetMapping("/updatePassword")
    public String updatePassword(PopoUserDTO popo) {
    	popoUserService.updatePassword(popo);
    	return "updatePassword";
    }
    
    @GetMapping("/readByUserId")
    public String readByUserId(String id) {
    	PopoUserDTO selUser = popoUserService.readByUserId(id);
    	return "readByUserId";
    }
    
    @GetMapping("/checkDuplicate")
    public String checkDuplicate(HttpServletRequest request) {
    	String id = request.getParameter("id");
    	System.out.println(id);
    	int duplCount = popoUserService.checkDuplicate(id);
    	request.setAttribute("duplCount", duplCount);
    	request.setAttribute("id", id);
    	return "checkDuplicate";
    }

    
	
	@GetMapping("/inputForRegister")
	public String inputForRegister() {
		return "inputForRegister";
	}
	
    @GetMapping("registerUser")
    public String registerUser(HttpServletRequest request) {
    	PopoUserDTO popo = new PopoUserDTO();
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	String name = request.getParameter("name");
    	String tel = request.getParameter("tel");
    	String email = request.getParameter("email");
    	String nickName = request.getParameter("nickName");
    	int main = Integer.parseInt(request.getParameter("main"));
    	int sub = Integer.parseInt(request.getParameter("sub"));

    	popo.setPopoId(id);
    	popo.setPopoPw(pw);
    	popo.setPopoName(name);
    	popo.setPopoTel(tel);
    	popo.setPopoEmail(email);
    	popo.setPopoNickname(nickName);
    	popo.setPopoMain(main);
    	popo.setPopoSub(sub);

    	popoUserService.registerUser(popo);
    	return "registerUser";
    }

    @GetMapping("createAuth")
    public String createAuth() {
    	popoUserService.createAuth();
    	return "createAuth";
    }
    
    @GetMapping("getUserById")
    public String getUserById(String id) {
    	PopoUserDTO selUser = popoUserService.getUserById(id);
    	return "getUserById";
    }
    
    @GetMapping("updateInfo")
    public String updateInfo(PopoUserDTO popo) {
    	popoUserService.updateInfo(popo);
    	return "updateInfo";
    }
    
    @GetMapping("listUsers")
    public String listUsers() {
    	List<PopoUserDTO> selUser = popoUserService.listUsers();
    	return "listUsers";
    }
    
    @GetMapping("countUsers")
    public String countUsers() {
    	int count = popoUserService.countUsers();
    	return "countUsers";
    }
    
    @GetMapping("getUserDetails")
    public String getUserDetails(int num) {
    	PopoUserDTO selUser = popoUserService.getUserDetails(num);
    	return "getUserDetails";
    }
    
    @GetMapping("banUser")
    public String banUser(int num) {
    	popoUserService.banUser(num);
    	return "banUser";
    }
    
    @GetMapping("listBanned")
    public String listBanned() {
    	List<PopoUserDTO> bannedUsers = popoUserService.listBanned();
    	return "listBanned";
    }
    
    @GetMapping("listQuit")
    public String listQuit() {
    	List<PopoUserDTO> quitUsers = popoUserService.listQuit();
    	return "listQuit";
    }
    
}
