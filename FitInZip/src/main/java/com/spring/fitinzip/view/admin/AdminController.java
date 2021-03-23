package com.spring.fitinzip.view.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.fitinzip.back.admin.AdminService;
import com.spring.fitinzip.back.admin.vo.MapVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/checkMap")
	@ResponseBody
	public String checkMap(MapVO map) throws JsonProcessingException {
		
		adminService.insertMap(map);
		
		System.out.println("AdminController 에서 insertMap 실행");
		System.out.println("불러지냐???"+map.toString());
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(null);
	}
	
	@RequestMapping("/consulting")
	public String consulting(){
			return "consulting/consulting";
		}
	
}
