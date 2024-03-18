package com.anim.clinic.client.resv.biz;

import java.util.List;

public interface ResvDAO {
	public int selectPriceCl();
	
	public int selectPriceBtca(PetBean petBean);
	
	public int selectMaxRNo();
	
	public int insertResv(ResvBean resvBean);
	
	public int selectResv();
	
	public List<ResvBean> selectResvList(String code);
}
