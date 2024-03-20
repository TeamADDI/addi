package com.anim.clinic.admin.item.biz;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AItemDao {
	@Autowired
	SqlSessionTemplate	sqlSessionTemplate;
	
	public int insert(Map<String, Object> map) {
		  return this.sqlSessionTemplate.insert("aItem.insert", map);
	}
	
	public Map<String, Object> selectDetail(Map<String, Object> map) {
	    return this.sqlSessionTemplate.selectOne("aItem.select_detail", map);
	}
	
	public int update(Map<String, Object> map) {  
		return this.sqlSessionTemplate.update("aItem.update", map);  
	}  
	
	public int delete(Map<String, Object> map) {  
		return this.sqlSessionTemplate.delete("aItem.delete", map);  
	}  
	
	public List<Map<String, Object>> selectList(Map<String, Object> map) {  
		return this.sqlSessionTemplate.selectList("aItem.select_list", map);  
	}  


}
