package com.anim.clinic.admin.pay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.anim.clinic.admin.pay.biz.ACompletedPayBean;
import com.anim.clinic.admin.pay.biz.APayDAO;

@Controller
public class ApayController {

	@Autowired
	private APayDAO apayDAO;

//	@RequestMapping("/payList")
//	public String getCompletedPayments(Model model) {
//		// 결제가 완료된 데이터를 가져와서 모델에 추가
//		List<ACompletedPayBean> completedPayments = apayDAO.getCompletedPayments();
//		model.addAttribute("completedPayments", completedPayments);
//		return "admin/pay/payList"; // 완료된 결제 리스트를 보여주는
//	}

	@RequestMapping("/payList")
	public String getCompletedPayments(Model model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize) {
		// 전체 데이터 수
		int totalCount = apayDAO.getTotalCompletedPaymentsCount();

		// 전체 페이지 수
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		// 시작 인덱스 계산
		int start = (page - 1) * pageSize;

		// 해당 페이지의 데이터 가져오기
		List<ACompletedPayBean> completedPayments = apayDAO.getCompletedPaymentsByPage(start, pageSize);

		// 모델에 데이터 추가
		model.addAttribute("completedPayments", completedPayments);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "admin/pay/payList";
	}

	@RequestMapping("/payDelete")
	public String payDelete(@RequestParam("p_number") int p_number) {
		// 결제를 삭제하는 DAO 메서드 호출
		apayDAO.payDelete(p_number);

		// 수정된 결제 리스트를 보여줄 뷰로 리다이렉트
		return "redirect:/payList";
	}

}