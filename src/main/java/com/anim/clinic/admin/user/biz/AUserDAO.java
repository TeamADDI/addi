package com.anim.clinic.admin.user.biz;

import java.util.List;

public interface AUserDAO {
	public abstract AUserBean pickId(String u_id);

	public abstract void insert(AUserBean aUserBean);

	public abstract AUserBean detail(String u_id);

	public abstract List<AUserBean> list();

	// 회원 정보 상세보기
	public abstract AUserBean getUserDetail(String u_id);
	// 회원 정보 수정하기
	public void memberUpdate(AUserBean aUserBean);
	// 회원 정보 삭제하기
	public void memberDelete(String u_id);
}
