package com.anim.clinic.admin.resv.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("aResvDAO")
public class AResvDAOImpl implements AResvDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	

	@Override
	public void aResvDelete(String rNo) {
		sqlSessionTemplate.delete("com.anim.clinic.admin.resv.biz.AResvDAO.aResvDelete", rNo);
	}
	

	@Override
	public int selectPriceCl() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectPriceBtca(APetBean petBean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectMaxRNo() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertResv(AResvBean tempBean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AResvBean> selectResvList(String code) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//�삁�빟 �궡�뿭 �궘�젣�븯湲�
	@Override
	public void getResvDelete(String r_no) {
	    sqlSessionTemplate.delete("resvDelete", r_no);
	}
	
	@Override
	public List<AResvBean> getCompletedResvByPage(int start, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		return sqlSessionTemplate.selectList("com.anim.clinic.admin.resv.biz.AResvDAO.getCompletedResvByPage",
				params);
	}

	@Override
	public int getTotalCompletedResvCount() {
		return sqlSessionTemplate.selectOne("com.anim.clinic.admin.resv.biz.AResvDAO.getTotalCompletedResvCount");
	}

}
