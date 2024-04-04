package com.anim.clinic.admin.item.biz;

import java.util.List;
import java.util.Map;


public interface AItemService {

	String create(Map<String, Object> map);

	Map<String, Object> detail(String itemNum);

	boolean edit(Map<String, Object> map);

	boolean remove(Map<String, Object> map);

	// List<Map<String, Object>> list(Map<String, Object> map);
	
	List<Map<String, Object>> list(int start, int pageSize, Map<String, Object> map);
	
	int getTotalCount();

}
