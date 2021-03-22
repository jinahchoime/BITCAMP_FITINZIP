package com.spring.fitinzip.view.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.fitinzip.back.admin.AdminService;
import com.spring.fitinzip.back.admin.vo.MapVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/consulting")
	public String consulting(HttpServletRequest request) {
		
		String la = request.getParameter("la");
		String ma = request.getParameter("ma");
		String addr = request.getParameter("addr");
		
		MapVO map = new MapVO();
		map.setMapAddr(addr);
		map.setLatitude(la);
		map.setHardness(ma);
		
		adminService.insertMap(map);
		
		System.out.println("AdminController 에서 insertMap 실행");
		
		return "consulting/consulting";
	}
	
}
