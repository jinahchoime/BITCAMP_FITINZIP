package com.spring.FitInZip.back.trainer.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.trainer.TrainerService;
import com.spring.FitInZip.back.trainer.vo.RegisterTrainerDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerCalDTO;
import com.spring.FitInZip.back.trainer.vo.TrainerReviewDTO;

@Service
public class TrainerServiceImpl implements TrainerService{

	@Autowired
	private TrainerDAO trainerDAO;
	
	public TrainerServiceImpl() {}

	@Override
	public RegisterTrainerDTO loginTrainer(RegisterTrainerDTO dto) {
		System.out.println("ServiceImpl loginTrainer 작동~");
		RegisterTrainerDTO loginDto = trainerDAO.loginTrainer(dto);

		System.out.println("Impl vo: " + loginDto);
		return loginDto;
	}

	@Override
	public String mainPage1(RegisterTrainerDTO dto) {
		String reqClass = trainerDAO.mainpage1(dto);
		return reqClass;
	}

	@Override
	public String mainPage2(RegisterTrainerDTO dto) {
		String ingClass = trainerDAO.mainpage2(dto);
		return ingClass;
	}

	@Override
	public String mainPage3(RegisterTrainerDTO dto) {
		String totalCal = trainerDAO.mainpage3(dto);
		return totalCal;
	}

	@Override
	public RegisterTrainerDTO myPage(RegisterTrainerDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertTrainer(RegisterTrainerDTO dto) {
		trainerDAO.insertTrainer(dto);
		
	}

	@Override
	public RegisterTrainerDTO trainerInfo(RegisterTrainerDTO dto) {
		return trainerDAO.trainerInfo(dto);
	}

	@Override
	public void updateInfo1(RegisterTrainerDTO dto) {
		trainerDAO.updateInfo1(dto);
		
	}

	@Override
	public void updateInfo2(RegisterTrainerDTO dto) {
		trainerDAO.updateInfo2(dto);
		
	}

	@Override
	public int idCheck(String id) {
		int count = trainerDAO.checkId(id);
		return count;
	}

	@Override
	public List<TrainerReviewDTO> checkReview(RegisterTrainerDTO dto) {
		return trainerDAO.checkReview(dto);
	}

	@Override
	public MemberVO loginFirst(MemberVO vo) {
		return trainerDAO.loginFirst(vo);
	}

	@Override
	public List<TrainerCalDTO> checkCal(HashMap<String, String> map) {
		return trainerDAO.checkCal(map);
	}

	@Override
	public void updateCal(RegisterTrainerDTO dto) {
		trainerDAO.updateCal(dto);
		
	}

	
	
	
}
