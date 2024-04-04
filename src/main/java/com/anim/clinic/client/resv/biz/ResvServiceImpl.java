package com.anim.clinic.client.resv.biz;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anim.clinic.client.user.biz.UserBean;
import com.anim.clinic.client.user.biz.UserDAO;

@Service("resvService")
public class ResvServiceImpl implements ResvService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public String getItemName(String[] arrayCategories) {
		String itemName = "";

		for (String category : arrayCategories) {
			if (category.equals("CL")) {
				itemName += "진료 ";
			} else if (category.equals("BT")) {
				itemName += "미용 ";
			} else {
				itemName += "돌봄";
			}
		}

		return itemName;
	}

	public int getPrice() {
		ResvDAO dao = sqlSessionTemplate.getMapper(ResvDAO.class);
		return dao.selectPriceCl();
	}

	public int getPrice(PetBean petBean) {
		ResvDAO dao = sqlSessionTemplate.getMapper(ResvDAO.class);
		return dao.selectPriceBtca(petBean);
	}

	public List<ResvBean> saveResv(String uId, ResvBean resvBean, String[] arrayCategories) {
	      ResvDAO dao = sqlSessionTemplate.getMapper(ResvDAO.class);
	      UserDAO userDao = sqlSessionTemplate.getMapper(UserDAO.class);
	      List<ResvBean> resvList = new ArrayList<>();

	      UserBean userDetail = userDao.detail(uId);

	      PetBean petBean = new PetBean();
	      String size = resvBean.getrPetSize();
	      petBean.setpSize(size);

	      Integer tempNo = dao.selectMaxRNo();
	      String formattedNo = "";
	      
	      if (tempNo != null) {
	         tempNo++;
	      } else {
	         tempNo = 1;
	      }
	      
	      formattedNo = String.format("%04d", tempNo);
	      
	      int price = 0;

		for (String category : arrayCategories) {
			ResvBean tempBean = new ResvBean();

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
			tempBean.setrStatus("예약완료");
			tempBean.setrDate(resvBean.getrDate());
			tempBean.setrTime(resvBean.getrTime());

			petBean.setpCategory(category);

			if (category.equals("CL")) {
				tempBean.setKrCategory("진료");
				price = getPrice();
			} else if (category.equals("BT")) {
				tempBean.setKrCategory("미용");
				price = getPrice(petBean);
			} else if (category.equals("CA")) {
				tempBean.setKrCategory("돌봄");
				price = getPrice(petBean);
			}

			tempBean.setrPrice(price);

			resvList.add(tempBean);
		}

		for (ResvBean bean : resvList) {
			int n = dao.insertResv(bean);
		}

		return resvList;
	}

	public int getTotalAmount(List<ResvBean> resvList) {
		int total = 0;

		for (ResvBean resv : resvList) {
			total += resv.getrPrice();
		}

		return total;
	}

	public List<ResvBean> getResvList(String code) {
		ResvDAO dao = sqlSessionTemplate.getMapper(ResvDAO.class);
		List<ResvBean> resvList = new ArrayList<>();
		resvList = dao.selectResvList(code);

		return resvList;
	}

	// 추가 코드
	public int updateStatus(String code) {
		ResvDAO dao = sqlSessionTemplate.getMapper(ResvDAO.class);
		return dao.updateStatus(code);
	}

	public int deleteResv(String rCode) {
		ResvDAO dao = sqlSessionTemplate.getMapper(ResvDAO.class);
		return dao.deleteResv(rCode);
	}

	public List<ResvBean> selectMyResvList(String u_id) {
		ResvDAO dao = sqlSessionTemplate.getMapper(ResvDAO.class);
		List<ResvBean> myResvList = new ArrayList<>();
		myResvList = dao.selectMyResvList(u_id);

		return myResvList;
	}
}