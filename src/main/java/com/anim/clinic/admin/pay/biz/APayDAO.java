package com.anim.clinic.admin.pay.biz;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public interface APayDAO {
//	List<ACompletedPayBean> getCompletedPayments();

	void payDelete(int p_number);

	List<ACompletedPayBean> getCompletedPaymentsByPage(int start, int pageSize);

	int getTotalCompletedPaymentsCount();

}