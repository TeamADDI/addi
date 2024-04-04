package com.anim.clinic.client.pay.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PayDAOImpl implements PayDAO {

	private final SqlSessionTemplate sqlSessionTemplate;


	@Autowired
	public PayDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public List<PayBean> list() {
		return sqlSessionTemplate.selectList("com.anim.clinic.client.pay.biz.PayDAO.list");
	}

	@Override
	public void insertPayDetail(KakaoPayApprovalBean kakaoPayApprovalBean) {
		sqlSessionTemplate.insert("com.anim.clinic.client.pay.biz.PayDAO.insertPayDetail", kakaoPayApprovalBean);
	}
}
