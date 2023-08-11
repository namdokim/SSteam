package com.ss.demo.controller;

import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ss.demo.domain.UserVO;
import com.ss.demo.service.MailSendService;
import com.ss.demo.service.UserService;

@Controller
@RequestMapping(value="/User")
public class UserController 
{
	// 유저 서비스 
	@Autowired
	UserService us;
	
	// 이메일 서비스 불러오기
	@Autowired
	private MailSendService mailService;
	
	// 암호화 
	@Autowired
	BCryptPasswordEncoder rbcryptPasswordEncoder;
	

	
	//메인 화면 
	@RequestMapping(value="index.do")
	public String Home()
	{
		return "index";
	}
	
	// 회원가입 페이지 이동 (노멀)
	@RequestMapping(value="/userJoin.do" )
	public String userJoin(@RequestParam("uType") String uType
			
			)
	{
		System.out.println("uType: " +uType);
		System.out.println("실행여부");
		return "User/userJoin";
	}
	// 회원가입 페이지 이동 (비지니스)
	@RequestMapping(value="/userJoin_business.do" )
	public String userJoin_business(@RequestParam("uType") String uType
			
			)
	{
		System.out.println("uType: " +uType);
		System.out.println("실행여부");
		return "User/userJoin_business";
	}
	// 회원가입시 개인정보및 타입 지정 페이지
	@RequestMapping(value="/joinCheck.do" )
	public String joinCheck(
			
			)
	{
		System.out.println("실행여부");
		return "User/joinCheck";
	}
	//회원가입 처리
	@RequestMapping(value="/userJoinAction.do")
	public String userJoinAction( UserVO uv,
			HttpServletRequest requset,
			@RequestParam("uId_email") String uId_email,
			@RequestParam("uType") String uType
			)
	{
		//서블릿 퀘스트에 담긴 session 가져 오기 
		HttpSession session = requset.getSession();
		
		//선택된 이메일 도메인을 가져와서 id text와 합체 시키기 
		String id = uv.getuId() + uv.getuId_email();
		System.out.println("id : " + id);
		System.out.println("uType: " +uType);
		System.out.println(uv.getuId());
		if(uv.getuId() == null || uv.getuId().equals(""))
		{
			System.out.println("회원가입 오류 ");
			return "index";
		}
		uType.replace(",", "").trim();
		String uPw = rbcryptPasswordEncoder.encode(uv.getuPw());
		uv.setuId(id);
		uv.setuPw(uPw);
		uv.setuType(uType);
		System.out.println("uType: " +uType);
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
	//에이작스로 안 할떄 현재 미사용 
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
		return "redirect:/";
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
		UserVO uv = new UserVO();
		System.out.println("uId="+uId);
		System.out.println("uv.getuId()="+uv.getuId());
		uv.getuId();
		UserVO loginVO = us.userONE(uv);
		System.out.println("loginVO="+loginVO);
		if( uId != null && uId.contains("@") == false)
		{
			
			System.out.println("uId"+uId);
			System.out.println("uv"+uv);
		}

		int cnt = us.uIdCheck(uId);
		String value = null;
		value = "{\"uId\":\""+cnt+"\"}";
		
		return value;
	}
	
	// 유저 이메일 인증하기 
	@ResponseBody
	@RequestMapping(value="/emailAuth.do")
	public String emailAuth(
			@RequestParam(value= "uId",  required=false) String uId
			)
	{
		
		System.out.println("이메일 인증 요청 들어옴");
		System.out.println("emailAuth="+uId);
		return mailService.joinmail(uId);
	}
	//유저 인증번호 확인 
	
	
	
	// 유저 로그인 시  비밀번호 체크
	@ResponseBody
	@RequestMapping(value="/uPwCheck.do")
	public UserVO uPwCheck(
			@RequestParam("uId") String uId,
			@RequestParam("uPw") String uPw
			)
	{
		//UserVO loginVO = us.uPwCheck(uId);
		UserVO value = us.uPwCheck(uId);
		System.out.println("uPw"+uPw);
		System.out.println(value.getuPw());
		if( rbcryptPasswordEncoder.matches(uPw, value.getuPw()) )
		{
			System.out.println("value"+value);
			return value;
		}
		return null;
	}
	// 로그인 에이작스
	@ResponseBody
	@RequestMapping(value="/loginFn.do", method=RequestMethod.POST)
	public String loginFn(UserVO uv, HttpServletRequest req, HttpSession session, Model model)
	{
		
		UserVO login = us.userlogin(uv);
		System.out.println("login"+login);
		System.out.println("login="+uv.getuId());
		System.out.println("login="+uv.getuPw());
		if(login == null)
		{
			System.out.println("잘못 된 값 입력");
			return "FAIL";
		}
		boolean pwdcheck = rbcryptPasswordEncoder.matches(uv.getuPw(), login.getuPw());
		
		System.out.println("login" + pwdcheck);
		if (login.getuDely().equals("Y")) {
			System.out.println("login" + login);
			return "FAIL2";
		} else if (login.getuPw() == null) {
			System.out.println("login" + login);
			return "SOCIAL";
		} else if (pwdcheck == true) {
			session = req.getSession();
			session.setAttribute("login", login);
			// defalut 1800
			session.setMaxInactiveInterval(3600);
			return "Y";
		} else {
			return "FAIL";
		}
	} //로그인 끝
	
	//마이페이지 이동 
	@RequestMapping(value="/mypage.do")
	public String mypage(UserVO uv, HttpServletRequest req, HttpSession session, Model model
			)
	{
		UserVO login = (UserVO)session.getAttribute("login");
		System.out.println("mypage="+login);
		if(login !=null)
		{
			return "User/mypage";
		}else
		{
			
			return "redirect:/";
		}
	}
	// 회원 프로필 이동 
	@RequestMapping(value="/profile.do")
	public String profile(UserVO uv, HttpServletRequest req, HttpSession session, Model model
			)
	{
		UserVO login = (UserVO)session.getAttribute("login");
		if(login !=null)
		{
			System.out.println("profile="+login);
			return "User/userProfile";
		}else
		{
			
			return "redirect:/";
		}
	}
	// 회원 좋아요 이동
	@RequestMapping(value="/great.do")
	public String great(UserVO uv, HttpServletRequest req, HttpSession session, Model model
			)
	{
		UserVO login = (UserVO)session.getAttribute("login");
		System.out.println("great="+login);
		if(login !=null)
		{
			return "User/userGreat";
		}else
		{
			
			return "redirect:/";
		}
	}
	//회원 리뷰 이동 
	@RequestMapping(value="/review.do")
	public String review(UserVO uv, HttpServletRequest req, HttpSession session, Model model
			)
	{
		UserVO login = (UserVO)session.getAttribute("login");
		System.out.println("review="+login);
		if(login !=null)
		{
			return "User/userReview";
		}else
		{
			
			return "redirect:/";
		}
	}
	// 회원 결제 현황 이동 
	@RequestMapping(value="/payment.do")
	public String Payment(UserVO uv, HttpServletRequest req, HttpSession session, Model model
			)
	{
		UserVO login = (UserVO)session.getAttribute("login");
		System.out.println("Payment"+login);
		if(login !=null)
		{
			return "User/userPayment";
		}else
		{
			
			return "redirect:/";
		}
	}
	// 회원 프로필 사진 수정 
	// 억까로 되네. 파일 관련은 공부 좀 해야 겟다 너 말이야 너!!! 너!!!! 너,임마!
	@RequestMapping(value="/profileimg.do")
	public String profile_modify(UserVO uv, 
			@RequestParam("myprofileimg") MultipartFile myprofileimg,
			@RequestParam Map<String, Object> map,
			MultipartHttpServletRequest multireq,
			HttpServletRequest req, 
			RedirectAttributes ra,
			HttpSession session, Model model
			)
	{
		
		System.out.println("filefirst="+myprofileimg);
		UserVO login = (UserVO)session.getAttribute("login");
		// 웹 접근경로 (프로젝트 경로로 시작해서)
		String webPath="/resources/images/userprofile/";
		// 서버 저장 폴더경로
		// 프로젝트 절대경로뒤 웹 접근경로가 합쳐짐 
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		
		System.out.println("folderPath="+folderPath);
 		// 파일 이름 
		//map에 경로2개 이미지 del 회원번호 담기
		map.put("standfile", login.getuImg());
		map.put("webPath", webPath);
		map.put("folderPath", folderPath);
		map.put("myprofileimg", myprofileimg);
		map.put("uNo", login.getuNo());
		//쿼리문 실행
		System.out.println("map="+map.get(myprofileimg));
		System.out.println("login=="+login.getuImg());
		
		int result = us.profileimg(map);
		
		String message = null;
		if( result > 0)
		{
			message = "프로필 이미지 변경 완료 ";
			uv.setuImg( (String)map.get("myprofileimg"));
		}else {
			message = "변경 실패";
		}
		ra.addFlashAttribute("message",message);
		return "redirect:profile.do";
		
	}
}
