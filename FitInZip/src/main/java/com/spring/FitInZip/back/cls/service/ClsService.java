package com.spring.FitInZip.back.cls.service;

import java.util.List;

import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.cls.dto.ClsListDTO;



public interface ClsService {
	
	List<ClsListDTO> getClassList(String clsCategory);
	ClsDetailDTO getClassDetail(String clsCode);
}
