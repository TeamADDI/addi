package com.anim.clinic.client.resv;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.anim.clinic.client.resv.biz.ResvBean;
import com.anim.clinic.client.resv.biz.ResvService;

@Controller
public class ResvController {
	
	@Autowired
	private ResvService resvService;

	@RequestMapping(value = "/resvForm", method = RequestMethod.GET)
	public String getResvForm() {
		return "client/resv/resvForm"; // 예약 등록 페이지
	}
	
	@RequestMapping(value = "/resvList", method = RequestMethod.POST)
	public String registerResv(@RequestParam String categories,
			ResvBean bean,
			Model model,
			HttpSession session) {
		String uId = (String) session.getAttribute("u_id");
		
		if (uId != null) {
			String [] arrayCategories = categories.split(",");
			
			String itemName = resvService.getItemName(arrayCategories);
			List<ResvBean> resvList = resvService.saveResv(uId, bean, arrayCategories);
			int total = resvService.getTotalAmount(resvList);
			 
			model.addAttribute("itemName", itemName);
			model.addAttribute("resvList", resvList);
			model.addAttribute("totalAmount", total);
			
			System.out.println("예약 정보 확인: " + resvList);
			
			return "client/resv/resvList"; // 예약 리스트 페이지
		} else {
			session.setAttribute("referrer", "redirect:/resvForm");
			return "redirect:/clogin";
		}
	}

	@RequestMapping(value = "/payTest", method = RequestMethod.POST)
	public String getPayTest(
			@RequestParam String itemName,
			@RequestParam String rCode,
			Model model) {
		String code = rCode.substring(2);
		List<ResvBean> resvList = resvService.getResvList(code);
		
		int totalAmount = resvService.getTotalAmount(resvList);
		int quantity = resvList.size();
		
		model.addAttribute("itemName", itemName);
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("quantity", quantity);

		return "client/resv/payTest"; // 페이 테스트 페이지
	}

}