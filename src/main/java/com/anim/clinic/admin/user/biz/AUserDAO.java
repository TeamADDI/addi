package com.anim.clinic.admin.user.biz;

import java.util.List;

public interface AUserDAO {

	public int countBoard();

	public abstract AUserBean pickId(String u_id);

	public abstract void insert(AUserBean aUserBean);

	public abstract AUserBean detail(String u_id);

	// 회원 정보 상세보기
	public abstract AUserBean getMemberDetail(String u_id);

	// 회원 정보 수정하기
	public void memberUpdate(AUserBean aUserBean);

	// 회원 정보 삭제하기
	public void memberDelete(String u_id);

	public abstract void memberRegist(AUserBean aUserBean);

	public abstract List<AUserBean> selectBoard(PagingBean vo);

	public int checkDuplicateId(String u_id);

	// 통계 리스트로 받아오기
	public abstract List<ChartBean> joinChart();

	public abstract List<ChartBean> resvChart();

	public abstract List<ChartBean> payChart();

	public abstract List<ChartBean> cartChart();
}
