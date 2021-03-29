package com.spring.FitInZip.view.cls;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.FitInZip.back.cls.dto.ClsListDTO;
import com.spring.FitInZip.back.cls.service.ClsService;

@Controller
@SessionAttributes("classList")
public class LiveClassController {
	
	@Autowired
	private ClsService clsService;
	
	// 원데이PT 클래스 화면
	@RequestMapping("/liveClassMain")
	public String liveClassMain(Model model) {
		System.out.println("liveClassMain 실행중");
		
		List<ClsListDTO> classList = clsService.getClassList();
		System.out.println("classList : " + classList);
		
		model.addAttribute("classList", classList);
		
		return "class/liveClass";
	}
	
	@RequestMapping("/getClassCategory")
	public void getClassCategory(String clsCategory, Model model) {
		
		List<ClsListDTO> classList = clsService.getClassCategory(clsCategory);
		System.out.println("classList : " + classList);
		
		model.addAttribute("classList", classList);
		
	}

}
