package com.spring.FitInZip.view.cls;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OnedayClassController {
	
	// 원데이PT 클래스 화면
	@RequestMapping("/onedayClassMain")
	public String onedayClassMain() {
		System.out.println("onedayClassMain 실행중");
		
		return "class/onedayClass";
	}
	
	
}
