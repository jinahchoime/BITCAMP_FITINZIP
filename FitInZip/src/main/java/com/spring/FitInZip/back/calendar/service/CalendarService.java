package com.spring.FitInZip.back.calendar.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.spring.FitInZip.back.calendar.vo.CalendarVO;
import com.spring.FitInZip.back.cls.vo.ClsVO;

public interface CalendarService {
	List<ClsVO> selectClassList(HttpServletRequest request);
	List<CalendarVO> selectAttendList(String mem_id);
	CalendarVO chkAttendance(String mem_id);
	int insertAttendance(String mem_id);
	int countDayOfMonth(Map<String, String> map);
}
