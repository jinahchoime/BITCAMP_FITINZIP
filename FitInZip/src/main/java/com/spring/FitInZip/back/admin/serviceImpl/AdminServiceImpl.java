package com.spring.FitInZip.back.admin.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.admin.dao.AdminDAO;
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

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public void insertMap(MapVO vo) {
		adminDAO.insert(vo);
	}

	@Override
	public void updateMap(MapVO vo) {
		adminDAO.update(vo);

	}

	@Override
	public List<MapVO> getMapList(MapVO vo) {
		return adminDAO.selectMap(vo);
	}

	/* 상희 */
	@Override
	public List<GetMemberCheckDTO> getMemberCheck() {

		return adminDAO.getMemberCheck();
	}

	@Override
	public List<GetClsCheckDTO> getClsCheck() {
		List<GetClsCheckDTO> list = adminDAO.getClsCheck();
		for (GetClsCheckDTO dto : list) {
			dto.setClsStatus("승인대기중");
		}
		return list;
	}

	@Override
	public List<GetModalDTO> getModalList(String id) {
		System.out.println("Ajaxservice" + id);
		return adminDAO.getModalList(id);
	}

	@Override
	public Integer updateTrainer(String id) {
		return adminDAO.updateTrainer(id);
	}

	@Override
	public Integer rejectTrainer(String id) {
		return adminDAO.rejectTrainer(id);
	}

	@Override
	public List<GetMemberCheckDTO> getMemberCheckRM() {
		return adminDAO.getMemberCheckRM();
	}

	@Override
	public List<GetMemberCheckDTO> allListRM(String key) {

		return adminDAO.allListRM(key);
	}

	@Override
	public List<GetClsModalDTO> getClsModalList(String id) {
		List<GetClsModalDTO> list = adminDAO.getClsModalList(id);
		for (GetClsModalDTO dto : list) {
			String startDate = dto.getStartDate();
			String endDate = dto.getEndDate();
			String startTime = dto.getStartTime().substring(11, 16);
			String endTime = dto.getEndTime().substring(11, 16);
			String sumDate = "";
			String sumTime = "";
			sumDate = startDate + " ~ " + endDate;
			sumTime = startTime + " ~ " + endTime;
			dto.setSumDate(sumDate);
			dto.setSumTime(sumTime);
			String yoil = dto.getYoil();
			String lapse = dto.getLapse();
			dto.setLapse(lapse + " 회" + " (" + yoil + ")");
		}
		return list;
	}

	@Override
	public Integer approveClsTrainer(String id, String btnId) {
		return adminDAO.approveClsTrainer(id, btnId);
	}

	@Override
	public List<GetClsCheckDTO> getClsList() {
		List<GetClsCheckDTO> list = adminDAO.getClsList();
		for (GetClsCheckDTO dto : list) {
			if(dto.getClsStatus().equals("CS00")) {
				dto.setClsStatus("승인대기중");
				System.out.println("너는 상태가 머냐?"+dto.getClsStatus());
			}else if(dto.getClsStatus().equals("CS01")){
				dto.setClsStatus("승인완료");
			}else if(dto.getClsStatus().equals("CS02")){
				dto.setClsStatus("승인거절");
			}
		}
		return list;
		}

	@Override
	public List<GetClsCheckDTO> allListCM(String key) {
		List<GetClsCheckDTO> list = adminDAO.allListCM(key);
		for (GetClsCheckDTO dto : list) {
			if(dto.getClsStatus().equals("CS00")) {
				dto.setClsStatus("승인대기중");
				System.out.println("너는 상태가 머냐?"+dto.getClsStatus());
			}else if(dto.getClsStatus().equals("CS01")){
				dto.setClsStatus("승인완료");
			}else if(dto.getClsStatus().equals("CS02")){
				dto.setClsStatus("승인거절");
			}
		}
		return list;
		}

	@Override
	public List<MonthPaymentChartDTO> monthPaymentChart() {
		return adminDAO.monthPaymentChart();
	}
	
	@Override
	public List<MonthPaymentChartDTO> lastMonthPaymentChart() {
		return adminDAO.lastMonthPaymentChart();
	}

	@Override
	public Map<String,String> inputData() {
		List<GetInputData> list = adminDAO.inputData();
		System.out.println("증가추이"+list.toString());
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("00","0"); map.put("01","0"); map.put("02","0"); map.put("03","0"); map.put("04","0"); map.put("05","0"); map.put("06","0"); map.put("07","0"); map.put("08","0"); map.put("09","0"); map.put("10","0"); map.put("11","0"); map.put("12","0"); map.put("13","0"); map.put("14","0"); map.put("15","0"); map.put("16","0"); map.put("17","0"); map.put("18","0"); map.put("19","0"); map.put("20","0"); map.put("21","0"); map.put("22","0"); map.put("23","0"); map.put("24","0"); map.put("25","0"); map.put("26","0"); map.put("27","0"); map.put("28","0"); map.put("29","0"); map.put("30","0"); map.put("31","0");
		for (GetInputData vo : list) {
			vo.setJoinDate(vo.getJoinDate().substring(8, 10)); 
		}
		for (GetInputData vo2 : list) {
			map.put(vo2.getJoinDate(),vo2.getCount());
		}
	
		
		return map;
	}
	
	@Override
	public Map<String,String> inputDataTwo() {
		List<GetInputData> list = adminDAO.inputDataTwo();
		System.out.println("증가추이 Two"+list.toString());
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("-00","0"); map.put("-01","0"); map.put("-02","0"); map.put("-03","0"); map.put("-04","0"); map.put("-05","0"); map.put("-06","0"); map.put("-07","0"); map.put("-08","0"); map.put("-09","0"); map.put("-10","0"); map.put("-11","0"); map.put("-12","0"); map.put("-13","0"); map.put("-14","0"); map.put("-15","0"); map.put("-16","0"); map.put("-17","0"); map.put("-18","0"); map.put("-19","0"); map.put("-20","0"); map.put("-21","0"); map.put("-22","0"); map.put("-23","0"); map.put("-24","0"); map.put("-25","0"); map.put("-26","0"); map.put("-27","0"); map.put("-28","0"); map.put("-29","0"); map.put("-30","0"); map.put("-31","0");
		for (GetInputData vo : list) {
			vo.setJoinDate(vo.getJoinDate().substring(7, 10)); 
		}
		for (GetInputData vo2 : list) {
			map.put(vo2.getJoinDate(),vo2.getCount());
		}
		return map;
	}

	@Override
	public List<GetSubChartDataDTO> getSubChartData(String btnParam) {		
		return adminDAO.getSubChartData(btnParam);
	}

	@Override
	public List<GetSubBBSDataDTO> getSubBBSData(String btnParam) {
		List<GetSubBBSDataDTO> list = adminDAO.getSubBBSData(btnParam);
			for (GetSubBBSDataDTO dto : list) {
				dto.setPayDate(dto.getPayDate().substring(0,10));
			}
				
		return list;
	}


}
