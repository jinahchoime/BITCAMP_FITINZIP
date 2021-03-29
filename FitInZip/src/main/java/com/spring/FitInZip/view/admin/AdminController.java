package com.spring.FitInZip.view.admin;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.FitInZip.back.admin.AdminService;
import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;
import com.spring.FitInZip.back.admin.vo.MapVO;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	/*다슬*/
	@RequestMapping("/searchMap")
	public String searchMap(){
		return "consulting/searchMap";
	}
	
	@RequestMapping("/checkMap")
	@ResponseBody
	public String checkMap(MapVO map) throws JsonProcessingException {
		
		adminService.insertMap(map);
		
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(null);
	}
	
	
	@RequestMapping("/consulting")
	public String consulting(MapVO map, Model model){
			List<MapVO> maplist = adminService.getMapList(map);
			
			model.addAttribute("maplist", maplist);
			
			System.out.println("maplist : " + maplist);
			
			return "consulting/consulting";
		}
	
	
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String home(Model model) {
		List<GetMemberCheckDTO> list = adminService.getMemberCheck();
		model.addAttribute("bbs1",list);
		
		
		System.out.println("메인컨트롤러 : "+list);
		
		return "admin/main";
	}
	
	@RequestMapping(value = "/getMemberCheck", method = RequestMethod.GET)
	public String getMemberCheck(Model model) {
		//List<GetMemberCheckDTO> list = adminService.getMemberCheck();
		//model.addAttribute("bbs1",list);
		//System.out.println(list);
		
		return "admin/bbs";
	}
	@RequestMapping(value = "/bbs1Modal", method = RequestMethod.GET)
	@ResponseBody
	public List<GetModalDTO> getModalList(String id){
		System.out.println(">>id : " +id);
		List<GetModalDTO> list = adminService.getModalList(id);
		System.out.println(">>modalReturn : " + list);
		
		return list;
	}
	
	@RequestMapping("/approveTrainer")
	@ResponseBody
	public String updateTrainer(String id, String btnId) throws JsonProcessingException{
		System.out.println(">>id : " +id);
		System.out.println(">>btnid : " +btnId);
		String result = String.valueOf(adminService.updateTrainer(id));
		System.out.println(">>resultvalue : " + result);
		
		ObjectMapper mapper = new ObjectMapper();

		return mapper.writeValueAsString(result);
	}
	
	@RequestMapping("/rejectTrainer")
	@ResponseBody
	public String rejectTrainer(String id, String btnId) throws JsonProcessingException{
		System.out.println(">>id : " +id);
		System.out.println(">>btnid : " +btnId);
		String result = String.valueOf(adminService.rejectTrainer(id));
		System.out.println(">>resultvalue : " + result);
		
		ObjectMapper mapper = new ObjectMapper();

		return mapper.writeValueAsString(result);
	}
	
}
