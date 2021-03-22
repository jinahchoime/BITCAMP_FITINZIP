package com.spring.fitinzip.back.admin;

import com.spring.fitinzip.back.admin.vo.MapVO;
import com.spring.fitinzip.back.member.vo.MemberVO;

public interface AdminService {
	void insertMap(MapVO vo);
	void updateMap(MapVO vo);
	MapVO getMap(MapVO vo);
}
