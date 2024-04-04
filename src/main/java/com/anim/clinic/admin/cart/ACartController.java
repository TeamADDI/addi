package com.anim.clinic.admin.cart;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.anim.clinic.admin.cart.biz.ACartBean;
import com.anim.clinic.admin.cart.biz.ACartDAO;

@Controller
public class ACartController {

	@Autowired
	private ACartDAO aCartDAO;

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@RequestMapping(value = "/aCartList")
	public ModelAndView list(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize, @RequestParam Map<String, Object> map) {

		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);

		List<Map<String, Object>> list = this.aCartDAO.list(page, pageSize, map);

		int totalCount = this.aCartDAO.getTotalCount();

		ModelAndView mav = new ModelAndView();
		mav.addObject("aCartList", list);

		mav.addObject("currentPage", page);
		mav.addObject("pageSize", pageSize);
		mav.addObject("totalCount", totalCount);
		mav.addObject("totalPages", (int) Math.ceil((double) totalCount / pageSize));

		mav.setViewName("/admin/cart/aCartList");
		return mav;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@RequestParam("c_quantity") int c_quantity, @RequestParam("c_no") int c_no) {
		ACartDAO dao = sqlSessionTemplate.getMapper(ACartDAO.class);
		ACartBean aCartBean = new ACartBean();
		aCartBean.setC_no(c_no);
		aCartBean.setC_quantity(c_quantity);
		dao.update(aCartBean);
		return "redirect:/aCartList";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("c_no") int c_no) {
		ACartDAO dao = sqlSessionTemplate.getMapper(ACartDAO.class);
		ACartBean aCartBean = new ACartBean();
		aCartBean.setC_no(c_no);
		dao.delete(aCartBean);
		return "redirect:/aCartList";
	}

}
