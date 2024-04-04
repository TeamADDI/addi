package com.anim.clinic.client.cart.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartDAOImpl implements CartDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertCart(CartBean cartBean) {
		sqlSessionTemplate.insert("insertCart", cartBean);
	}

	// 장바구니 내 상품갯수
	@Override
	public int countCart() {
		return sqlSessionTemplate.selectOne("com.anim.clinic.client.cart.biz.CartDAO.countCart");
	}

	@Override
	public List<Map<String, Object>> list() {
		return sqlSessionTemplate.selectList("com.anim.clinic.admin.cart.biz.CartDAO.list");
	}

	// 수정
	@Override
	public void update(CartBean cartBean) {
		sqlSessionTemplate.update("update", cartBean);
	}

	// 삭제
	@Override
	public void delete(CartBean cartBean) {
		sqlSessionTemplate.delete("delete", cartBean);
	}

	// 인기상품 불러오기 도전
	@Override
	public List<Map<String, Object>> getBestItems() {
		return sqlSessionTemplate.selectList("com.anim.clinic.client.cart.biz.CartDAO.getBestItems");
	}

	// 페이징 된 리스트
	@Override
	public List<CartBean> getCartByPage(int start, int pageSize, String u_id) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		params.put("u_id", u_id);
		return sqlSessionTemplate.selectList("com.anim.clinic.client.cart.biz.CartDAO.getCartByPage", params);
	}

	@Override
	public int getTotalCartCount(String u_id) {
		return sqlSessionTemplate.selectOne("com.anim.clinic.client.cart.biz.CartDAO.getTotalCartCount");
	}
}