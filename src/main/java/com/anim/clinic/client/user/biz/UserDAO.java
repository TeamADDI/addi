package com.anim.clinic.client.user.biz;

public interface UserDAO {
//	public abstract List<AUserVO> list();
//	public abstract void insert(AUserVO aUserVO);
	public abstract UserBean pickId(String u_id);

	public abstract void insert(UserBean userBean);

	public abstract UserBean detail(String u_id);
}
