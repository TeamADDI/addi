package com.anim.clinic.admin.resv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.anim.clinic.admin.resv.biz.AResvBean;
import com.anim.clinic.admin.resv.biz.AResvDAO;
import com.anim.clinic.admin.resv.biz.AResvService;

@Controller
public class AResvController {
	@Autowired
	private AResvService aResvService;

	@Autowired
	private AResvDAO aResvDAO;

	@RequestMapping("/aresvList")
	public String getCompletedResv(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize) {

		int totalCount = aResvDAO.getTotalCompletedResvCount();

		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		int start = (page - 1) * pageSize;

		List<AResvBean> aresvList = aResvDAO.getCompletedResvByPage(start, pageSize);

		model.addAttribute("aresvList", aresvList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "admin/resv/aresvList";
	}

	// admin-�삁�빟 紐⑸줉 �궘�젣�븯湲�
	@RequestMapping(value = "/aResvDelete", method = RequestMethod.POST)
	public String aResvDelete(@RequestParam("rNo") String rNo, Model model) {
		// �궘�젣
		aResvDAO.aResvDelete(rNo);

		// 由щ떎�씠�젆�듃�븯吏� �븡怨� 洹몃�濡� resvList �럹�씠吏��뿉 �궓�룄濡� 諛섑솚
		return "redirect:/aresvList";
	}
}