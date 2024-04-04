package com.anim.clinic.client.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.anim.clinic.client.pay.biz.KakaoPayService;
import com.anim.clinic.client.pay.biz.PayBean;
import com.anim.clinic.client.pay.biz.PayDAO;

@Controller
public class KakaoPayController {

	private static final Logger log = LoggerFactory.getLogger(KakaoPayController.class);

	private KakaoPayService kakaopay;

	@Autowired
	public void setKakaopay(KakaoPayService kakaopay) {
		this.kakaopay = kakaopay;
	}

	// 추가 코드
	private Map<String, Object> pay = new HashMap<>();

	@ModelAttribute("pay")
	public Map<String, Object> pay() {
		return pay;
	}

	@RequestMapping(value = "/kakaoPay", method = RequestMethod.GET) // GET 방식
	public void kakaoPayForm() {
		// 카카오페이 결제 폼을 보여주는 메소드
	}

	// 카카오페이 요청 메서드

	@RequestMapping(value = "/kakaoPay", method = RequestMethod.POST)
	public String kakaoPayRequest(@RequestParam("itemName") String itemName,
			@RequestParam("totalAmount") String totalAmount, @RequestParam("quantity") String quantity,
			@RequestParam("code") String code) { // 추가 코드
		log.info("kakaoPayRequest post............................................");

		pay.put("code", code); // 추가 코드

		System.out.println("아이템이름은 : " + itemName);
		System.out.println("총금액은 : " + totalAmount);
		System.out.println("총 수량은 : " + quantity);

		return "redirect:" + kakaopay.kakaoPayReady(itemName, totalAmount, quantity);
	}

	@RequestMapping(value = "/kakaoPaySuccess", method = RequestMethod.GET)
	public String kakaoPaySuccess(String pg_token, Model model, HttpSession session) {
		// 추가 코드
		String code = pay.get("code").toString();

		// 이후 처리
		model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token, code)); // 수정 코드
		model.addAttribute("hideButtons", true);

		return "client/resv/resvList"; // 뷰 이름 반환
	}

	@RequestMapping(value = "/kakaoPayCancel", method = RequestMethod.GET) // GET 방식
	public void kakaoPayCancel(String pg_token, Model model) {

		model.addAttribute("pgToken", pg_token);
		model.addAttribute("errorMessage", "결제 중단 했습니다. 다시 시도해주세요.");

	}

	// 결제요청 전 사전 준비 데이터 리스트 뽑기
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@RequestMapping("/payRequestInfo")
	public String getEmpList(Model model) {
		PayDAO dao = sqlSessionTemplate.getMapper(PayDAO.class);
		List<PayBean> list = dao.list();
		model.addAttribute("RequestList", list);
		return "/payRequestInfo";
	}

}