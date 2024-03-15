package com.anim.clinic.admin.user.biz;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AUserDAOImpl implements AUserDAO {

	@Inject
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public AUserBean pickId(String u_id) {
		AUserBean vo = (AUserBean) sqlSessionTemplate.selectOne("pickId", u_id);
		return vo;
	}

	@Override
	public void insert(AUserBean aUserVO) {
		sqlSessionTemplate.insert("insert", aUserVO);
	}

	@Override
	public List<AUserBean> list() {
		return sqlSessionTemplate.selectList("list");
	}

	@Override
	public AUserBean detail(String u_id) {
		AUserBean vo = (AUserBean) sqlSessionTemplate.selectOne("detail", u_id);
		return vo;
	}

}
