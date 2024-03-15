package com.anim.clinic.admin.user;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.anim.clinic.admin.user.biz.AUserBean;
import com.anim.clinic.admin.user.biz.AUserDAO;
import com.anim.clinic.admin.user.biz.SendMail;
import com.anim.clinic.admin.user.biz.SendSMSTwilio;

@Controller
public class AUserController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final AUserDAO userDAO;

	@Autowired
	public AUserController(AUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(value = "/sendSMS.action", method = RequestMethod.POST)
	public String sendSms(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		String country = req.getParameter("country");
		String u_tel = req.getParameter("u_tel");

		int authNum = SendSMSTwilio.sendSMS(country, u_tel);

		session.setAttribute("authNum", authNum);

		return "join";
	}

	@RequestMapping(value = "/checkAuthorizationKey.action", method = RequestMethod.POST)
	public String checkAuthorizationKey(HttpServletRequest req, HttpServletResponse res, HttpSession session,
			Model model) {

		try {

			int savedAuthNum = (int) session.getAttribute("authNum");

			int submittedAuthNum = Integer.parseInt(req.getParameter("otp"));

			if (savedAuthNum == submittedAuthNum) {

				model.addAttribute("message", "인증에 성공했습니다.");
				return "join";
			} else {

				model.addAttribute("message", "인증에 실패했습니다.");
				return "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("exception", e);
			return "error";
		}
	}

	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String loginAction(HttpServletRequest req, HttpServletResponse res, HttpSession session, Model model) {
		try {

			String u_id = req.getParameter("u_id");
			String u_pw = req.getParameter("u_pw");
			session.setAttribute("u_id", u_id);

			System.out.println("세션에 저장된 사용자 아이디: " + session.getAttribute("u_id"));

			AUserDAO dao = sqlSessionTemplate.getMapper(AUserDAO.class);
			AUserBean n = dao.pickId(u_id);

			System.out.println("n에 받은 값은: " + n);

			if (n != null && n.getU_id().equals("admin")) {
				String adminPw = n.getU_pw();
				if (adminPw.equals(u_pw)) {
					System.out.println("관리자 로그인에 성공하셨습니다.");
					model.addAttribute("message", "관리자님 환영합니다!");
					return "admin/user/main";
				} else {
					System.out.println("관리자 비밀번호가 일치하지 않습니다. 세션 삭제");
					session.removeAttribute("u_id");
					model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
					return "client/user/clogin";
				}
			} else {
				System.out.println("관리자 로그인에 실패하셨습니다.");
				session.removeAttribute("u_id");
				System.out.println("세션을 삭제합니다.");
				return "client/user/clogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("exception", e);
			return "admin/user/error";
		}
	}

	@RequestMapping(value = "/checkEmail.action", method = RequestMethod.POST)
	public String test(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		String title = "dnlsemtmf@gmail.com";
		String content = "test 메일입니다.";
		String user_name = "dnlsemtmf@gmail.com";
		String password = "xszm uyai wcih wsez";

		SendMail sendMail = new SendMail();
		sendMail.goMail(sendMail.setting(new Properties(), user_name, password), title, content);

		return "admin/user/main";

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutMainGET(HttpSession session) {

		session.removeAttribute("u_id");

		System.out.println("현재 세션에 아이디: " + session.getAttribute("u_id"));
		return "redirect:/index.jsp";

	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "admin/user/main";
	}

	@RequestMapping(value = "/aindex", method = RequestMethod.GET)
	public String aindex() {
		return "admin/user/aindex";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin() {
		return "admin/user/admin";
	}

	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String main(Model model) {
		List<AUserBean> userList = userDAO.list();
		model.addAttribute("userList", userList);
		return "admin/user/memberList";
	}

	@RequestMapping(value = "/memberDetail", method = RequestMethod.GET)
	public String read(@ModelAttribute("searchVO") AUserBean searchVO, Model model) {
		return "/admin/user/memberDetail";
	}

}
