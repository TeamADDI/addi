package com.anim.clinic.client.item.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDaoImpl implements ItemDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
//	public List<ItemBean> itemList() {
//		return sqlSessionTemplate.selectList("itemList");
//	}
	
	public ItemBean itemDetail(String name) {
		ItemBean itemBean = (ItemBean) sqlSessionTemplate.selectOne("itemDetail", name);
		return itemBean;
	}

	@Override
	public List<ItemBean> getItemsByPage(int start, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		return sqlSessionTemplate.selectList
				("com.anim.clinic.client.item.biz.ItemDao.getItemsByPage", params);
	}

	@Override
	public int getTotalItemCount() {
		return sqlSessionTemplate.selectOne(
				"com.anim.clinic.client.item.biz.ItemDao.getTotalItemCount");
	}
}
