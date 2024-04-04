package com.anim.clinic.client.resv.biz;

import java.util.List;

public interface ResvService {

	public String getItemName(String[] arrayCategories);

	public int getPrice();

	public int getPrice(PetBean petBean);

	public List<ResvBean> saveResv(String uId, ResvBean resvBean, String[] arrayCategories);

	public int getTotalAmount(List<ResvBean> resvList);

	public List<ResvBean> getResvList(String code);
	
	public int updateStatus(String code); // 추가 코드

	public int deleteResv(String rCode);

	public List<ResvBean> selectMyResvList(String u_id);
}