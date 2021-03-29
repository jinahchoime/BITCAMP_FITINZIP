package com.spring.FitInZip.back.admin.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.admin.dao.AdminDao;
import com.spring.FitInZip.back.admin.service.AdminService;
import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDAO;
	
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
