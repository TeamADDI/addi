package com.anim.clinic.admin.cart.biz;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ACartService {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("aCart.list", map);
	}
}
