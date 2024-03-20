package com.anim.clinic.admin.user.biz;

import java.util.Date;

public class AUserBean {
	private int u_no;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_email;
	private String u_tel;
	private Date u_birth;
	private int u_age;
	private String u_gender;
	private String u_post;
	private String u_addr;
	private Date u_regdate;

	public AUserBean() {
	}

	public int getU_no() {
		return u_no;
	}

	public void setU_no(int u_no) {
		this.u_no = u_no;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_tel() {
		return u_tel;
	}

	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}

	public Date getU_birth() {
		return u_birth;
	}

	public void setU_birth(Date u_birth) {
		this.u_birth = u_birth;
	}

	public int getU_age() {
		return u_age;
	}

	public void setU_age(int u_age) {
		this.u_age = u_age;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_post() {
		return u_post;
	}

	public void setU_post(String u_post) {
		this.u_post = u_post;
	}

	public String getU_addr() {
		return u_addr;
	}

	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}

	public Date getU_regdate() {
		return u_regdate;
	}

	public void setU_regdate(Date u_regdate) {
		this.u_regdate = u_regdate;
	}

	@Override
	public String toString() {
		return "AUserVO [u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_email=" + u_email + ", u_tel="
				+ u_tel + ", u_birth=" + u_birth + ", u_age=" + u_age + ", u_gender=" + u_gender + ", u_post=" + u_post
				+ ", u_addr=" + u_addr + ", u_regdate=" + u_regdate + "]";
	}

}
