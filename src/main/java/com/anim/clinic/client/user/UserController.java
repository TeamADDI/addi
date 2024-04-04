package com.anim.clinic.client.user;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anim.clinic.admin.user.biz.SendMail;
import com.anim.clinic.client.cart.biz.CartBean;
import com.anim.clinic.client.cart.biz.CartDAO;
import com.anim.clinic.client.user.biz.UserBean;
import com.anim.clinic.client.user.biz.UserDAO;

@Controller
public class UserController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private CartDAO cartDAO;

	@RequestMapping(value = "/callback", method = RequestMethod.GET)
	public String callBack() {
		return "client/user/callback";
	}

	// id 찾기
	@RequestMapping(value = "/checkEmail.action", method = RequestMethod.POST)
	public String test(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		String title = "dnlsemtmf@gmail.com";
		String user_name = "dnlsemtmf@gmail.com";
		String password = "xszm uyai wcih wsez";

		String u_name = req.getParameter("u_name");
		String u_email = req.getParameter("u_email");

		UserBean vo = new UserBean();
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserBean userEm = dao.pickEmail(u_name); // db에서 가져온 name, email

		String userName = (String) userEm.getU_name();
		String userEmail = (String) userEm.getU_email();

		if (userName.equals(u_name) && userEmail.equals(u_email)) {

			String authenticationCode = generateRandomCode();
			String content = "당신의 인증번호는 : " + authenticationCode + "입니다.";

			SendMail sendMail = new SendMail();
			sendMail.goMail(sendMail.setting(new Properties(), user_name, password), title, content);

			session.setAttribute("authenticationCode", authenticationCode);
			session.setAttribute("authenticatedUserName", u_name);
			return "redirect:/alertId";

		} else {
			System.out.println("맞지않음");
			return "redirect:/findId";
		}
	}

	private String generateRandomCode() {
		Random random = new Random();
		int min = 100000;
		int max = 999999;
		int randomNumber = random.nextInt(max - min + 1) + min;
		return String.valueOf(randomNumber);
	}

	@RequestMapping(value = "/checkEmailAuthorization.action", method = RequestMethod.POST)
	public String checkEmailAuthorization(HttpServletRequest req, HttpSession session, Model model) {
		String authenticationCode = req.getParameter("authenticationCode");
		System.out.println("authenticationCode(내가 입력한 인증번호) : " + authenticationCode);

		String getSessionCode = (String) session.getAttribute("authenticationCode");
		System.out.println("getSessionCode(세션에서 가져온 인증번호) : " + getSessionCode);

		if (authenticationCode.equals(getSessionCode)) {
			String userName = (String) session.getAttribute("authenticatedUserName");
			System.out.println("userName(세션에서 가져온 u_name" + userName);

			UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
			UserBean userId = dao.pickName(userName); // db에서 가져온 id

			// 사용자 아이디를 모델에 추가
			model.addAttribute("u_id", userId.getU_id());

			// 로그인 페이지로 미리 입력된 ID와 함께 리디렉션
			return "redirect:/clogin?u_id=" + userId.getU_id();
		} else {
			model.addAttribute("error", "인증번호가 일치하지 않습니다. 다시 입력해주세요.");
			return "client/user/findId";
		}
	}

	// pw 찾기
	@RequestMapping(value = "/checkPw", method = RequestMethod.POST)
	public String pwChk(HttpServletRequest req, HttpServletResponse res, Model model) {
		String title = "addi@gmail.com";
		String user_name = "xornjs3@gmail.com";
		String password = "xuyo wucv daup bjse";

		String u_name = req.getParameter("u_name");
		String u_email = req.getParameter("u_email");

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserBean userEm = dao.pickEmail(u_name); // db에서 가져온 name, email

		String userName = (String) userEm.getU_name();
		String userEmail = (String) userEm.getU_email();

		if (userName.equals(u_name) && userEmail.equals(u_email)) {

			String authenticationCode = RandomCode();
			userEm.setU_pw(authenticationCode);

			String content = "당신의 임시비밀번호는 : " + authenticationCode + "입니다.";
			SendMail sendMail = new SendMail();
			sendMail.goMail(sendMail.setting(new Properties(), user_name, password), title, content);

			dao.updatePassword(userEm);

			return "client/user/alertPw";

		} else {
			System.out.println("맞지않음");
			return "client/user/findPw";
		}
	}

	private String RandomCode() {
		Random random = new Random();
		int min = 100000;
		int max = 999999;
		int randomNumber = random.nextInt(max - min + 1) + min;
		return String.valueOf(randomNumber);
	}

	// 클라이언트 회원가입 페이지
	@RequestMapping(value = "/cjoin", method = RequestMethod.POST)
	// @ModelAttribute AUserVO aUserVO를 가져오면 쉽게 가능하다.
	public String joinAction(@RequestParam String u_id, @RequestParam String u_pw, @RequestParam String u_name,
			@RequestParam String u_email, @RequestParam String u_tel, @RequestParam("u_birth") String u_birthStr,
			@RequestParam("u_age") String u_ageStr, @RequestParam String u_gender, @RequestParam String u_post,
			@RequestParam String roadAddress, @RequestParam String detailAddress, HttpSession session, Model model) {
		try {

			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식은 이대로

			String u_addr = roadAddress + " " + detailAddress; // 주소 합치기

			Date u_birth = dateFormat.parse(u_birthStr); // DB의 자료형에 맞게 변환
			int u_age = Integer.parseInt(u_ageStr);

			UserBean vo = new UserBean();
			vo.setU_id(u_id);
			vo.setU_pw(u_pw);
			vo.setU_name(u_name);
			vo.setU_email(u_email);
			vo.setU_tel(u_tel);
			vo.setU_birth(u_birth);
			vo.setU_age(u_age); // Bean에 변환한 것들을 담아놓음
			vo.setU_gender(u_gender);
			vo.setU_post(u_post);
			vo.setU_addr(u_addr);

			/*
			 * session.setAttribute("u_id", u_id); // session에 id 저장
			 */ UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class); // 데이터베이스에 dao가 액세스하는 데 사용된다.

			// 아이디 중복 체크
			int count = dao.checkDuplicateId(u_id);
			if (count > 0) {
				model.addAttribute("message", "이미 사용 중인 아이디입니다.");
				return "client/user/cjoin"; // 아이디 중복 시 다시 회원가입 페이지로 이동
			}

			dao.insert(vo); // insert로 vo를 넘긴다.

			String message = "회원가입이 완료되었습니다.\n로그인페이지로 이동시키겠습니다.";
			model.addAttribute("message", message);
			return "redirect:/clogin";

		} catch (ParseException e) {
			e.printStackTrace();
			model.addAttribute("exception", e);
			return "client/user/error";
		}
	}

	// 클라이언트에서 아이디 중복 체크를 수행하는 요청을 처리하는 메서드
	@RequestMapping(value = "/checkDuplicateId", method = RequestMethod.GET)
	public void checkDuplicateId(HttpServletRequest req, HttpServletResponse res) {
		try {
			String u_id = req.getParameter("u_id");

			// DAO를 사용하여 아이디 중복 체크 수행
			UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
			int count = dao.checkDuplicateId(u_id);

			// 결과를 클라이언트에게 응답
			res.getWriter().print(count > 0 ? "duplicate" : "available");
		} catch (IOException e) {
			e.printStackTrace();
			// 예외 처리
		}
	}

	// 클라이언트 로그인 페이지
	@RequestMapping(value = "/cindex", method = RequestMethod.POST)
	public String cLoginAction(@RequestParam String u_id, @RequestParam String u_pw, HttpSession session, Model model) {
		try {
			session.setAttribute("u_id", u_id);
			// 세션에 저장된 값 확인
			System.out.println("세션에 저장된 사용자 아이디: " + session.getAttribute("u_id"));

			UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
			UserBean userId = dao.pickId(u_id);

			if (userId != null) {
				String getUserPw = userId.getU_pw();
				if (getUserPw != null && u_pw.equals(getUserPw)) {
					if ("admin".equals(u_id)) {
						System.out.println("클라이언트에서 관리자로 로그인했습니다");
						return "redirect:/main";
					} else {
						System.out.println(u_id + "가 로그인 했습니다.");
						System.out.println("userId의 값이" + userId + " 입니다.");

						// 클라이언트 회원 로그인 파트
						String referrer = (String) session.getAttribute("referrer");
						if (referrer != null) {
							CartBean bean = (CartBean) session.getAttribute("addItem");
							if (bean != null) {
								bean.setU_id(u_id);
								CartDAO cartDAO = sqlSessionTemplate.getMapper(CartDAO.class);
								cartDAO.insertCart(bean);
								return "redirect:/client/item/list";
							}
							return referrer;
						}

						return "redirect:/";
					}
				} else {
					System.out.println("패스워드가 일치하지 않습니다. 다시 입력해주세요");
					session.removeAttribute("u_id");
					model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
					return "client/user/clogin";
				}
			} else {
				System.out.println("가입된 정보가 없습니다. 회원가입 하세요.");
				session.removeAttribute("u_id");
				model.addAttribute("message", "가입된 정보가 없습니다. 회원가입 하세요.");
				return "client/user/cjoin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("exception", e);
			return "client/user/error";
		}
	}

	/* 클라이언트 로그아웃 */
	@RequestMapping(value = "/clientLogout.action", method = RequestMethod.GET)
	public String logoutMainGET(HttpSession session) {

		session.removeAttribute("u_id");

		System.out.println("현재 세션에 아이디: " + session.getAttribute("u_id"));
		return "redirect:/";

	}

	// 마이 페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		String u_id = (String) session.getAttribute("u_id");

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserBean n = dao.detail(u_id);

		model.addAttribute("n", n);

		return "client/user/mypage";
	}

	// 수정
	@RequestMapping(value = "/mypage/edit", method = RequestMethod.POST)
	public String update(@RequestParam String u_id, @RequestParam String u_name, @RequestParam String u_email,
			@RequestParam String u_tel, @RequestParam("u_age") String u_ageStr, @RequestParam String u_post,
			@RequestParam String roadAddress, @RequestParam String detailAddress, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {

		String u_addr = roadAddress + " " + detailAddress; // 주소 합치기

		// null 값일 경우 빈 문자열로 처리
		roadAddress = (roadAddress != null) ? roadAddress : "";
		detailAddress = (detailAddress != null) ? detailAddress : "";

		// u_addr = (String) req.getParameter("u_addr");
		// System.out.println("주소확인" + u_addr);
		int u_age = Integer.parseInt(u_ageStr);

		UserBean vo = new UserBean();
		vo.setU_id(u_id);
		vo.setU_name(u_name);
		vo.setU_tel(u_tel);
		vo.setU_email(u_email);
		vo.setU_age(u_age);
		vo.setU_post(u_post);
		vo.setU_addr(u_addr);

		// session.setAttribute("u_id", u_id); // session에 id 저장
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class); // 데이터베이스에 dao가 액세스하는 데 사용된다.
		dao.update(vo);

		return "redirect:/mypage";
	}

	// 탈퇴
	@RequestMapping(value = "/mypage/cancel", method = RequestMethod.POST)
	public String delete(@RequestParam String u_id, @RequestParam String u_name, @RequestParam String u_email,
			@RequestParam String u_tel, @RequestParam("u_age") String u_ageStr, @RequestParam String u_post,
			@RequestParam String roadAddress, @RequestParam String detailAddress, HttpServletRequest req,
			HttpServletResponse res, HttpSession session) {

		String u_addr = roadAddress + " " + detailAddress; // 주소 합치기
		u_addr = (String) req.getParameter("u_addr");
		System.out.println("주소확인" + u_addr);
		int u_age = Integer.parseInt(u_ageStr);

		UserBean vo = new UserBean();
		vo.setU_id(u_id);
		vo.setU_name(u_name);
		vo.setU_tel(u_tel);
		vo.setU_email(u_email);
		vo.setU_age(u_age);
		vo.setU_addr(u_addr);

		if (u_id != null) {
			UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
			dao.delete(vo); // 해당 사용자 정보 삭제
			session.invalidate(); // 세션 무효화하여 로그아웃 처리

			// 삭제 후 홈페이지로 리다이렉트
			return "redirect:/";
		} else {
			// 세션에 사용자 ID가 없는 경우, 다시 로그인 페이지로 리다이렉트
			return "redirect:/client/user/clogin";
		}
	}

	@RequestMapping(value = "/cjoin", method = RequestMethod.GET)
	public String join() {
		return "client/user/cjoin"; // 회원가입 페이지
	}

	@RequestMapping(value = "/clogin", method = RequestMethod.GET)
	public String login() {
		return "client/user/clogin"; // 클라이언트 로그인 페이지
	}

	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "client/user/findId"; // 아이디 찾기 페이지
	}
	
	@RequestMapping(value = "/alertId", method = RequestMethod.GET)
	public String alertId() {
		return "client/user/alertId"; // 아이디 찾기 페이지
	}

	@RequestMapping(value = "/foundId", method = RequestMethod.GET)
	public String foundId() {
		return "client/user/foundId"; // 아이디 찾은 페이지
	}

	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPw() {
		return "client/user/findPw"; // 비밀번호 찾기 페이지
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "client/user/test"; // 테스트
	}

	@RequestMapping(value = "/clickHandler", method = RequestMethod.GET)
	public String clickHandler(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false); // 세션이 없으면 새로 생성하지 않음

		if (session != null && session.getAttribute("u_id") != null) {
			String u_id = (String) session.getAttribute("u_id");
			if (u_id.equals("admin")) {
				return "redirect:/aindex";
			} else {
				return "redirect:/";
			}
		} else {
			return "redirect:/";
		}
	}
}
