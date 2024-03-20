package com.anim.clinic.admin.item.biz;

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
	public Map<String, Object> detail(Map<String, Object> map){
	    return this.aItemDao.selectDetail(map);
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
	public List<Map<String, Object>> list(Map<String, Object> map){  
		return this.aItemDao.selectList(map);  
	}  



}
