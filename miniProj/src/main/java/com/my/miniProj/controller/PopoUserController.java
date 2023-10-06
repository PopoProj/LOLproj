package com.my.miniProj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.my.miniProj.model.AdminDTO;
import com.my.miniProj.model.PopoUserDAO;
import com.my.miniProj.model.PopoUserDTO;
import com.my.miniProj.service.PopoUserService;

@Controller
public class PopoUserController {

	@Autowired
    private PopoUserService popoUserService;

	@GetMapping("/login")
	public String login(HttpServletRequest request, HttpSession session) {
		AdminDTO admin = (AdminDTO) session.getAttribute("adminLogin");
		if (admin != null) {
			return "needAdminLogout";
		}
		return "login";
	}
	
	@PostMapping(value = "/loginAction")
	public String loginAction(HttpServletRequest request) {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		PopoUserDTO popo = popoUserService.loginAction(id, pw);
		request.setAttribute("result", popo);
		int isBanned = popoUserService.checkBan(id);
		if(isBanned == 1) {
			return "bannedUser";
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("userSessionID", popo);
			return "loginAction";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		return "logoutAction";
	}
	
	@GetMapping("/toMyPage")
	public String toMyPage(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			return "needLogin";
		}
		
		PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
		if (loginMember == null) {
			return "needLogin";
		}

		request.setAttribute("userNickName", loginMember.getPopoNickname());
		return "myPage";
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
   
    @GetMapping("/checkDuplicate")
    public String checkDuplicate(HttpServletRequest request) {
    	String id = request.getParameter("id");
    	System.out.println(id);
    	int duplCount = popoUserService.checkDuplicate(id);
    	request.setAttribute("duplCount", duplCount);
    	request.setAttribute("id", id);
    	return "checkDuplicate";
    }
  
    @GetMapping("/checkDuplicateEmail")
    public String checkDuplicateEmail(HttpServletRequest request) {
    	String email = request.getParameter("email");
    	int duplCount = popoUserService.checkDuplicateEmail(email);
    	request.setAttribute("duplCount", duplCount);
    	request.setAttribute("email", email);
    	return "checkDuplicateEmail";
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
    
    // 내 정보 보기
    @GetMapping("/toMyInfo")
    public String toMyInfo(HttpServletRequest request, Model model) throws Exception {
    	
    	// 세션으로 로그인 한 id 가져오기
    	HttpSession session = request.getSession(false);
    	PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
    	String id = loginMember.getPopoId();
    	
    	// id로 db에서 popo 객체 생성하기
    	PopoUserDTO popouser = popoUserService.getPopoById(id);
    	model.addAttribute("myInfo", popouser);
    	
    	return "myInfo";
    }
    
    // 내 정보 수정 페이지
    @GetMapping("myInfoEditForm")
    public String myInfoEditForm (HttpServletRequest request, Model model) throws Exception {
    	
    	HttpSession session = request.getSession(false);
    	PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
 
    	model.addAttribute(model.addAttribute("myInfo", loginMember));
    	
    	return "myInfoEdit";
    }
    

    // 내 정보 수정
    @RequestMapping(value = "/myInfoEdit", method = RequestMethod.POST)
	public String modify(PopoUserDTO popo) throws Exception {

		popoUserService.updateInfo(popo);
		
		return "redirect:/toMyInfo";
	}

    @GetMapping("/confirmQuit")
	public String confirmQuit() {

		return "confirmQuit";
	}

    @GetMapping("/quitUser")
    public String quitUser(HttpServletRequest request) {
    	HttpSession session = request.getSession(false);
    	PopoUserDTO loginMember = (PopoUserDTO) session.getAttribute("userSessionID");
    	popoUserService.quitUser(loginMember);
    	session.invalidate();
    	return "quitComplete";
    }

}
