package com.spring.FitInZip.back.trainer.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.trainer.vo.RegisterTrainerDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerCalDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerReviewDTO;

@Repository
public class TrainerDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public TrainerDAO() {}

	public MemberVO loginFirst(MemberVO vo) {
		System.out.println("강사냐 관리자냐~");
		return mybatis.selectOne("trainer.login", vo);
		
	}
	
	public RegisterTrainerDTO loginTrainer(RegisterTrainerDTO dto) {
		System.out.println("TrainerDAO 넘어왔다~");

		RegisterTrainerDTO mdto = mybatis.selectOne("trainer.loginTrainer", dto);
		System.out.println("dto: " + mdto);
		return mdto;
	}
	
	public String mainpage1(RegisterTrainerDTO dto) {
		System.out.println("DAO 메인페이지~");
		//System.out.println("DTO dto: " + dto);
		String reqClass = mybatis.selectOne("trainer.TrainerMain1", dto);
		System.out.println("DAO reqClass: " + reqClass);
		return reqClass;
		
	}
	
	public String mainpage2(RegisterTrainerDTO dto) {
		System.out.println("DAO 메인페이지2~");
		//System.out.println("DTO dto: " + dto);
		String ingClass = mybatis.selectOne("trainer.TrainerMain2", dto);
		System.out.println("DAO ingClass: " + ingClass);
		return ingClass;
		
	}
	
	public String mainpage3(RegisterTrainerDTO dto) {
		System.out.println("DAO 메인페이지3~");
		//System.out.println("DTO dto: " + dto);
		String totalCal = mybatis.selectOne("trainer.TrainerMain3", dto);
		System.out.println("DAO totalCal: " + totalCal);
		return totalCal;
		
	}
	
	public void insertTrainer(RegisterTrainerDTO dto) {
		 System.out.println("강사 등록하기 폼 요청~"); 
		 System.out.println("dao dto: " + dto); 
		 int result = mybatis.insert("trainer.insertTrainer", dto);
		 System.out.println("등록결과: " + result);
	}
	
	public int checkId(String id) {
		int count = mybatis.selectOne("trainer.checkId", id);
		return count;
	}
	
	public RegisterTrainerDTO trainerInfo(RegisterTrainerDTO dto) {
		System.out.println("강사 정보 수정 정보~");
		return mybatis.selectOne("trainer.trainerInfo", dto);
	}
	
	public void updateInfo1(RegisterTrainerDTO dto) {
		System.out.println("강사 정보 수정1~");
		int result = mybatis.update("trainer.updateInfo1", dto);
		System.out.println("정보수정결과: " + result);
	}
	
	public void updateInfo2(RegisterTrainerDTO dto) {
		System.out.println("강사 정보 수정2~");
		int result = mybatis.update("trainer.updateInfo2", dto);
		System.out.println("정보수정결과2: " + result);
	}
	
	public List<TrainerReviewDTO> checkReview(RegisterTrainerDTO dto) {
		System.out.println("리뷰확인~~");
		List<TrainerReviewDTO> list = mybatis.selectList("trainer.checkReview", dto);
		System.out.println("DAO list: " + list);
		return list;
	}
	
	public List<TrainerCalDTO> checkCal(HashMap<String, String> map) {
		System.out.println("정산내역 확인~~");
		List<TrainerCalDTO> list = mybatis.selectList("trainer.checkCal", map);
		System.out.println("DAO 정산리스트: " + list);
		return list;
	}
	

}
