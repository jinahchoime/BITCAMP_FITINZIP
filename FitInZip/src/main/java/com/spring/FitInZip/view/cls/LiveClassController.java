package com.spring.FitInZip.view.cls;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.cls.dto.ClsListDTO;
import com.spring.FitInZip.back.cls.service.ClsService;

@Controller
public class LiveClassController {
	
	@Autowired
	private ClsService clsService;
	
	// 원데이PT 클래스 화면
	@RequestMapping(value="/liveClassMain", method=RequestMethod.GET)
	public String liveClassMain(String clsCategory, Model model) {
		List<ClsListDTO> classList = clsService.getClassList(clsCategory);
		model.addAttribute("classList", classList);
		
		return "class/liveClass";
	}
	
	// 카테고리 별로 필터링한고
	@RequestMapping(value="/liveClassMain", method=RequestMethod.POST)
	public String getClassCategory(String clsCategory, Model model) {
		List<ClsListDTO> classList = clsService.getClassList(clsCategory);
		model.addAttribute("classList", classList);
		
		return "class/liveClassContent";
	}
	
	// 클래스 상세글
	@RequestMapping("/getClassDetail")
	public String getClassDetail(HttpServletRequest request, Model model) {
		String clsCode = request.getParameter("clsCode");
		ClsDetailDTO classDetail = clsService.getClassDetail(clsCode);
		
		model.addAttribute("detail", classDetail);
		
		return "class/classDetail";
	}
	
}
