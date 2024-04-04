package com.anim.clinic.client.resv;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.anim.clinic.client.resv.biz.ResvBean;
import com.anim.clinic.client.resv.biz.ResvService;

@Controller
@SessionAttributes({ "itemName", "totalAmount", "resvList" })
public class ResvController {

	@Autowired
	private ResvService resvService;

	private Map<String, Object> resv = new HashMap<>();

	@ModelAttribute("resv")
	public Map<String, Object> resv() {
		return resv;
	}

	@RequestMapping(value = "/resvForm", method = RequestMethod.GET)
	public String getResvForm() {
		return "client/resv/resvForm";
	}

	@RequestMapping(value = "/resvList", method = RequestMethod.GET)
	public String payDelete(@RequestParam("rCode") String rCode, Model model) {
		resvService.deleteResv(rCode);

		String code = resv.get("code").toString();
		List<ResvBean> resvList = resvService.getResvList(code);
		model.addAttribute("code", code); // 추가 코드
		model.addAttribute("resvList", resvList);

		String itemName = "";
		for (ResvBean resvBean : resvList) {
			if (resvBean.getpCategory().equals("CL")) {
				resvBean.setKrCategory("진료");
				itemName += "진료 ";
			} else if (resvBean.getpCategory().equals("BT")) {
				resvBean.setKrCategory("미용");
				itemName += "미용 ";
			} else if (resvBean.getpCategory().equals("CA")) {
				resvBean.setKrCategory("돌봄");
				itemName += "돌봄";
			}
		}
		resv.put("itemName", itemName.trim());

		int total = resvService.getTotalAmount(resvList);
		model.addAttribute("totalAmount", total);

		return "client/resv/resvList";
	}

	@RequestMapping(value = "/resvList", method = RequestMethod.POST)
	public String registerResv(@RequestParam String categories, ResvBean bean, Model model, HttpServletRequest req,
			HttpSession session) {
		resv.put("tempResvBean", bean);
		resv.put("tempItemName", categories);

		String uId = (String) session.getAttribute("u_id");
		if (uId != null) {
			String[] arrayCategories = categories.split(",");
			String itemName = resvService.getItemName(arrayCategories);
			resv.put("itemName", itemName);

			List<ResvBean> resvList = resvService.saveResv(uId, bean, arrayCategories);
			model.addAttribute("resvList", resvList);

			String code = resvList.get(0).getrCode().substring(2);
			resv.put("code", code);
			model.addAttribute("code", code); // 추가 코드

			int total = resvService.getTotalAmount(resvList);
			model.addAttribute("totalAmount", total);

			return "client/resv/resvList";
		}
		session.setAttribute("referrer", "client/resv/resvForm");

		return "redirect:/clogin";
	}

	// 수정됨
	@RequestMapping(value = "/quickResv", method = RequestMethod.GET)
	public String getQuickResv() {
		return "client/resv/quickResv";
	}

	@RequestMapping(value = "/quickResvList", method = RequestMethod.POST)
	public String quickResvList(@RequestParam String categories, ResvBean bean, Model model, HttpServletRequest req,
			HttpSession session) {

		model.addAttribute("categories", categories);
		model.addAttribute("resvBean", bean);

		resv.put("tempResvBean", bean);
		resv.put("tempItemName", categories);

		String uId = (String) session.getAttribute("u_id");

		if (uId != null) {
			String[] arrayCategories = categories.split(",");
			String itemName = resvService.getItemName(arrayCategories);
			resv.put("itemName", itemName);

			List<ResvBean> quickResvList = resvService.saveResv(uId, bean, arrayCategories);

			model.addAttribute("quickResvList", quickResvList);

			String code = quickResvList.get(0).getrCode().substring(2);
			resv.put("code", code);
			model.addAttribute("code", code); // 추가 코드

			int total = resvService.getTotalAmount(quickResvList);
			model.addAttribute("totalAmount", total);

			return "client/resv/quickResvList";
		} else {
			String referrer = req.getRequestURI();
			session.setAttribute("referrer", referrer);

			return "redirect:/clogin";
		}
	}

	@RequestMapping(value = "/myResvList", method = RequestMethod.GET)
	public String myResvList(Model model, HttpSession session) {
		String u_id = (String) session.getAttribute("u_id");
		List<ResvBean> list = resvService.selectMyResvList(u_id);
		model.addAttribute("myResvList", list);

		return "client/resv/myResvList";
	}

}