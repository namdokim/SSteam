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

import com.ss.demo.domain.UserVO;
import com.ss.demo.service.UserService;

@Controller
@RequestMapping(value="/User")
public class UserController 
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
	@RequestMapping(value="/userJoin.do" )
	public String userJoin(
			
			)
	{
		System.out.println("실행여부");
		return "User/userJoin";
	}
	//회원가입 처리
	@RequestMapping(value="/userJoinAction.do")
	public String userJoinAction( UserVO uv,
			HttpServletRequest requset,
			@RequestParam("uId_email") String uId_email
			)
	{
		//서블릿 퀘스트에 담긴 session 가져 오기 
		HttpSession session = requset.getSession();
		
		//선택된 이메일 도메인을 가져와서 id text와 합체 시키기 
		String id = uv.getuId() + uv.getuId_email();
		System.out.println("id : " + id);
		System.out.println(uv.getuId());
		if(uv.getuId() == null || uv.getuId().equals(""))
		{
			System.out.println("회원가입 오류 ");
			return "index";
		}
		
		String uPw = rbcryptPasswordEncoder.encode(uv.getuPw());
		uv.setuId(id);
		uv.setuPw(uPw);
		
		int value = us.userInsert(uv);
		return "redirect:/";
	}
	//로그인 화면
	@RequestMapping(value="/userLogin.do")
	public String userLogin(
			
			)
	{
		return "User/userLogin";
	}
	//로그인 처리
	@RequestMapping(value="/userLoginAction.do", method = {RequestMethod.POST})
	public String userLoginAction(UserVO uv,
			@RequestParam("uId") String uId,
			@RequestParam("uPw") String uPw,
			HttpServletRequest requset,
			Model model
			)
	{
		//서블릿 퀘스트에 담긴 session 가져 오기 
		HttpSession session = requset.getSession();
		// 유저 로그인 정보 가져오기
			UserVO loginVO = us.userlogin(uv);
			if(loginVO == null)
			{
				System.out.println("가고 오는 값이 많아서 안됨");
				return "redirect:../User/userLogin.do";
			}
			
			// 로그인 시 유효성검사
			System.out.println("login: " +loginVO);
			
			if(loginVO != null && rbcryptPasswordEncoder.matches(uPw, loginVO.getuPw()))
			{
				System.out.println("로그인 성공  ");
				//로그인 된 정보들의 특정 컬럼들의 값을 따로 따로 집어넣어준다 
				/*
			requset.getSession().setAttribute("uNo", uv.getuNo());
			requset.getSession().setAttribute("uId", uv.getuId());
			requset.getSession().setAttribute("uName", uv.getuName());
			requset.getSession().setAttribute("uNick", uv.getuNick());
			model.addAttribute(loginVO);
				*/
				// 로그인 된 정보를 session에 담아준다  (쿼리문에서 select 할 값들을 따로 지정해서 그 값들만 담을수 있다 )
				session.setAttribute("login", loginVO);
			}else 
			{
				System.out.println("로그인 실패 비밀번호만 틀림 ");
				return "redirect:../User/userLogin.do";
			}

		return "redirect:/";
	}
	
	//유저 로그아웃
	@RequestMapping(value="/userLogoutAction.do")
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
		return "redirect:index.do";
	}
	
	//유저 닉네임 중복체크
	@ResponseBody
	@RequestMapping(value="/uNickCheck.do")
	public String uNickCheck(
			@RequestParam("uNick") String uNick
			)
	{
		UserVO uv = new UserVO();
		System.out.println(uv.getuId());
		String value =null;
		
		int cnt = us.uNickCheck(uNick);
		//제이슨 형식으로 값 집어넣어서 ajax에서 불러오기
		value = "{\"uNick\":\""+cnt+"\"}";
		return value;
	}
	// 유저 id 중복체크
	@ResponseBody
	@RequestMapping(value="/uIdCheck.do")
	public String uIdCheck(
			@RequestParam("uId") String uId

			)
	{
		if( uId != null && uId.contains("@") == false)
		{
			
			System.out.println("uId"+uId);
			UserVO uv = us.userONE(uId);
			System.out.println("uv"+uv);
		}

		int cnt = us.uIdCheck(uId);
		String value = null;
		value = "{\"uId\":\""+cnt+"\"}";
		
		return value;
	}
	// 유저 로그인 시  비밀번호 체크
	@ResponseBody
	@RequestMapping(value="/uPwCheck.do")
	public UserVO uPwCheck(UserVO uv,
			@RequestParam("uPw") String uPw
			)
	{
		UserVO loginVO = us.uPwCheck(uPw);
		UserVO value = us.uPwCheck(uPw);
		if(rbcryptPasswordEncoder.matches(uPw, loginVO.getuPw()))
		{
			return value;
		}
		return null;
	}
	//최종 서브밋 검사
	@RequestMapping(value="/submitAction.do")
	public String submitAction(
			
			)
	{
		return "redirect:../index.do";
	}
}
