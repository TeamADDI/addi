package com.anim.clinic.client.user.biz;

public interface UserDAO {

	public abstract UserBean pickId(String u_id);

	// 회원 입력
	public abstract void insert(UserBean userBean);

	// 회원 상세(1명)
	public abstract UserBean detail(String u_id);

	public abstract void update(UserBean userBean);

	public abstract void delete(UserBean userBean);

	// 아이디 중복 체크
	public abstract int checkDuplicateId(String u_id);

	public abstract UserBean pickEmail(String u_name);

	public abstract UserBean pickName(String u_name);

	// 비밀번호 찾기
	public void updatePassword(UserBean userBean);
}