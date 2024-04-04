package com.anim.clinic.client.item.biz;

import java.util.List;

public interface ItemDao {
	// public abstract List<ItemBean> itemList();
	
	public abstract ItemBean itemDetail(String name);
	
	public abstract List<ItemBean> getItemsByPage(int start, int pageSize);
	
	public abstract int getTotalItemCount();
}
