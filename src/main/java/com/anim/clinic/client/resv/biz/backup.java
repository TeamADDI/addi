package com.anim.clinic.client.resv.biz;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class backup {
	//@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//@RequestMapping(value = "/resvForm", method = RequestMethod.GET)
	public String getResvForm() {
		return "client/resv/resvForm"; // 예약 등록 페이지
	}
	
	//@RequestMapping(value = "/resvList", method = RequestMethod.POST)
	public String insertResvList() {
		return "client/resv/resvList"; // 예약 리스트 페이지
	}
	
	// 수정으로 변경
	//@RequestMapping(value = "/resvConfirm", method = RequestMethod.POST)
	public String getResvConfirm(@ModelAttribute("resvInfo") ResvBean resvBean, PetBean petBean, Model model) {
		ResvDAO dao = sqlSessionTemplate.getMapper(ResvDAO.class);
		
		String[] selectedCategories = resvBean.getpCategory().split(",");
		//resvBean.setResvCount(selectedCategories.length);
		petBean.setpSize(resvBean.getrPetSize());
		
		String pCategory = resvBean.getpCategory();
		String copyPCategory = pCategory;
		String krPCategory = "";
		int rTotal = 0;
		
		if (pCategory.contains("cl")) {
			krPCategory += "진료 ";
			petBean.setpCategory("cl");
			//rTotal += dao.selectPriceCl().getpPrice();
		}
		if (pCategory.contains("bt")) {
			krPCategory += "미용 ";
			petBean.setpCategory("bt");
			//rTotal += dao.selectPriceBtca(petBean).getpPrice();
		}
		if (pCategory.contains("ca")) {
			krPCategory += "돌봄";
			petBean.setpCategory("ca");
			//rTotal += dao.selectPriceBtca(petBean).getpPrice();
		}
		
		resvBean.setKrCategory(krPCategory);
		//resvBean.setrTotal(rTotal);
		
		String input = "cl,bt,ca";
		String[] categories = input.split(",");
		
		int tempNo = dao.selectMaxRNo() + 1;
		String formattedNo = String.format("%04d", tempNo);
		for (String category : categories) {
		    String rCode = category + formattedNo;
		    resvBean.setrCode(rCode);
		    resvBean.setpCategory(category);
		    
		    
		    // 유저 연결 전까지 사용
		    resvBean.setuId(resvBean.getrName());
		    resvBean.setuName(resvBean.getrName());
		    resvBean.setuTel(resvBean.getrTel());
		    resvBean.setuEmail("test@test.com");
		    resvBean.setuPost("12345");
		    resvBean.setuAddr("김포시 사우동");
		    // 여기까지
		    
		    resvBean.setrStatus("예약완료");
		    
		    int n = dao.insertResv(resvBean);
		    
		}
		
		
		resvBean.setpCategory(copyPCategory);
		model.addAttribute("resvInfo", resvBean);
		System.out.println("confirm resvBean" + resvBean);
		
		return "client/resv/resvConfirm"; // 예약 확인 페이지
	}
	
	
	// 테스트 (삭제 예정)
	//@RequestMapping(value = "/resvTest", method = RequestMethod.POST)
	public String getTest(@ModelAttribute("resvInfo") ResvBean resvBean, Model model) {
		System.out.println("test resvBean" + resvBean);
		System.out.println("model" + model);
		
		// model.addAttribute("resvInfo", resvBean);
		return "client/resv/resvTest"; // 예약 등록 페이지
	}
	
	
	
	/*
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVO vo, UserDAO userDAO, HttpSession session) {
		UserVO user = userDAO.getUser(vo);
		if(user != null) {
			session.setAttribute("userName", user.getName());
			return "getBoardList.do";
		}
		else return "login.jsp";
	}
	
	@RequestMapping(value = "/mb/empInsert",
			method = RequestMethod.POST)
	public String empInsert(Emp emp) {
		EmpDAO dao = sqlSessionTemplate.getMapper(EmpDAO.class);
		int n = dao.insert(emp);
		return "redirect:/mb/empList";
	}
	*/
	
}
