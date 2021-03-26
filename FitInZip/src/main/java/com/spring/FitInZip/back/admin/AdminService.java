package com.spring.FitInZip.back.admin;

import java.util.List;

import com.spring.FitInZip.back.admin.vo.MapVO;
import com.spring.FitInZip.back.member.vo.MemberVO;

public interface AdminService {
	void insertMap(MapVO vo);
	void updateMap(MapVO vo);
	List<MapVO> getMapList(MapVO vo);
}

