package com.anim.clinic.admin.pay.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class APayDAOImpl implements APayDAO {

	private final SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public APayDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

//	@Override
//	public List<ACompletedPayBean> getCompletedPayments() {
//		return sqlSessionTemplate.selectList("com.anim.clinic.admin.pay.biz.APayDAO.getCompletedPayments");
//	}

	@Override
	public void payDelete(int p_number) {
		sqlSessionTemplate.delete("com.anim.clinic.admin.pay.biz.APayDAO.payDelete", p_number);
	}

	@Override
	public List<ACompletedPayBean> getCompletedPaymentsByPage(int start, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		return sqlSessionTemplate.selectList("com.anim.clinic.admin.pay.biz.APayDAO.getCompletedPaymentsByPage",
				params);
	}

	@Override
	public int getTotalCompletedPaymentsCount() {
		return sqlSessionTemplate.selectOne("com.anim.clinic.admin.pay.biz.APayDAO.getTotalCompletedPaymentsCount");
	}

}
