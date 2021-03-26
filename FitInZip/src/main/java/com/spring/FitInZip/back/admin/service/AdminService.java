package com.spring.FitInZip.back.admin.service;

import java.util.List;

import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;

public interface AdminService {
	public List<GetMemberCheckDTO> getMemberCheck();
	public List<GetModalDTO> getModalList(String id);
}
