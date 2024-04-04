package com.anim.clinic.client.item;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.anim.clinic.client.item.biz.ItemBean;
import com.anim.clinic.client.item.biz.ItemDao;

@Controller
public class ItemController {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private ItemDao itemDao;

//	@RequestMapping(value="/client/item/list", method=RequestMethod.GET)
//	public String itemList(Model model, Paging page) throws Exception {
//		int totalCount = itemDao.countItemTotal();
//		
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setPage(page);
//		pageMaker.setTotalCount(totalCount);
//		
//		ItemDao itemDao= sqlSessionTemplate.getMapper(ItemDao.class); 
//		List<ItemBean> itemList = itemDao.itemList(page);
//		
//		model.addAttribute("itemList", itemList);
//		model.addAttribute("pageMaker", pageMaker);
//		return "/client/item/test2"; 
//	}

	@RequestMapping(value = "/client/item/list", method = RequestMethod.GET)
	public String itemList(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "9") int pageSize) {
		// 전체 데이터 수
		int totalCount = itemDao.getTotalItemCount();

		// 전체 페이지 수
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		// 시작 인덱스 계산
		int start = (page - 1) * pageSize;

		// 해당 페이지의 데이터 가져오기
		List<ItemBean> items = itemDao.getItemsByPage(start, pageSize);

		// 모델에 데이터 추가
		model.addAttribute("items", items);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "/client/item/itemList";
	}
	
	

	@RequestMapping(value = "/client/item/detail/num/{num}")
	public String showItemDetail(@PathVariable String num, HttpServletRequest req, HttpServletResponse resp,
			Model model) {
		
		ItemDao itemDao = sqlSessionTemplate.getMapper(ItemDao.class);
		ItemBean showItemDetail = itemDao.itemDetail(num);
		// model.addAttribute("itemDetail", showItemDetail);
		// HttpServletRequest객체를 사용하여 데이터를 request영역에 담아
		req.setAttribute("itemDetail", showItemDetail);

		return "/client/item/itemDetail";
	}

}
