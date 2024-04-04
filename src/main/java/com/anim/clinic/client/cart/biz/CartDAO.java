package com.anim.clinic.client.cart.biz;

import java.util.List;
import java.util.Map;

public interface CartDAO {
	// public abstract List<CartBean> cartList(String u_id);

	public abstract void insertCart(CartBean cartBean);

	// 장바구니 상품 수량 수정하기
	public abstract void update(CartBean cartBean);

	// 장바구니 상품에서 삭제하기
	public abstract void delete(CartBean CartBean);

	// 장바구니에 담긴 상품의 총 갯수
	public int countCart();

	// 페이징 처리 장바구니내역 조회
	public abstract List<Map<String, Object>> list();

	// 인기상품 불러오기 도전중
	public List<Map<String, Object>> getBestItems();
	
	public abstract List<CartBean> getCartByPage(int start, int pageSize, String u_id);

	public abstract int getTotalCartCount(String u_id);
}