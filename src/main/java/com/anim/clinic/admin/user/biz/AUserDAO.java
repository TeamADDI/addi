package com.anim.clinic.admin.user.biz;

import java.util.List;

public interface AUserDAO {
	public abstract AUserBean pickId(String u_id);

	public abstract void insert(AUserBean aUserVO);

	public abstract AUserBean detail(String u_id);

	public abstract List<AUserBean> list();

}
