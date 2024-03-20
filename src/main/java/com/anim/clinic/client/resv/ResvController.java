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

import com.anim.clinic.client.resv.biz.ResvBean;
import com.anim.clinic.client.resv.biz.ResvService;

@Controller
public class ResvController {
	
	@Autowired
	private ResvService resvService;
	
    private Map<String, Object> resv = new HashMap<>();
    
    @ModelAttribute("resv")
    public Map<String, Object> resv() {
    	return resv;
    }

	@RequestMapping(value = "/resvForm", method = RequestMethod.GET)
	public String getResvForm(Model model, HttpSession session) {
		ResvBean defaultResvBean = new ResvBean();
		System.out.println(session);
		if (resv.get("tempResvBean") == null) {
			model.addAttribute("formData", defaultResvBean);
		} else {
			model.addAttribute("formData", resv.get("tempResvBean"));
		}

		return "client/resv/resvForm";
	}
	
	@RequestMapping(value = "/resvList", method = RequestMethod.POST)
	public String registerResv(
			@RequestParam String categories,
			ResvBean bean,
			Model model,
			HttpServletRequest req,
			HttpSession session) {
		resv.put("tempResvBean", bean);
		resv.put("tempItemName", categories);
		
		String uId = (String) session.getAttribute("u_id");
		
		if (uId != null) {
			String [] arrayCategories = categories.split(",");
			String itemName = resvService.getItemName(arrayCategories);
			resv.put("itemName", itemName);
			
			List<ResvBean> resvList = resvService.saveResv(uId, bean, arrayCategories);
			if (resvList == null) {
				String message = "중복된 예약이 있습니다.";
				model.addAttribute("message", message);
				
				return "client/resv/resvForm";
			}
			
			model.addAttribute("resvList", resvList);
			
			String code = resvList.get(0).getrCode().substring(2);
			resv.put("code", code);
			
			int total = resvService.getTotalAmount(resvList);
			model.addAttribute("totalAmount", total);

			return "client/resv/resvList";
		} else {
	        String referrer = req.getRequestURI();
	        session.setAttribute("referrer", referrer);
			
			return "redirect:/clogin";
		}
	}

	@RequestMapping(value = "/payTest", method = RequestMethod.POST)
	public String getPayTest(Model model) {
		String code = resv.get("code").toString();
		List<ResvBean> resvList = resvService.getResvList(code);

		int totalAmount = resvService.getTotalAmount(resvList);
		int quantity = resvList.size();
		
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("quantity", quantity);
		model.addAttribute("resvDetail", resvList.get(0));

		return "client/resv/payTest";
	}

}