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
	public UserBean pickName(String u_name) {
		UserBean vo = (UserBean) sqlSessionTemplate.selectOne("pickName", u_name);
		return vo;
	}

	@Override
	public void insert(UserBean UserBean) {
		sqlSessionTemplate.insert("insert", UserBean);
	}

	@Override
	public UserBean pickEmail(String u_name) {
		UserBean vo = (UserBean) sqlSessionTemplate.selectOne("pickEmail", u_name);
		return vo;
	}

	@Override
	public UserBean detail(String u_id) {
		UserBean vo = (UserBean) sqlSessionTemplate.selectOne("detail", u_id);
		return vo;
	}

	@Override
	public void update(UserBean userBean) {
		sqlSessionTemplate.update("update", userBean);
	}

	@Override
	public void delete(UserBean userBean) {
		sqlSessionTemplate.delete("delete", userBean);
	}

	// 아이디 중복 체크
	@Override
	public int checkDuplicateId(String u_id) {
		return sqlSessionTemplate.selectOne("checkDuplicateId", u_id);
	}

	// 비밀번호 찾기
	@Override
	public void updatePassword(UserBean userBean) {
		sqlSessionTemplate.update("upatePassword", userBean);
	}
}
