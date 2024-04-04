package com.anim.clinic.admin.item;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.anim.clinic.admin.item.biz.AItemService;

@Controller
public class AItemController {

	@Autowired
	AItemService aItemService;

	@RequestMapping(value = "/admin/item/create", method = RequestMethod.GET)
	public ModelAndView create() {
		return new ModelAndView("/admin/item/create");
	}

	@RequestMapping(value = "/admin/item/create", method = RequestMethod.POST)
	public ModelAndView createPost(@RequestParam Map<String, Object> map, @RequestParam("i_img") MultipartFile file,
			Model model) {
		ModelAndView mav = new ModelAndView();

		try {
			// 파일 저장 경로 설정
			// 추가설명(본인 C:/dev/addi <= sts 실행위치이다. + 패키지명 = /myaddi6
			// 이후 /src/main/webapp/resources/upload/ 까지는 동일
			String uploadPath = "C:/dev/swork/addi/src/main/webapp/resources/upload/";

			// 원본 파일 이름 알아오기
			String originalFileName = file.getOriginalFilename();

			// 파일 생성
			File newFile = new File(uploadPath + originalFileName);

			// 서버로 전송
			file.transferTo(newFile);

			// DB에 저장(업로드된 파일의 파일 이름을 데이터 베이스에 저장)
			map.put("i_img", originalFileName);

			// Model 설정
			// model.addAttribute("originalFileName", originalFileName);

			// 확장자 제거 후 저장
			// int lastIndex = originalFileName.lastIndexOf('.');
			// String fileNameWithoutExtension = originalFileName.substring(0, lastIndex);
			// map.put("i_img", fileNameWithoutExtension); // i_img 컬럼에 파일 이름 저장

			// Model 설정 : 뷰 페이지에서 원본 파일 이름 출력
			// model.addAttribute("fileNameWithoutExtension", fileNameWithoutExtension);

			// mav.setViewName("redirect:/admin/item/list");
			// mav.setViewName("/admin/item/list");
			// this.aItemService.create(map);

			String itemNum = this.aItemService.create(map);
			if (itemNum == null) {
				mav.setViewName("redirect:/admin/create");
			} else {
				mav.setViewName("redirect:/admin/item/list");
			}
		} catch (IOException e) {
			// 파일 업로드 중에 예외가 발생한 경우 처리
			e.printStackTrace();
			// 예외 처리에 따른 메시지나 작업 수행
			mav.setViewName("error_page"); // 예외 발생 시 이동할 에러 페이지(만들어 놓지는 않았습니다.)
		}

		return mav;
	}

	@RequestMapping(value = "/admin/item/detail/{itemNum}", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable String itemNum) {
		Map<String, Object> detailMap = this.aItemService.detail(itemNum);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detailMap);
		mav.setViewName("/admin/item/detail");
		return mav;
	}

	@RequestMapping(value = "/admin/item/update/{itemNum}", method = RequestMethod.GET)
	public ModelAndView showUpdateForm(@PathVariable("itemNum") String itemNum) {
		Map<String, Object> detailMap = this.aItemService.detail(itemNum);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detailMap);
		mav.setViewName("/admin/item/update");

		return mav;
	}

	@RequestMapping(value = "/admin/item/update/{itemNum}", method = RequestMethod.POST)
	public ModelAndView updatePost(@PathVariable String itemNum, @RequestParam Map<String, Object> map,
			@RequestParam("i_img") MultipartFile file, Model model) {
		ModelAndView mav = new ModelAndView();

		try {
			String uploadPath = "C:/dev/swork/addi/src/main/webapp/resources/upload/";

			String originalFileName = file.getOriginalFilename();

			File newFile = new File(uploadPath + originalFileName);

			file.transferTo(newFile);

			map.put("itemNum", itemNum);
			map.put("i_img", originalFileName);

			boolean isUpdateSuccess = this.aItemService.edit(map);
			if (isUpdateSuccess) {
				mav.setViewName("redirect:/admin/item/list");
			} else {
				mav = this.showUpdateForm(itemNum);
			}
		} catch (IOException e) {
			e.printStackTrace();
			mav.setViewName("error_page");
		}

		return mav;
	}

	@RequestMapping(value = "/admin/item/delete", method = RequestMethod.POST)
	public ModelAndView deletePost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();

		boolean isDeleteSuccess = this.aItemService.remove(map);
		if (isDeleteSuccess) {
			mav.setViewName("redirect:/admin/item/list");
		} else {
			String itemNum = map.get("itemNum").toString();
			mav.setViewName("redirect:/admin/item/detail/" + itemNum);
		}

		return mav;
	}

//    @RequestMapping(value = "/admin/item/list")  
//    public ModelAndView list(@RequestParam Map<String, Object> map) {  
//
//	    List<Map<String, Object>> list = this.aItemService.list(map);  
//	
//	    ModelAndView mav = new ModelAndView();  
//	    mav.addObject("data", list);  
//	    
//	    if (map.containsKey("keyword")) {  
//	    	mav.addObject("keyword", map.get("keyword"));  
//	    }  
//	    
//	    mav.setViewName("/admin/item/list");  
//	    return mav;  
//    }

	@RequestMapping(value = "/admin/item/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize, @RequestParam Map<String, Object> map) {

		// 요청된 페이지에 해당하는 아이템의 시작 인덱스 계산
		int startIndex = (page - 1) * pageSize;

		// 요청된 페이지에 해당하는 아이템만 가져오도록 map에 페이지 관련 정보 추가
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);

		// 페이징된 결과를 받아옴
		List<Map<String, Object>> list = this.aItemService.list(page, pageSize, map);

		// 총 아이템 개수 가져오기
		int totalCount = this.aItemService.getTotalCount();

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list);

		// 페이징 정보 ModelAndView에 추가
		mav.addObject("currentPage", page);
		mav.addObject("pageSize", pageSize);
		mav.addObject("totalCount", totalCount);
		mav.addObject("totalPages", (int) Math.ceil((double)totalCount / pageSize));

		if (map.containsKey("keyword")) {
			mav.addObject("keyword", map.get("keyword"));
		}

		mav.setViewName("/admin/item/list");
		return mav;
	}

}
