package com.spring.FitInZip.back.calendar.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.FitInZip.back.calendar.dao.CalendarDAO;
import com.spring.FitInZip.back.calendar.vo.CalendarVO;
import com.spring.FitInZip.back.cls.vo.ClsVO;

@Service
public class CalendarServiceImpl implements CalendarService {
	@Autowired
	private CalendarDAO calendarDAO;
	
	@Override
	public List<ClsVO> selectClassList(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CalendarVO> selectAttendList(String mem_id) {
		System.out.println("id : " + mem_id);
		List<CalendarVO> list = calendarDAO.selectAttendList(mem_id);
		
		return list;
	}

	@Override
	public CalendarVO chkAttendance(String mem_id) {
		CalendarVO vo = calendarDAO.chkAttendance(mem_id);
		return vo;
	}

	@Override
	public int insertAttendance(String mem_id) {
		return calendarDAO.insertAttendance(mem_id);
		
	}
	
	
}
