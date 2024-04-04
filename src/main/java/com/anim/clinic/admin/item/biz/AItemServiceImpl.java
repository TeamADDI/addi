package com.anim.clinic.admin.item.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AItemServiceImpl implements AItemService {
	@Autowired
	AItemDao	aItemDao;
	
	@Override
	public String create(Map<String, Object> map) {
	    int affectRowCount = this.aItemDao.insert(map);
	    if (affectRowCount ==  1) {
	        return map.get("item_num").toString();
	    }
	    return null;

	}
	
	@Override
	public Map<String, Object> detail(String itemNum){
		Map<String, Object> map = new HashMap<>();
		map.put("itemNum", itemNum);
	    return aItemDao.selectDetail(map);
	}

	@Override  
	public boolean edit(Map<String, Object> map) {  
		int affectRowCount = this.aItemDao.update(map);  
		return affectRowCount == 1;  
	}  

	@Override  
	public boolean remove(Map<String, Object> map) {  
		int affectRowCount = this.aItemDao.delete(map);  
		return affectRowCount == 1;  
	}

	@Override
	public List<Map<String, Object>> list(int start, int pageSize, Map<String, Object> map) {
		map.put("start", start);
		map.put("pageSize", pageSize);
		return aItemDao.selectList(map);
	}

	@Override
	public int getTotalCount() {
		return aItemDao.getTotalItemCount();
	}

	
//	@Override  
//	public List<Map<String, Object>> list(Map<String, Object> map){  
//		return this.aItemDao.selectList(map);  
//	}  



}
