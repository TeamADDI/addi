package com.anim.clinic.admin.user.biz;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AUserDAOImpl implements AUserDAO {

	private SqlSessionTemplate sqlSessionTemplate;

	@Autowired
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	@Override
	public int countBoard() {
		return sqlSessionTemplate.selectOne("com.anim.clinic.admin.user.biz.AUserDAO.countBoard");
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
	public AUserBean detail(String u_id) {
		AUserBean vo = (AUserBean) sqlSessionTemplate.selectOne("detail", u_id);
		return vo;
	}

	@Override
	public AUserBean getMemberDetail(String u_id) {
		AUserBean getMemberDetail = sqlSessionTemplate.selectOne("getMemberDetail", u_id);
		if (getMemberDetail != null) {
			return getMemberDetail;
		} else {
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

	@Override
	public void memberRegist(AUserBean aUserBean) {
		sqlSessionTemplate.insert("memberRegist", aUserBean);
	}

	@Override
	public List<AUserBean> selectBoard(PagingBean vo) {
		return sqlSessionTemplate.selectList("com.anim.clinic.admin.user.biz.AUserDAO.selectBoard", vo);
	}

	@Override
	public int checkDuplicateId(String u_id) {
		return sqlSessionTemplate.selectOne("checkDuplicateId", u_id);
	}

	// 통계 리스트
	@Override
	public List<ChartBean> joinChart() {
		return sqlSessionTemplate.selectList("joinChart");
	}

	@Override
	public List<ChartBean> resvChart() {
		return sqlSessionTemplate.selectList("resvChart");
	}

	@Override
	public List<ChartBean> payChart() {
		return sqlSessionTemplate.selectList("payChart");
	}

	@Override
	public List<ChartBean> cartChart() {
		return sqlSessionTemplate.selectList("cartChart");
	}
}
