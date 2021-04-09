package com.spring.FitInZip.back.cls.clsStatusService;

import java.util.List;
import java.util.Map;

import com.spring.FitInZip.back.cls.clsStatus.Criteria;
import com.spring.FitInZip.back.cls.vo.ClsVO;

public interface ClsStatusService {
	
	public List<ClsVO> getList(Criteria crt);
	public Integer getTotal(Map<String, String> map);
	public void register(ClsVO cls);
	public ClsVO getClass(ClsVO cls);
	public void updateClass(ClsVO cls);
	public void insertClass(ClsVO cls);
	public String getClassSeq();
	
}
