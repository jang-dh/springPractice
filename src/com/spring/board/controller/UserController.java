package com.spring.board.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.service.UserService;
import com.spring.board.vo.UserVo;

@Controller
public class UserController {

	@Autowired 
	UserService userService;
	/**
	 * 
	 */
	
	@RequestMapping(value = "/user/joinForm.do", method = RequestMethod.GET)
	public String joinForm(Locale locale, Model model) throws Exception{
		return "board/joinForm";
	}
	
	@RequestMapping(value = "/user/loginForm.do", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) throws Exception{
		return "board/loginForm";
	}
	
	/**
	 * 
	 */
	@RequestMapping(value = "/user/idCheck.do", produces="text/plain; charset=UTF-8")
	@ResponseBody
	public String idCheck(String userId) throws Exception{
		String pi = "";
		UserVo userVo = userService.idCheck(userId);
		if(userVo!=null) {
			pi ="impossible";
		}else {
			pi ="possible";
		}
		return pi;
	}
	
	@RequestMapping(value = "/user/join.do", produces="text/plain; charset=UTF-8", method = RequestMethod.POST)
	public String join(HttpServletRequest request, UserVo userVo) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println(userVo.getUserName());
		userService.join(userVo);
		return "redirect:/board/boardList.do";
	}
	
	@RequestMapping(value = "/user/login.do")
	@ResponseBody
	public String login(UserVo userVo, HttpSession session) throws Exception{
		
		
		String pi = "";
		UserVo getUserVo = userService.login(userVo);
		session.setAttribute("user", getUserVo);
		if(getUserVo!=null) {
			pi ="success";
		}else {
			pi ="fail";
		}
		return pi;
		
	}
	
	@RequestMapping(value = "/user/logout.do")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/board/boardList.do";
	}
	
	@ExceptionHandler(Exception.class)
	public String nullex(Exception e) { 
		System.err.println(e.getClass()); 
		return "/board/errorPage"; 
	}
}
