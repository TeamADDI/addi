package com.anim.clinic.admin.user;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anim.clinic.admin.user.biz.AUserBean;
import com.anim.clinic.admin.user.biz.AUserDAO;
import com.anim.clinic.admin.user.biz.ChartBean;
import com.anim.clinic.admin.user.biz.PagingBean;
import com.anim.clinic.admin.user.biz.SendSMSTwilio;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
public class AUserController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private final AUserDAO userDAO;
	private String u_addr;

	@Autowired
	public AUserController(AUserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(value = "/sendSMS", method = RequestMethod.POST)
	public String sendSms(@RequestParam("country") String country, @RequestParam("u_tel") String u_tel,
			HttpSession session) {
		int authNum = SendSMSTwilio.sendSMS(country, u_tel);

		session.setAttribute("authNum", authNum);

		return "join";
	}

	@RequestMapping(value = "/checkAuthorizationKey", method = RequestMethod.POST)
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

	@RequestMapping(value = "/main", method = RequestMethod.POST)
	public String loginAction(@RequestParam String u_id, @RequestParam String u_pw, HttpSession session, Model model) {
		try {
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
					return "redirect:/clogin";
				}
			} else {
				System.out.println("관리자 로그인에 실패하셨습니다.");
				session.removeAttribute("u_id");
				System.out.println("세션을 삭제합니다.");
				return "redirect:/clogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("exception", e);
			return "admin/user/error";
		}
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String logoutMainGET(HttpSession session) {

		session.removeAttribute("u_id");

		System.out.println("현재 세션에 아이디: " + session.getAttribute("u_id"));
		return "admin/user/admin";

	}

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "admin/user/main";
	}

	@RequestMapping(value = "/aindex", method = RequestMethod.GET)
	public String aindex() {
		return "redirect:/";
	}

	@RequestMapping(value = "/memberRegistPage", method = RequestMethod.GET)
	public String memberRegistPage(Model model) {
		// 맴버 등록 페이지로 이동
		return "admin/user/memberRegist";
	}

	@RequestMapping(value = "/memberRegist", method = RequestMethod.POST)
	public String memberegist(@ModelAttribute AUserBean aUserBean, Model model, @RequestParam String roadAddress,
			@RequestParam String detailAddress) {
		try {
			String u_addr = roadAddress + " " + detailAddress;

			aUserBean.setU_addr(u_addr);
			userDAO.memberRegist(aUserBean); // 사용자 정보를 데이터베이스에 저장
			model.addAttribute("message", "회원등록이 완료되었습니다.");
			return "redirect:/admin/members";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("exception", e);
			return "admin/user/error"; // 오류 페이지로 이동
		}
	}

	@RequestMapping(value = "/admin/members", method = RequestMethod.GET)
	public String selectBoard(PagingBean vo, Model model,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") int cntPerPage) {

		if (nowPage <= 0)
			nowPage = 1;

		int total = userDAO.countBoard();
		vo = new PagingBean(total, nowPage);
		model.addAttribute("paging", vo);
		model.addAttribute("userList", userDAO.selectBoard(vo));
		return "admin/user/memberList";
	}

	@RequestMapping(value = "/admin/detail/{u_id}", method = RequestMethod.GET)
	public String getMemberDetail(@PathVariable("u_id") String u_id, Model model) {
		AUserBean userDetail = userDAO.getMemberDetail(u_id);
		model.addAttribute("detail", userDetail);
		return "admin/user/memberDetail";
	}

	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(@ModelAttribute AUserBean aUserBean, Model model) {
		try {
			userDAO.memberUpdate(aUserBean);
			AUserBean updatedUser = userDAO.getMemberDetail(aUserBean.getU_id());
			model.addAttribute("detail", updatedUser);
			return "redirect:/admin/detail/" + updatedUser.getU_id();
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("exception", e);
			return "admin/user/error";
		}
	}

	@RequestMapping(value = "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(@RequestParam("u_id") String u_id) {
		userDAO.memberDelete(u_id);
		return "redirect:/admin/members";
	}

	@RequestMapping("/joinchart")
	@ResponseBody
	public String joinPost(Model model) {
		List<ChartBean> list = userDAO.joinChart();
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		for (ChartBean chartBean : list) {
			JsonObject object = new JsonObject();
			int count = chartBean.getCount();
			Date date = chartBean.getU_regdate();
			String formattedDate = df.format(date);

			object.addProperty("date", formattedDate);
			object.addProperty("count", count);

			jArray.add(object);
		}
		String json = gson.toJson(jArray);
//		System.out.println("json 변환: " + json);
		return json;
	}

	@RequestMapping("/resvchart")
	@ResponseBody
	public String resvPost(Model model) {
		List<ChartBean> list = userDAO.resvChart();
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();

		Iterator<ChartBean> it = list.iterator();
		while (it.hasNext()) {
			ChartBean chartBean = it.next();
			JsonObject object = new JsonObject();
			String category = chartBean.getP_category();
			int count = chartBean.getCount();

			object.addProperty("category", category);
			object.addProperty("count", count);
			jArray.add(object);
		}
		String json = gson.toJson(jArray);

		model.addAttribute("json", json);
//		System.out.println("json 변환: " + json);
		return json;
	}

	@RequestMapping("/paychart")
	@ResponseBody
	public String payPost(Model model) {
		List<ChartBean> list = userDAO.payChart();
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");

		for (ChartBean chartBean : list) {
			JsonObject object = new JsonObject();
			int payCount = chartBean.getCount();
			Date payDate = chartBean.getPayment_date();
			String formattedDate = df.format(payDate);
			object.addProperty("payDate", formattedDate);
			object.addProperty("payCount", payCount);
			jArray.add(object);
		}
		String json = gson.toJson(jArray);
//		System.out.println("json 변환: " + json);
		return json;
	}

	@RequestMapping("/cartchart")
	@ResponseBody
	public String cartPost(Model model) {
		List<ChartBean> list = userDAO.cartChart();
		Gson gson = new Gson();
		JsonArray jArray = new JsonArray();
		for (ChartBean chartBean : list) {
			JsonObject object = new JsonObject();
			String item_code = chartBean.getItem_code();
			int quantity = chartBean.getQuantity(); // 가입 수를 가져옵니다.
			object.addProperty("itemcode", item_code);
			object.addProperty("quantity", quantity);

			jArray.add(object);
		}
		String json = gson.toJson(jArray);
//		System.out.println("json 변환: " + json);
		return json;
	}
}
