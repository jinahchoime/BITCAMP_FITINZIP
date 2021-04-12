package com.spring.FitInZip.view.mypage;


import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.FitInZip.back.mypage.MypageService;
import com.spring.FitInZip.back.mypage.vo.UserClsDTO;
import com.spring.FitInZip.back.mypage.vo.UserCountDTO;
import com.spring.FitInZip.back.mypage.vo.UserCouponDTO;
import com.spring.FitInZip.back.mypage.vo.UserProductDTO;
import com.spring.FitInZip.back.mypage.vo.UserWithdrawalDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.FitInZip.back.admin.vo.MapVO;
import com.spring.FitInZip.back.calendar.api.CalendarKey;
import com.spring.FitInZip.back.calendar.dto.CalendarClassDTO;
import com.spring.FitInZip.back.calendar.service.CalendarService;
import com.spring.FitInZip.back.calendar.vo.CalendarVO;
import com.spring.FitInZip.back.cls.vo.ClsVO;
import com.spring.FitInZip.back.common.service.MemCouponService;
import com.spring.FitInZip.back.common.vo.MemCouponVO;
import com.spring.FitInZip.back.member.vo.MemberVO;

@Controller
public class MypageController {
	
	//마이페이지 서비스...
	@Autowired
	private MypageService mypageService;
	
	// 캘린더
	@Autowired
	private CalendarService calendarService;
	
	// 쿠폰 부여
	@Autowired
	private MemCouponService memCouponService;
	
	/*마이페이지로*/
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model){
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		if(member == null) {
			return "redirect:/loginMain";
		}
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//멤버 바꾸기
		model.addAttribute("member", member);
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value="calendar")
	public String goCalendar(HttpServletRequest request, Model model, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		CalendarKey key = new CalendarKey();
		
		member = mypageService.getMember(member.getId());
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		//멤버 바꾸기
		model.addAttribute("member", member);
		model.addAttribute("key", key.getCalendarKey());
		model.addAttribute("holiday", key.getHolidayId());
		
		return "calendar/myCalendar";
	}
	
	@RequestMapping(value = "getAttendance")
	@ResponseBody
	public List<CalendarVO> getAttendance(HttpSession session) {
		String id = ((MemberVO)session.getAttribute("member")).getId();
		List<CalendarVO> list = calendarService.selectAttendList(id);
		
		return list;
	}
	
	
	@RequestMapping(value = "setAttendance")
	@ResponseBody
	public Map<String, String> name(HttpSession session, @RequestParam Map<String, Object>lastday ) {
		String id = ((MemberVO)session.getAttribute("member")).getId();
		
		CalendarVO vo = calendarService.chkAttendance(id);
		Map<String, String> map = new HashMap<String, String>();
		
		if(vo != null) {
			map.put("result", "overlap");
			return map;
		}
		
		int result = calendarService.insertAttendance(id);
		if(result == 1) {
			map.put("result", "chk");
			
			  Calendar cal = java.util.Calendar.getInstance(); SimpleDateFormat format =
			  new SimpleDateFormat("yyyy-MM"); 
			  String from = format.format(cal.getTime()) + "%"; 
			  
			  Map<String, String> user = new HashMap<String, String>();
			  user.put("mem_id", id);
			  user.put("attend_date", from);
			  
			  int count = calendarService.countDayOfMonth(user);
			  
			  if(count == Integer.parseInt((String)lastday.get("lastday"))) {
				  map.put("coupon", "issue");
				  
				  from = from.substring(5, 7);
				  
				  int parsedMonth = Integer.parseInt(from);
				  String couponMonth = "";
				  MemCouponVO coupvo = new MemCouponVO();
				  
				  switch (parsedMonth) {
					case 1:
						break;
					case 2:
						couponMonth = "february";
						break;
					case 3:
						couponMonth = "march";
						break;
					case 4:
						couponMonth = "april";
						break;
					case 5:
						break;
					case 6:
						break;
					case 7:
						break;
					case 8:
						break;
					case 9:
						break;
					case 10:
						break;
					case 11:
						break;
					case 12:
						break;
				}
				
				coupvo.setMemId(id);
				coupvo.setCouponCode(couponMonth);
				coupvo.setCouponStatus("CPU01");
				
				int insertReslt = memCouponService.memCouponInsert(coupvo);
				
			  }
			  
		}
		return map;
	}
	
	// 신청한 수업 정보 조회
	@RequestMapping("/getClsInfo")
	@ResponseBody
	public List<CalendarClassDTO> getClsInfo(HttpSession session) throws ParseException {
		String id = ((MemberVO)session.getAttribute("member")).getId();
		
		// id를 사용하여 cls_code 목록 조회
		List<String> clsCode = calendarService.getClsCode(id);
		
		// CalendarClassDTO 타입의 List 생성
		List<CalendarClassDTO> clsInfo = new ArrayList<CalendarClassDTO>();
		
		for (String code : clsCode) {
			CalendarClassDTO dto = calendarService.getClsInfo(code);
			
			SimpleDateFormat converter = new SimpleDateFormat("yyyy-mm-dd");
			Date temp = converter.parse(dto.getStartDate());
			Date temp2 = converter.parse(dto.getEndDate());
			dto.setStartDate(converter.format(temp));
			dto.setEndDate(converter.format(temp2));
			
			clsInfo.add(dto);
		}
		
		return clsInfo;
	}
	
	// 캘린더 끝
	
	
	
	/*마이페이지 유저의 참여수 데이터 뿌리기*/
	@RequestMapping("/userExerciseData")
	@ResponseBody
	public List<UserCountDTO> userExerciseData(HttpSession session) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		String id = member.getId();
		
		return mypageService.getParticipationRate(id);
	}
	
	/*클래스 내역 페이지로*/
	@RequestMapping("/clsHistory")
	public String clsHistory(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//멤버 바꾸기
		model.addAttribute("member", member);
		
		return "mypage/clsHistory";
	}
	
	/*현재 클래스 history 내역 ajax로 뿌리기*/
	@RequestMapping("/clsdata") 
	@ResponseBody
	public List<UserClsDTO> nowClsData(UserClsDTO dto, HttpSession session, HttpServletRequest request, Model model) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		dto.setClsTimeStatus(request.getParameter("clsTimeStatus"));
		List<UserClsDTO> userclsList = mypageService.nowGetUserCls(dto);
		
		try {
			for (UserClsDTO userClsDTO : userclsList) {
		         String fileName = userClsDTO.getThumbnailFileName();
		         System.out.println("fileName : " + fileName);
		         fileName = fileName.substring(fileName.indexOf("resources"));
		         userClsDTO.setThumbnailFileName(fileName);
		      }
		}catch(NullPointerException e){
			
		}
		
		return userclsList;
		
	}
	
	
	/*클래스 입장시 체크인하기*/
	@RequestMapping("/insertCheckIn") 
	@ResponseBody
	public String insertCheckIn(UserClsDTO dto, HttpSession session, HttpServletRequest request) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		dto.setClsCode(request.getParameter("clsCode"));
		mypageService.insertCheckIn(dto);
		
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(null);
		
	}
	
	/*찜한내역 페이지로*/
	@RequestMapping("/clsHeart")
	public String clsHeart(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//멤버 바꾸기
		model.addAttribute("member", member);
		
		return "mypage/clsHeart";
	}
	
	/*찜한내역 ajax로 뿌리기*/
	@RequestMapping("/clsHeartData") 
	@ResponseBody
	public List<UserClsDTO> clsHeartData(UserClsDTO dto, HttpSession session) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		
		List<UserClsDTO> userclsList = mypageService.getUserWishCls(dto);
		
		try {
			for (UserClsDTO userClsDTO : userclsList) {
		         String fileName = userClsDTO.getThumbnailFileName();
		         System.out.println("fileName : " + fileName);
		         fileName = fileName.substring(fileName.indexOf("resources"));
		         userClsDTO.setThumbnailFileName(fileName);
		      }
		}catch(NullPointerException e){
			
		}
		
		return userclsList;
		
	}
	
	/*찜한 내역 지우기*/
	@RequestMapping("/noHeart")
	@ResponseBody
	public String checkMap(UserClsDTO dto, HttpSession session) throws JsonProcessingException {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		mypageService.deleteWishCls(dto);
		
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(null);
	}
	
	/*쿠폰내역 페이지로*/
	@RequestMapping("/couponHistory")
	public String couponHistory(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//멤버 바꾸기
		model.addAttribute("member", member);
		
		return "mypage/couponHistory";
	}
	
	/*쿠폰내역 데이터 뿌리기*/
	@RequestMapping("/couponData")
	@ResponseBody
	public List<UserCouponDTO> getcouponData(UserCouponDTO dto, HttpSession session) throws JsonProcessingException {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		
		return mypageService.getcouponData(dto);
	}
	
	/*주문조회 페이지로*/
	@RequestMapping("/productHistory")
	public String productHistory(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//멤버 바꾸기
		model.addAttribute("member", member);
		
		return "mypage/productHistory";
	}
	
	/*주문조회 내역 데이터 뿌리기*/
	@RequestMapping("/productData")
	@ResponseBody
	public List<UserProductDTO> getProductList(UserProductDTO dto, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute("member");
		dto.setMemId(member.getId());
		
		
		return mypageService.getproductList(dto);
	}
	
	/*회원수정 페이지로*/
	@RequestMapping("/updateMemberInfo")
	public String getMember(MemberVO vo, HttpSession session, Model model) {
		
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		System.out.println("member : " + member);
		
		//멤버 바꾸기
		model.addAttribute("member", member);
		
		return "mypage/updateMemberInfo";
	}
	
	/*회원수정 처리*/
	@RequestMapping("/UpdateMypage") 
	public String updateMember(MemberVO vo, MultipartFile profileImg, HttpServletRequest request, HttpSession session) throws IllegalStateException, IOException {
		System.out.println("updateMember 실행");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		System.out.println("updateMember id : " + member.getId());
		System.out.println("updateMember pw : " + member.getPassword());
		
		vo.setId(member.getId());
		vo.setPassword(member.getPassword());
		
		String month = request.getParameter("month");
		if(month.length() == 1) {
			month = "0" + month;
		}
		
		String day = request.getParameter("day");
		if(day.length() == 1) {
			day = "0" + day;
		}
		
		String birth = request.getParameter("year") + month + day;
		System.out.println("birth : " + birth);
		vo.setBirth(birth);
		
		MultipartFile classUploadFile = null;
		String filePath = this.getClass().getResource("").getPath(); 
		filePath = filePath.substring(1, filePath.indexOf(".metadata")) +
			    "FitInZip/src/main/webapp/resources/mypage/imgs/";
		
		String filename = "";
		UUID uuid = null;
		
		if(profileImg != null) {
			uuid = UUID.randomUUID();
			filename = profileImg.getOriginalFilename();
			vo.setProfileImgOriginName(filename);
			
			if(filename != null && !filename.equals("")) {
				filename = filePath + "thumbnail/" + uuid + "_" + filename;
				vo.setProfileImgFileName(filename);
				classUploadFile = profileImg;
				classUploadFile.transferTo(new File(filename));
			}
			
		}
		
		mypageService.updateMember(vo);
		
		return "redirect:/mypage";
	}
	
	
	
	/*회원탈퇴 페이지로*/
	@RequestMapping("/withdrawal")
	public String withdrawal(HttpSession session, Model model) {
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		member = mypageService.getMember(member.getId());
		
		try {
			String profileImgFilePath = member.getMemFileName();
			member.setProfileImgFileName(member.getMemFileName().substring(profileImgFilePath.indexOf("resources")));
		} catch (NullPointerException e) {
			
		}
		
		//멤버 바꾸기
		model.addAttribute("member", member);
		
		return "mypage/withdrawal";
	}
	
	/*회원탈퇴 하기*/
	@RequestMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(HttpSession session, HttpServletRequest request, UserWithdrawalDTO dto) throws JsonProcessingException {
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		dto.setId(member.getId());
		String wantSay = (String) request.getAttribute("wantSay");
		
		if(wantSay == null) {
			System.out.println("wantSay null : " + wantSay);
			mypageService.deleteUserNoReason(dto);
			
		}else {
			System.out.println("wantSay !null : " + wantSay);
			mypageService.deleteUserIsReason(dto);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(null);
	}
	
}
