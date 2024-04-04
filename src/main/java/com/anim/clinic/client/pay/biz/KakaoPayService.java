package com.anim.clinic.client.pay.biz;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.anim.clinic.client.resv.biz.ResvDAO;

@Service
public class KakaoPayService {

	private static final Logger log = LoggerFactory.getLogger(KakaoPayService.class);

	private static final String HOST = "https://kapi.kakao.com";

	private KakaoPayReadyBean kakaoPayReadyBean;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private HttpServletRequest request;

	public String kakaoPayReady(String itemName, String totalAmount, String quantity) {
		try {
			HttpSession session = request.getSession();
			String u_id = (String) session.getAttribute("u_id");

			PayDAO dao = sqlSessionTemplate.getMapper(PayDAO.class);
			List<PayBean> list = dao.list();
			PayBean target = list.get(0);

			RestTemplate restTemplate = new RestTemplate();

			HttpHeaders headers = new HttpHeaders();

			// 헤더 부분에 담아서 요청해야할 데이터들.

			// Authorization : admin key
			// Accept : HTTP 요청을 보낼 때 클라이언트가 받아들일 수 있는 응답 미디어 타입을 지정하는 데 사용
			// Content-Type : HTTP 요청이나 응답의 본문 데이터의 형식을 지정하는 데 사용
			headers.add("Authorization", "KakaoAK " + target.getAuthorization());
			//
			headers.add("Accept", target.getAccept());

			headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();

			// cid : 가맹점 코드
			// partner_order_id : 가맹점 주문번호 실제 결제가 아닌 테스트 결제이기 때문에 DB에 임의적으로 저장해놓았다.
			// approval_url : 결제 성공 시 redirect URL,
			// cancel_url : 결제 취소 시 redirect URL,
			// fail_url : 결제 실패 시 redirect URL,
			params.add("cid", target.getCid());
			params.add("partner_order_id", target.getPartner_order_id());
			params.add("partner_user_id", u_id);
			params.add("item_name", itemName);
			params.add("quantity", quantity);
			params.add("total_amount", totalAmount);
			params.add("tax_free_amount", "1");
			params.add("approval_url", target.getApproval_url());
			params.add("cancel_url", target.getCancel_url());
			params.add("fail_url", target.getFail_url());

			HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<>(params, headers);

			kakaoPayReadyBean = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body,
					KakaoPayReadyBean.class);

			System.out.println("item_name 값 :" + itemName);
			System.out.println("quantity 값 :" + quantity);
			System.out.println("total_amount 값 :" + totalAmount);

			log.info("KakaoPayReadyBean: {}", kakaoPayReadyBean);

			return kakaoPayReadyBean.getNext_redirect_pc_url();
		} catch (RestClientException | URISyntaxException e) {
			log.error("Failed to request KakaoPay ready", e);
			return "/pay";
		}
	}

	public KakaoPayApprovalBean kakaoPayInfo(String pg_token, String code) { // 수정 코드

		try {
			HttpSession session = request.getSession();
			String u_id = (String) session.getAttribute("u_id");
			PayDAO dao = sqlSessionTemplate.getMapper(PayDAO.class);
			List<PayBean> list = dao.list();
			PayBean target = list.get(0);

			RestTemplate restTemplate = new RestTemplate();

			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "KakaoAK " + target.getAuthorization());
			headers.add("Accept", target.getAccept());
			headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

			MultiValueMap<String, String> params = new LinkedMultiValueMap<>();

			params.add("cid", target.getCid());
			params.add("tid", kakaoPayReadyBean.getTid());
			params.add("partner_order_id", target.getPartner_order_id());
			params.add("partner_user_id", u_id);
			params.add("pg_token", pg_token);

			HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<>(params, headers);

			KakaoPayApprovalBean kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"),
					body, KakaoPayApprovalBean.class);

			// pg_token 출력
			System.out.println("pg_token 값: " + pg_token);
			// aid : 요청 고유 번호 - 승인/취소가 구분된 결제번호
			// tid : 결제 고유 번호 - 승인/취소가 동일한 결제번호

			System.out.println("aid 값: " + kakaoPayApprovalVO.getAid());
			System.out.println("tid 값: " + kakaoPayReadyBean.getTid());

			kakaoPayApprovalVO.setPg_token(pg_token);

			log.info("KakaoPayApprovalBean: {}", kakaoPayApprovalVO);

			dao.insertPayDetail(kakaoPayApprovalVO);

			// 추가 코드
			ResvDAO resvDao = sqlSessionTemplate.getMapper(ResvDAO.class);
			resvDao.updateStatus(code);

			return kakaoPayApprovalVO;
		} catch (RestClientException | URISyntaxException e) {
			log.error("Failed to request KakaoPay info", e);
			return null;
		}
	}

}