package com.spring.FitInZip.back.calendar.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.calendar.dto.CalendarClassDTO;
import com.spring.FitInZip.back.calendar.vo.CalendarVO;

@Repository("calendarDAO")
public class CalendarDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CalendarDAO() {
		System.out.println("CalendarDAO 생성자 호출");
	}
	
	public List<CalendarVO> selectAttendList(String mem_id) {
		List<CalendarVO> list = mybatis.selectList("calendar.selectAttend", mem_id);
		for (CalendarVO calendarVO : list) {
			System.out.println("list : " + calendarVO);
		}
		
		return list;
	}
	
	// 출석 중복 확인
	public CalendarVO chkAttendance(String mem_id) {
		CalendarVO vo = null;
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = new Date();
		String today = sdFormat.format(nowDate);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("attend_date", today);
		
		vo = mybatis.selectOne("calendar.chkAttendance", map);
		
		return vo;
	}
	
	public int insertAttendance(String mem_id) {
		// 처리 결과 반환
		// 0 : 실패, 1 : 성공
		int result = 0;
		
		result = mybatis.insert("calendar.insertAttendance", mem_id);
		
		return result;
	}
	
	public int countDayOfMonth(Map<String, String> map) {
		return mybatis.selectOne("calendar.countDayOfMonth", map);
	}
	
	// 신청한 수업 정보를 조회하기 위한 코드 조회
	public List<String> getClsCode(String mem_id){
		return mybatis.selectList("calendar.selectClsCode", mem_id);
	}
	
	// 회원이 신청한 수업 정보를 조회
	public CalendarClassDTO getClsInfo(String cls_code){
		return mybatis.selectOne("calendar.selectClsInfo", cls_code);
	}
	
}
