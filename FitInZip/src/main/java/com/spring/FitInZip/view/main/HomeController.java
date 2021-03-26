package com.spring.FitInZip.view.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	private String mem_id2;
	private Criteria crt = new Criteria();
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		logger.debug("Welcome home! The client locale is {}.", locale);
		
		HttpSession session = request.getSession();
		session.setAttribute("ID", "hong");
		mem_id = (String)session.getAttribute("ID");
		mem_id2 = "kim";
		
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
		System.out.println("list: " + list);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(crt, 5));
		
		return "trainer/classStatus";
	}
	
	@RequestMapping(value = "classRegister")
	public String goRegister() {
		return "trainer/classRegister";
	}
	
}
