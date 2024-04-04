package com.anim.clinic.client.pay.biz;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public interface PayDAO {

	public List<PayBean> list();

	void insertPayDetail(KakaoPayApprovalBean kakaoPayApprovalBean);
}
