package com.anim.clinic.client.user.biz;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDAOImpl implements UserDAO {
	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public UserBean pickId(String u_id) {
//		AUserVO vo = (AUserVO) sqlSessionTemplate.selectOne("pickId", u_id);
		UserBean vo = (UserBean) sqlSessionTemplate.selectOne("pickId", u_id);
		return vo;
	}

	@Override
	public void insert(UserBean UserBean) {
		sqlSessionTemplate.insert("insert", UserBean);
	}

	@Override
	public UserBean detail(String u_id) {
		UserBean vo = (UserBean) sqlSessionTemplate.selectOne("detail", u_id);
		return vo;
	}
}
