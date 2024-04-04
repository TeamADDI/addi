package com.anim.clinic.admin.resv.biz;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("aResvDAO")
public interface AResvDAO {

	public int selectPriceCl();

	public int selectPriceBtca(APetBean petBean);

	public int selectMaxRNo();

	public int insertResv(AResvBean tempBean);

	public List<AResvBean> selectResvList(String code);

	public List<AResvBean> getCompletedResvByPage(int start, int pageSize);

	public int getTotalCompletedResvCount();

	// �삁�빟 �궡�뿭 �궘�젣�븯湲�
	public void getResvDelete(String r_no);

	// �삁�빟 �궡�뿭 �궘�젣�븯湲�
	public void aResvDelete(String rNo);

}
