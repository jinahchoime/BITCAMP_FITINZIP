package com.spring.FitInZip.back.admin;

import java.util.List;

import com.spring.FitInZip.back.admin.vo.GetMemberCheckDTO;
import com.spring.FitInZip.back.admin.vo.GetModalDTO;
import com.spring.FitInZip.back.admin.vo.MapVO;
import com.spring.FitInZip.back.member.vo.MemberVO;

public interface AdminService {
	/*상희*/
	List<GetMemberCheckDTO> getMemberCheck();
	List<GetModalDTO> getModalList(String id);
	Integer updateTrainer(String id);
	Integer rejectTrainer(String id);
	
	/*다슬*/
	void insertMap(MapVO vo);
	void updateMap(MapVO vo);
	List<MapVO> getMapList(MapVO vo);
}

