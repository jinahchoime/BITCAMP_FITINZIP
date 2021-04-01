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
import com.spring.FitInZip.back.admin.service.AdminService;
import com.spring.FitInZip.back.admin.vo.GetClsCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetClsModalDTO;
import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;
import com.spring.FitInZip.back.admin.vo.MapVO;
import com.spring.FitInZip.back.cls.vo.ClsVO;

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
		/* 강사 가입승인 */
		List<GetMemberCheckDTO> list = adminService.getMemberCheck();
		model.addAttribute("bbs1",list);
		
		/* 클래스 가입승인*/
		List<GetClsCheckDTO> list1 = adminService.getClsCheck();
		model.addAttribute("bbsCls",list1);
		
		System.out.println("bbs1 : "+list);
		System.out.println("bbsCls : "+list1);
		
		
		return "admin/main";
	}
	
	@RequestMapping(value = "/getMemberCheck", method = RequestMethod.GET)
	public String getMemberCheck(Model model) {
		//List<GetMemberCheckDTO> list = adminService.getMemberCheck();
		//model.addAttribute("bbs1",list);
		//System.out.println(list);
		
		return "admin/bbstest";
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
	
	@RequestMapping("/registerMaster")
	public String registerMaster(Model model) {
		List<GetMemberCheckDTO> list = adminService.getMemberCheckRM();
		model.addAttribute("bbs1",list);
		System.out.println("가입승인 컨트롤러 : "+list);
		
		return "admin/registerMaster";
	}
	
	/* 승인 -> 가입신청 ajax 처리부분*/
	@RequestMapping("/allListRM")
	public String allListRM(Model model,String key) {
		System.out.println("key : " + key);
		List<GetMemberCheckDTO> list = adminService.allListRM(key);
		System.out.println("오잉??"+list);
		model.addAttribute("bbs1",list);

		return "admin/registerMasterPart";
	}
	
	@RequestMapping("/bbsClsModal")
	@ResponseBody
	public List<GetClsModalDTO> getClsModalList(String id){
		System.out.println(">>id : " +id);
		List<GetClsModalDTO> list = adminService.getClsModalList(id);
		System.out.println(">>modalReturn : " + list);
		
		return list;
	}
	@RequestMapping("/approveClsTrainer")
	@ResponseBody
	public String approveClsTrainer(String id, String btnId) throws JsonProcessingException{
		System.out.println(">>id : " +id);
		if(btnId.equals("승인완료")) {
			btnId = "CS01";
		}else if(btnId.equals("승인거부")) {
			btnId = "CS02";
		}
		System.out.println(">>btnid : " +btnId);
		String result = String.valueOf(adminService.approveClsTrainer(id, btnId));
		System.out.println(">>resultvalue : " + result);
		ObjectMapper mapper = new ObjectMapper();

		return mapper.writeValueAsString(result);
	}
	@RequestMapping("/classMaster")
	public String classMaster(Model model) {
		List<GetClsCheckDTO> list1 = adminService.getClsList();
		System.out.println("오잉~>>"+list1);
		model.addAttribute("bbsCls",list1);
		
		
		return "admin/classMaster";
	}
	/* 승인 -> 가입신청 ajax 처리부분*/
	@RequestMapping("/allListCM")
	public String allListcM(Model model,String key) {
		System.out.println("key : " + key);
		List<GetClsCheckDTO> list = adminService.allListCM(key);
		System.out.println("allListCM  : "+list);
		model.addAttribute("bbsCls",list);

		return "admin/classMasterPart";
	}
}
