package com.anim.clinic.admin.resv.biz;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface AResvService {

	public String getItemName(String[] arrayCategories);

	public int getPrice();

	public int getPrice(APetBean petBean);

	public List<AResvBean> saveResv(String uId, AResvBean bean, String[] arrayCategories);

	public int getTotalAmount(List<AResvBean> aResvList);

	public List<AResvBean> getResvList(String code);

	public List<AResvBean> selectResvList();

	public List<AResvBean> getResvByPage(int start, int pageSize);

	public int getTotalResvCount();
	
	
	
}
