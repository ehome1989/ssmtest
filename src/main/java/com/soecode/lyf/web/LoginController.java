package com.soecode.lyf.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(HttpSession session,String username,String password,Model model){
		session.setAttribute("username", username);
		model.addAttribute("username", username);
		return "redirect:book/list";
	}
	
	@RequestMapping(value="/logout",method = RequestMethod.POST)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/WEB-INF/jsp/login.jsp";
	}
}
