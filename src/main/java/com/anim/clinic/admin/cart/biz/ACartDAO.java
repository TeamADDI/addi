package com.anim.clinic.admin.cart.biz;

import java.util.List;
import java.util.Map;

public interface ACartDAO {

	public void update(ACartBean aCartBean);

	public void delete(ACartBean aCartBean);

	public List<Map<String, Object>> list(int page, int pageSize, Map<String, Object> map);

	public int getTotalCount();
}
