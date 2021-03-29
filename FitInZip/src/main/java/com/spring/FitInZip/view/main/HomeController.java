package com.spring.FitInZip.view.main;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.imageio.IIOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.FitInZip.back.calendar.service.CalendarService;
import com.spring.FitInZip.back.calendar.vo.CalendarVO;
import com.spring.FitInZip.back.cls.clsStatus.Criteria;
import com.spring.FitInZip.back.cls.clsStatus.PageDTO;
import com.spring.FitInZip.back.cls.clsStatusService.ClsStatusService;
import com.spring.FitInZip.back.cls.vo.ClsVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private CalendarService calendarService;
	@Autowired
	private ClsStatusService clsStatusService;
	
	private String mem_id;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		logger.debug("Welcome home! The client locale is {}.", locale);
		
		HttpSession session = request.getSession();
		session.setAttribute("ID", "hong");
		mem_id = (String)session.getAttribute("ID");
		
		return "main";
	}
	
	@RequestMapping(value="calendar")
	public String goCalendar(HttpServletRequest request, Model model) {
		
		return "calendar/myCalendar";
	}
	
	@RequestMapping(value = "getAttendance")
	@ResponseBody
	public List<CalendarVO> getAttendance() {
		List<CalendarVO> list = calendarService.selectAttendList(mem_id);
		
		return list;
	}
	
	
	@RequestMapping(value = "setAttendance")
	@ResponseBody
	public Map<String, String> name() {
		CalendarVO vo = calendarService.chkAttendance(mem_id);
		Map<String, String> map = new HashMap<String, String>();
		
		if(vo != null) {
			map.put("result", "overlap");
			return map;
		}
		
		int result = calendarService.insertAttendance(mem_id);
		if(result == 1) {
			map.put("result", "chk");
		}
		return map;
	}
	
	@RequestMapping(value = "classStat")
	public String goClassStat(Criteria crt, Model model) {
		List<ClsVO> list = clsStatusService.getList(crt);
		System.out.println("list: " + list + " , list size: " + list.size());
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(crt, 123));	// 뒤 쪽 매개변수는 총 데이터 개수
		
		return "trainer/classStatus";
	}
	
	@RequestMapping(value = "classRegister")
	public String goRegister() {
		return "trainer/classRegister";
	}
	
	@RequestMapping(value = "regCls")
	public String regClsProc(ClsVO vo,@ModelAttribute("crt") Criteria crt, RedirectAttributes rttr) throws IllegalStateException, IIOException, Exception {
		
		System.out.println(vo.getStartDate());
		
		// 클래스 코드를 생성하기 
		java.util.Date now = new java.util.Date();
	    SimpleDateFormat vans = new SimpleDateFormat("yyyyMMdd");
	    String wdate = vans.format(now);
	    
	    String classKey = clsStatusService.getClassSeq();
	    String classCode = "C" + wdate + "_" + classKey;
		
		// 파일명 중복 시 uuid를 무작위 생성하여 붙여주기 때문에 별도 저장 가능
		UUID uuid = UUID.randomUUID();
		
		String fileName = "" + uuid + "_";
		MultipartFile classUploadFile = vo.getClsFileName();
		if(classUploadFile != null) {
			fileName += classUploadFile.getOriginalFilename();
			classUploadFile.transferTo(new File("c:/Temp/FitInZip/ClassFile/" + fileName));
		}
		
		// 시작, 끝 시간 입력을 위한 가공
		SimpleDateFormat converter = new SimpleDateFormat("yyyy-MM-dd");
		
		Date start = vo.getStartDate();
		Date end = vo.getEndDate();
		
		String startTime = "" + converter.format(start);
		String endTime = "" + converter.format(end);
		
		startTime += " " + vo.getStartTime() + ":00";
		endTime += " " + vo.getEndTime() + ":00";
		
		vo.setStartTime(startTime);
		vo.setEndTime(endTime);
		
		System.out.println("starttime: " + startTime + ", endtime: " + endTime);
		
		vo.setClsOriName(fileName);
		vo.setClsCode(classCode);
		
		System.out.println("vo: " + vo.toString());	
		
		clsStatusService.insertClass(vo);
		
		rttr.addAttribute("pageNum", crt.getPageNum());
		rttr.addAttribute("amount", crt.getAmount());
		
		return "redirect:classStat";
	}
	
}
