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

	// 기본 생성자 추가
		public AUserDAOImpl() {
		}
		
	@Override
	public AUserBean pickId(String u_id) {
		AUserBean vo = (AUserBean) sqlSessionTemplate.selectOne("pickId", u_id);
		return vo;
	}

	@Override
	public void insert(AUserBean aUserBean) {
		sqlSessionTemplate.insert("insert", aUserBean);
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

	@Override
	public AUserBean getUserDetail(String u_id) {
		AUserBean getUserDetail = sqlSessionTemplate.selectOne("getUserDetail", u_id);
		if (getUserDetail != null) {
			return getUserDetail;
		}else {
			return null;
		}
	}
	
	@Override
	public void memberUpdate(AUserBean aUserBean) {
	    sqlSessionTemplate.update("memberUpdate", aUserBean);
	}
	
	@Override
	public void memberDelete(String u_id) {
	    sqlSessionTemplate.delete("memberDelete", u_id);
	}
	
}
