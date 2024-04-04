package com.anim.clinic.client.cart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.anim.clinic.admin.cart.biz.ACartDAO;
import com.anim.clinic.client.cart.biz.CartBean;
import com.anim.clinic.client.cart.biz.CartDAO;
import com.anim.clinic.client.cart.biz.PagingBean;

@Controller
public class CartController {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	private CartDAO cartDAO;

	// 장바구니 등록(변경된 부분)(상주)
	@RequestMapping(value = "/cartInsert", method = RequestMethod.POST)
	public String addCart(@RequestParam("c_name") String c_name, @RequestParam("c_category") String c_category,
			@RequestParam("c_quantity") String c_quantity, @RequestParam("c_price") String c_price,
			@RequestParam("item_num") String item_num, HttpSession session, Model model, HttpServletRequest req) {
		try {
			int quantity = Integer.parseInt(c_quantity);
			int price = Integer.parseInt(c_price);
			int num = Integer.parseInt(item_num);
			String u_id = (String) session.getAttribute("u_id");

			if (u_id != null) {
				CartBean vo = new CartBean();
				vo.setU_id(u_id);
				vo.setC_quantity(quantity);
				vo.setItem_num(num);
				vo.setC_name(c_name);
				vo.setC_category(c_category);
				vo.setC_price(price);

				CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);
				dao.insertCart(vo);
				return "redirect:/client/item/list";
			} else {
				session.setAttribute("referrer", "redirect:/client/item/detail/num/" + item_num);
				// 추가 수정!!(상주) 로그인하면서 장바구니 등록까지 완료할 수 있도록
				CartBean bean = new CartBean();

				bean.setC_quantity(quantity);
				bean.setItem_num(num);
				bean.setC_name(c_name);
				bean.setC_category(c_category);
				bean.setC_price(price);

				session.setAttribute("addItem", bean);
				// u_id를 받아야한다.
				return "client/user/clogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("exception", e);
			return "client/user/error";
		}
	}

	// 인기상품가져오기
	@RequestMapping(value = "/getBest", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> getBestItems() {
		CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);
		List<Map<String, Object>> bestItems = dao.getBestItems();
		System.out.println("이거 뜨면 되는 거");
		return bestItems;
	}

//	@RequestMapping(value = "/cartList")
//	public String getaCartList(Model model) {
//		CartDAO CartDAO = sqlSessionTemplate.getMapper(CartDAO.class);
//
//		List<Map<String, Object>> cartList = CartDAO.list();
//		model.addAttribute("viewAll", cartList);
//
//		return "/client/cart/cartList";
//	}

	//페이징 된 리스트 가져오기
		@RequestMapping(value = "/cartList", method = RequestMethod.GET)
		public String cartList(HttpSession session, Model model, @RequestParam(defaultValue = "1") int page,
				@RequestParam(defaultValue = "5") int pageSize) {

			String u_id = (String) session.getAttribute("u_id");
			CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);

			int totalCount = dao.getTotalCartCount(u_id);
			System.out.println("TotalCount는" + totalCount);

			int totalPages = (int) Math.ceil((double) totalCount / pageSize);
			System.out.println("Totalpages는" + totalPages);

			int start = (page - 1) * pageSize;
			System.out.println("start는" + start);

			List<CartBean> cartList = cartDAO.getCartByPage(start, pageSize, u_id);

			model.addAttribute("cartList", cartList);
			System.out.println("cartList는" + cartList);
			model.addAttribute("currentPage", page);
			model.addAttribute("totalPages", totalPages);
			System.out.println("Totalpages는" + totalPages);

			return "client/cart/cartList";
		}
		
		// 수정
		@RequestMapping(value = "/cartList/edit", method = RequestMethod.POST)
		public String update(@RequestParam String c_quantity, @RequestParam String c_name, HttpServletRequest req,
				HttpServletResponse res, HttpSession session) {
			
			String u_id = (String) session.getAttribute("u_id");
			CartBean vo = new CartBean();
			// String을 int로 변환하여 설정
			int quantity = Integer.parseInt(c_quantity);
			System.out.println("현재 수량은" + quantity);
			vo.setU_id(u_id);
			vo.setC_quantity(quantity);
			vo.setC_name(c_name);

			CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);
			dao.update(vo);

			return "redirect:/cartList";
		}

		// 삭제
		@RequestMapping(value = "/cartList/delete", method = RequestMethod.POST)
		public String delete(@RequestParam String c_name, HttpSession session) {
			String u_id = (String) session.getAttribute("u_id");	
			CartBean vo = new CartBean();
			vo.setC_name(c_name);
			vo.setU_id(u_id);
			CartDAO dao = sqlSessionTemplate.getMapper(CartDAO.class);
			dao.delete(vo); // 해당 정보 삭제
			System.out.println("해당 정보를 삭제했습니다.");

			return "redirect:/cartList";

		}

}
