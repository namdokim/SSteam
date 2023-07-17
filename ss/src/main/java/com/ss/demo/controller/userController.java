package com.ss.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.demo.domain.userVO;
import com.ss.demo.service.UserService;

@Controller
public class userController 
{
	// 유저 서비스 
	@Autowired
	private UserService us;
	
	// 암호화 
	@Autowired
	private BCryptPasswordEncoder rbcryptPasswordEncoder;
	
	
	//메인 화면 
	@RequestMapping(value="index.do")
	public String Home()
	{
		return "index";
	}
	// 회원가입 페이지 이동 
	@RequestMapping(value="/User/userJoin.do" )
	public String userJoin(
			
			)
	{
		System.out.println("실행여부");
		return "User/userJoin";
	}
	//회원가입 처리
	@RequestMapping(value="User/userJoinAction.do")
	public String userJoinAction( userVO uv
			
			)
	{
		String uPw = rbcryptPasswordEncoder.encode(uv.getuPw());
		uv.setuPw(uPw);
		int value = us.userInsert(uv);
		return "redirect:../index.do";
	}
	//로그인 화면
	@RequestMapping(value="/User/userLogin.do")
	public String userLogin(
			
			)
	{
		return "User/userLogin";
	}
	//로그인 처리
	@RequestMapping(value="/User/userLoginAction.do", method = {RequestMethod.POST})
	public String userLoginAction(@RequestParam("uId") String uId,
			@RequestParam("uPw") String uPw,
			HttpServletRequest requset,
			Model model
			)
	
	{
		userVO uv = us.userlogin(uId);
		System.out.println("login: " +uv);
		System.out.println("upw"+ uv.getuPw());
		System.out.println("uPw" +rbcryptPasswordEncoder.matches(uPw, uv.getuPw()));
		if(uv != null && rbcryptPasswordEncoder.matches(uPw, uv.getuPw()))
		{
			System.out.println("로그인 성공  ");
			requset.getSession().setAttribute("uNo", uv.getuNo());
			requset.getSession().setAttribute("uId", uv.getuId());
			requset.getSession().setAttribute("uName", uv.getuName());
			requset.getSession().setAttribute("uNick", uv.getuNick());
			model.addAttribute(uv);
		}else
		{
			System.out.println("로그인 실패");
			return "redirect:../User/userLogin.do";
		}
		return "redirect:../index.do";
	}
	
	//유저 로그아웃
	@RequestMapping(value="/User/userLogoutAction.do")
	public String userLogoutAction(HttpServletRequest request,
			HttpSession session
			)
	{
		try {
			session.invalidate();
			System.out.println("로그아웃 종료");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:../index.do";
	}
}
