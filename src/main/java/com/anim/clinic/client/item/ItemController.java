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

import com.anim.clinic.client.item.biz.ItemBean;
import com.anim.clinic.client.item.biz.ItemDao;

@Controller
public class ItemController {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value="/client/item/list", method=RequestMethod.GET)
	public String itemList(Model model) {
		ItemDao itemDao= sqlSessionTemplate.getMapper(ItemDao.class); 
		List<ItemBean> itemList = itemDao.itemList();
		model.addAttribute("itemList", itemList);
		return "/client/item/itemList"; 
	}
	
	@RequestMapping(value="/client/item/detail/num/{num}") 
	public String showItemDetail(@PathVariable String num, HttpServletRequest req, 
			HttpServletResponse resp, Model model) {
	    
		ItemDao itemDao = sqlSessionTemplate.getMapper(ItemDao.class);
		ItemBean showItemDetail = itemDao.itemDetail(num);
		model.addAttribute("itemDetail", showItemDetail);
		
		return "/client/item/itemDetail";
	}
	
}
