package com.spring.fitinzip.view.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.fitinzip.back.admin.vo.MapVO;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String startMain() {
		System.out.println("메인페이지 시작!");
		return "index.jsp";
	}
	
	@RequestMapping("/searchMap")
	public String searchMap() {
		return "consulting/searchMap";
	}
	
	/*
	@RequestMapping("/consulting")
	public String consulting(HttpServletRequest request) {
		
		int la = Integer.parseInt(request.getParameter("la"));  
		int ma = Integer.parseInt(request.getParameter("ma"));
		String addr = request.getParameter("addr");
		
		MapVO map = new MapVO();
		map.setMapAddr(addr);
		map.setLatitude(la);
		map.setHardness(ma);
		
		
		return "consulting/consulting";
	}
	*/
}
