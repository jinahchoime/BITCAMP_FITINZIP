package com.spring.FitInZip.back.admin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.admin.dao.AdminDAO;
import com.spring.FitInZip.back.admin.service.AdminService;
import com.spring.FitInZip.back.admin.vo.GetClsCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetClsModalDTO;
import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;
import com.spring.FitInZip.back.admin.vo.MapVO;
import com.spring.FitInZip.back.cls.vo.ClsVO;

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




}
