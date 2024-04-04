package com.anim.clinic.client.resv.biz;

import java.util.List;

public interface ResvDAO {
	public int selectPriceCl();

	public int selectPriceBtca(PetBean petBean);

	public Integer selectMaxRNo();

	public int insertResv(ResvBean resvBean);

	public List<ResvBean> selectResvList(String code);

	public int updateStatus(String code); // 추가 코드

	public int deleteResv(String rCode);

	public List<ResvBean> selectMyResvList(String u_id);
}