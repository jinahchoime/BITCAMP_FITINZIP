package com.spring.FitInZip.back.admin.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.admin.AdminService;
import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;
import com.spring.FitInZip.back.admin.vo.MapVO;

@Service
public class AdminServiceImpl implements AdminService{
	
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
	
	/*상희*/
	@Override
	public List<GetMemberCheckDTO> getMemberCheck() {
		
		return adminDAO.getMemberCheck();
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
}

