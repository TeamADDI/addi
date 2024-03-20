package com.anim.clinic.client.item.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDaoImpl implements ItemDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<ItemBean> itemList() {
		return sqlSessionTemplate.selectList("itemList");
	}
	
	public ItemBean itemDetail(String num) {
		ItemBean itemBean = (ItemBean) sqlSessionTemplate.selectOne("itemDetail", num);
		return itemBean;
	}
}
