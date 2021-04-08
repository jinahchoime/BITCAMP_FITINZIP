package com.spring.FitInZip.view.admin;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.FitInZip.back.admin.service.AdminService;
import com.spring.FitInZip.back.admin.vo.GetClsCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetClsModalDTO;
import com.spring.FitInZip.back.admin.vo.GetInputData;
import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;
import com.spring.FitInZip.back.admin.vo.GetSubBBSDataDTO;
import com.spring.FitInZip.back.admin.vo.GetSubChartDataDTO;
import com.spring.FitInZip.back.admin.vo.MapVO;
import com.spring.FitInZip.back.admin.vo.MonthPaymentChartDTO;
import com.spring.FitInZip.back.cls.vo.ClsVO;
import com.spring.FitInZip.back.member.vo.MemberVO;

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
	public String home(HttpSession session,Model model) {
		MemberVO vo = (MemberVO) session.getAttribute("admin");
		model.addAttribute("vo",vo);
		System.out.println(vo.toString());
		
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
	public String registerMaster(HttpSession session,Model model) {
		MemberVO vo = (MemberVO) session.getAttribute("admin");
		model.addAttribute("vo",vo);
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
	public String classMaster(HttpSession session,Model model) {
		MemberVO vo = (MemberVO) session.getAttribute("admin");
		model.addAttribute("vo",vo);
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
	
	@RequestMapping("/chartOne")
	@ResponseBody
	public List<MonthPaymentChartDTO> chartOne(){
		/* 통계1번 */
		List<MonthPaymentChartDTO> list = adminService.monthPaymentChart();
		System.out.println("chartOne"+ list);
		return list;
	}
	@RequestMapping("/chartTwo")
	@ResponseBody
	public List<MonthPaymentChartDTO> chartTwo(){
		/* 통계2번 */
		List<MonthPaymentChartDTO> list = adminService.lastMonthPaymentChart();
		System.out.println("chartTwo"+ list);
		return list;
	}
	@RequestMapping("/chartThree")
	@ResponseBody
	public Map<String,String> chartThree(){
		/* 통계3번 */
		Map<String,String> mapOne = adminService.inputData();
		Map<String,String> mapTwo = adminService.inputDataTwo();
		
		mapOne.putAll(mapTwo);
		
		for (String key : mapOne.keySet()) {
			String value = mapOne.get(key);
			System.out.print(key+" / "+value);
		}
		
		return mapOne;
	}
	@RequestMapping("/subMainPrice")
	public String subMainPrice(HttpSession session, Model model) {
			/* 로그인 처리부분 */
			MemberVO vo = (MemberVO) session.getAttribute("admin");
			model.addAttribute("vo",vo);
			
		return "admin/subMainPrice";
	}
	@RequestMapping("/chageChartData")
	@ResponseBody
	public List<GetSubChartDataDTO> getChageChartData(String btnParam){
		List<GetSubChartDataDTO> list = adminService.getSubChartData(btnParam);
		System.out.println(">>modalReturn : " + list);
		
		return list;
	}
	@RequestMapping("/getSubMainBBSData")
	public String getSubMainBBSData(String btnParam, Model model){
		System.out.println(">>id : " +btnParam);
		List<GetSubBBSDataDTO> list = adminService.getSubBBSData(btnParam);
		System.out.println(">>짜쓰~ : " + list);
		model.addAttribute("subBBS",list);
		
		return "admin/subMainPart";
	}
	@RequestMapping("/subMainPeople")
	public String subMainPeopel(HttpSession session, Model model) {
			/* 로그인 처리부분 */
			MemberVO vo = (MemberVO) session.getAttribute("admin");
			model.addAttribute("vo",vo);
			
		return "admin/subMainPeople";
	}
	@RequestMapping("/chartPeopleStartOne")
	@ResponseBody
	public List<GetSubChartDataDTO> getChartPeopleStartOne(String btnParam){
		List<GetSubChartDataDTO> list = adminService.getSubChartData(btnParam);
		System.out.println(">>modalReturn : " + list);
		
		return list;
	}
	@RequestMapping("/chartPeopleStartTwo")
	@ResponseBody
	public List<GetSubChartDataDTO> getChartPeopleStartTwo(String btnParam){
		List<GetSubChartDataDTO> list = adminService.getSubChartData(btnParam);
		System.out.println(">>modalReturn : " + list);
		
		return list;
	}
	
	
	
	
	@RequestMapping("/test")
	public String test() {
		System.out.println("test 시작");

		return "admin/amountTest";
	}
	@RequestMapping("/test11")
	public String test11() {
		System.out.println("test11 시작");

		return "admin/test11";
	}

}
