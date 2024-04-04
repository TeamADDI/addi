package com.anim.clinic.admin.cart.biz;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ACartDAOImpl implements ACartDAO {

	private final SqlSession sqlSession;

	@Autowired
	public ACartDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Map<String, Object>> list(int start, int pageSize, Map<String, Object> map) {
		map.put("start", start);
		map.put("pageSize", pageSize);
		return sqlSession.selectList("com.anim.clinic.admin.cart.biz.ACartDAO.list", map);
	}

	@Override
	public int getTotalCount() {
		return sqlSession.selectOne("com.anim.clinic.admin.cart.biz.ACartDAO.getTotalCount");
	}

	@Override
	public void update(ACartBean aCartBean) {
		sqlSession.update("com.anim.clinic.admin.cart.biz.ACartDAO.update", aCartBean);

	}

	@Override
	public void delete(ACartBean aCartBean) {
		sqlSession.delete("com.anim.clinic.admin.cart.biz.ACartDAO.delete", aCartBean);
	}

}