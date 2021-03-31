package com.spring.FitInZip.back.trainer;

import java.util.HashMap;
import java.util.List;

import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.trainer.vo.RegisterTrainerDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerCalDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerReviewDTO;


public interface TrainerService {
	//전체로그인
	MemberVO loginFirst(MemberVO vo);
	
	//로그인2
	RegisterTrainerDTO loginTrainer(RegisterTrainerDTO dto);
	
	//메인페이지
	String mainPage1(RegisterTrainerDTO dto);
	String mainPage2(RegisterTrainerDTO dto);
	String mainPage3(RegisterTrainerDTO dto);
	
	//마이페이지
	RegisterTrainerDTO myPage(RegisterTrainerDTO dto);
	
	//강사 등록하기
	public void insertTrainer(RegisterTrainerDTO dto);
	
	//아이디 중복체크
	public int idCheck(String id);

	//강사 정보 수정하기
	RegisterTrainerDTO trainerInfo(RegisterTrainerDTO dto);
	
	public void updateInfo1(RegisterTrainerDTO dto);
	public void updateInfo2(RegisterTrainerDTO dto);
	
	//내 리뷰 확인
	List<TrainerReviewDTO> checkReview(RegisterTrainerDTO dto);
	
	//정산 내역 확인
	List<TrainerCalDTO> checkCal(HashMap<String, String> map);
	
	
	
}
