package com.anim.clinic.client.user;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anim.clinic.client.user.biz.UserBean;
import com.anim.clinic.client.user.biz.UserDAO;

@Controller
public class UserController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@RequestMapping(value = "/cjoin.action", method = RequestMethod.POST)
	public String joinAction(HttpServletRequest req, HttpServletResponse res, HttpSession session, Model model) {
		try {

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

			String u_id = req.getParameter("u_id");
			String u_pw = req.getParameter("u_pw");
			String u_name = req.getParameter("u_name");
			String u_email = req.getParameter("u_email");
			String u_tel = req.getParameter("u_tel");
			String u_birthStr = req.getParameter("u_birth");
			String u_ageStr = req.getParameter("u_age");
			String u_gender = req.getParameter("u_gender");
			String u_post = req.getParameter("u_post");
			String roadAddress = req.getParameter("roadAddress");
			String detailAddress = req.getParameter("detailAddress");
			String u_addr = roadAddress + " " + detailAddress;

			Date u_birth = dateFormat.parse(u_birthStr);
			int u_age = Integer.parseInt(u_ageStr);

			UserBean vo = new UserBean();
			vo.setU_id(u_id);
			vo.setU_pw(u_pw);
			vo.setU_name(u_name);
			vo.setU_email(u_email);
			vo.setU_tel(u_tel);
			vo.setU_birth(u_birth);
			vo.setU_age(u_age);
			vo.setU_gender(u_gender);
			vo.setU_post(u_post);
			vo.setU_addr(u_addr);

			session.setAttribute("u_id", u_id);
			UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
			dao.insert(vo);

			return "client/user/clogin";
		} catch (ParseException e) {
			e.printStackTrace();
			model.addAttribute("exception", e);
			return "client/user/error";
		}
	}

	@RequestMapping(value = "/clientLogin.action", method = RequestMethod.POST)
	public String cLoginAction(HttpServletRequest req, HttpServletResponse res, HttpSession session, Model model) {
		try {

			String u_id = req.getParameter("u_id");
			String u_pw = req.getParameter("u_pw");
			session.setAttribute("u_id", u_id);

			System.out.println("세션에 저장된 사용자 아이디: " + session.getAttribute("u_id"));

			UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
			UserBean userId = dao.pickId(u_id);

			String getUserId = (String) userId.getU_id();
			String getUserPw = (String) userId.getU_pw();
			System.out.println("getUserPw : " + getUserPw); 
			if (getUserId.equals("admin") && getUserPw.equals(u_pw)) { 
				String referrer = (String) session.getAttribute("referrer");
				if (referrer != null) {
					return referrer;
				}
				
				return "redirect:/aindex";
			}

			if (userId != null) {
				String userPw = userId.getU_pw();
				if (u_pw.equals(userPw)) {
					System.out.println(u_id + "가 로그인 했습니다.");
					System.out.println("userId의 값이" + userId + " 입니다.");
					model.addAttribute("message", u_id + "님이 로그인 되었습니다 환영합니다!");
					return "client/user/cindex";
				} else {
					System.out.println("패스워드가 일치하지 않습니다. 다시 입력해주세요");
					session.removeAttribute("u_id");
					model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
					return "client/user/clogin";
				}
			} else {
				System.out.println("u_id의 값이" + u_id + " 입니다.");
				System.out.println("userId의 값이" + userId + " 입니다.(없음)");
				session.removeAttribute("u_id");
				model.addAttribute("message", "가입 된 정보가 없습니다 회원가입 하세요.");
				return "client/user/clogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("exception", e);
			return "client/user/error";
		}

	}

	@RequestMapping(value = "/clientLogout.action", method = RequestMethod.GET)
	public String logoutMainGET(HttpSession session) {

		session.removeAttribute("u_id");

		System.out.println("현재 세션에 아이디: " + session.getAttribute("u_id"));
		return "redirect:/index.jsp";

	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		String u_id = (String) session.getAttribute("u_id");

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserBean n = dao.detail(u_id);
		model.addAttribute("myDetail", n);
		return "client/user/mypage";
	}

	@RequestMapping(value = "/cjoin", method = RequestMethod.GET)
	public String join() {
		return "client/user/cjoin";
	}

	@RequestMapping(value = "/cindex", method = RequestMethod.GET)
	public String cindex() {
		return "client/user/cindex";
	}

	@RequestMapping(value = "/clogin", method = RequestMethod.GET)
	public String login() {
		return "client/user/clogin";
	}

	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "client/user/findId";
	}

	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPw() {
		return "client/user/findPw";
	}

}
