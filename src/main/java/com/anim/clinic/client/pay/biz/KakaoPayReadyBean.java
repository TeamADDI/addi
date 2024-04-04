package com.anim.clinic.client.pay.biz;

import java.util.Date;

public class KakaoPayReadyBean {

	//response
	private String tid;
	private String next_redirect_pc_url;
	private Date created_at;
	private String android_app_scheme;
	private String ios_app_scheme;
	

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getNext_redirect_pc_url() {

		return next_redirect_pc_url;
	}

	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public String getAndroid_app_scheme() {
		return android_app_scheme;
	}

	public void setAndroid_app_scheme(String android_app_scheme) {
		this.android_app_scheme = android_app_scheme;
	}

	public String getIos_app_scheme() {
		return ios_app_scheme;
	}

	public void setIos_app_scheme(String ios_app_scheme) {
		this.ios_app_scheme = ios_app_scheme;
	}

	@Override
	public String toString() {
		return "KakaoPayReadyBean [tid=" + tid + ", next_redirect_pc_url=" + next_redirect_pc_url + ", created_at="
				+ created_at + ", android_app_scheme=" + android_app_scheme + ", ios_app_scheme=" + ios_app_scheme
				+ "]";
	}

}