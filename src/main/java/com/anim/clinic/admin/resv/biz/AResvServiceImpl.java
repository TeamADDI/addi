package com.anim.clinic.admin.resv.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anim.clinic.client.user.biz.UserBean;
import com.anim.clinic.client.user.biz.UserDAO;

@Service("aResvService")
public class AResvServiceImpl implements AResvService {

	private static final String AResvDao = null;
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public String getItemName(String[] arrayCategories) {
		String itemName = "";

		for (String category : arrayCategories) {
			if (category.equals("CL")) {
				itemName += "吏꾨즺 ";
			} else if (category.equals("BT")) {
				itemName += "誘몄슜 ";
			} else {
				itemName += "�룎遊�";
			}
		}

		return itemName;
	}

	public int getPrice() {
		AResvDAO dao = sqlSessionTemplate.getMapper(AResvDAO.class);
		return dao.selectPriceCl();
	}

	public int getPrice(APetBean petBean) {
		AResvDAO dao = sqlSessionTemplate.getMapper(AResvDAO.class);
		return dao.selectPriceBtca(petBean);
	}

	public List<AResvBean> saveResv(String uId, AResvBean resvBean, String[] arrayCategories) {
		AResvDAO dao = sqlSessionTemplate.getMapper(AResvDAO.class);
		UserDAO userDao = sqlSessionTemplate.getMapper(UserDAO.class);
		List<AResvBean> resvList = new ArrayList<>();

		UserBean userDetail = userDao.detail(uId);

		APetBean petBean = new APetBean();
		String size = resvBean.getrPetSize();
		petBean.setpSize(size);

		int price = 0;
		int tempNo = dao.selectMaxRNo() + 1;
		String formattedNo = String.format("%04d", tempNo);

		for (String category : arrayCategories) {
			AResvBean tempBean = new AResvBean();

			String rCode = category + formattedNo;

			tempBean.setrCode(rCode);
			tempBean.setpCategory(category);

			tempBean.setuId(userDetail.getU_id());
			tempBean.setuName(userDetail.getU_name());
			tempBean.setuTel(userDetail.getU_tel());
			tempBean.setuEmail(userDetail.getU_email());
			tempBean.setuPost(userDetail.getU_post());
			tempBean.setuAddr(userDetail.getU_addr());

			tempBean.setrName(resvBean.getrName());
			tempBean.setrTel(resvBean.getrTel());

			tempBean.setrPetName(resvBean.getrPetName());
			tempBean.setrPetAge(resvBean.getrPetAge());
			tempBean.setrPetGender(resvBean.getrPetGender());
			tempBean.setrPetType(resvBean.getrPetType());
			tempBean.setrPetSize(resvBean.getrPetSize());

			tempBean.setrDetail(resvBean.getrDetail());
			tempBean.setrStatus("�삁�빟�셿猷�");
			tempBean.setrDate(resvBean.getrDate());
			tempBean.setrTime(resvBean.getrTime());

			petBean.setpCategory(category);

			if (category.equals("CL")) {
				tempBean.setKrCategory("吏꾨즺");
				price = getPrice();
			} else if (category.equals("BT")) {
				tempBean.setKrCategory("誘몄슜");
				price = getPrice(petBean);
			} else if (category.equals("CA")) {
				tempBean.setKrCategory("�룎遊�");
				price = getPrice(petBean);
			}

			tempBean.setrPrice(price);

			int n = dao.insertResv(tempBean);
			resvList.add(tempBean);
		}

		return resvList;
	}

	public int getTotalAmount(List<AResvBean> resvList) {
		int total = 0;

		for (AResvBean resv : resvList) {
			total += resv.getrPrice();
		}

		return total;
	}

	public List<AResvBean> getResvList(String code) {
		AResvDAO dao = sqlSessionTemplate.getMapper(AResvDAO.class);
		List<AResvBean> resvList = new ArrayList<>();
		resvList = dao.selectResvList(code);

		return resvList;
	}

	@Override
	public List<AResvBean> selectResvList() {
		return sqlSessionTemplate.selectList("selectAResvList");
	}

	@Override
	public List<AResvBean> getResvByPage(int start, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", start);
		params.put("pageSize", pageSize);
		return sqlSessionTemplate.selectList("com.anim.clinic.admin.resv.biz.aResvDAO.getResvByPage", params);
	}

	@Override
	public int getTotalResvCount() {
		return sqlSessionTemplate.selectOne("com.anim.clinic.admin.resv.biz.aResvDAO.getTotalResvCount");
	}

	// @Override
	// public List<Map<String, Object>> getResvByPage(int start, int pageSize,
	// Map<String, Object> map) {
	// map.put("start", start);
	// map.put("pageSize", pageSize);
	// return aResvDAO.selectList(map);
	// }

	// @Override
	// public int getTotalResvCount() {
	// return aResvDAO.getTotalResvCount();
	// }

	// @Override
	// public List<Map<String, Object>> list(Map<String, Object> map){
	// return this.aItemDao.selectList(map);
	// }

}
