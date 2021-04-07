package com.spring.FitInZip.view.cls;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.FitInZip.back.cls.dto.ClsDetailDTO;
import com.spring.FitInZip.back.cls.dto.ClsListDTO;
import com.spring.FitInZip.back.cls.service.ClsService;
import com.spring.FitInZip.back.cls.vo.PagingVO;
import com.spring.FitInZip.back.member.vo.MemberVO;
import com.spring.FitInZip.back.review.dto.ReviewDTO;
import com.spring.FitInZip.back.review.service.ReviewService;

@Controller
public class LiveClassController {
	
	@Autowired
	private ClsService clsService;
	
	@Autowired
	private ReviewService reviewService;
	
	// 원데이PT 클래스 화면
	@RequestMapping(value="/liveClassMain", method=RequestMethod.GET)
	public String liveClassMain(String clsCategory, Model model) {
		List<ClsListDTO> classList = clsService.getClassList(clsCategory);
		model.addAttribute("classList", classList);
		
		List<ClsListDTO> ingList = clsService.getIngList(clsCategory);
		model.addAttribute("ingList", ingList);
		
		return "class/liveClass";
	}
	
	// 카테고리 별로 필터링한고
	@RequestMapping(value="/liveClassMain", method=RequestMethod.POST)
	public String getClassCategory(String clsCategory, Model model) {
		List<ClsListDTO> classList = clsService.getClassList(clsCategory);
		model.addAttribute("classList", classList);
		
		List<ClsListDTO> ingList = clsService.getIngList(clsCategory);
		model.addAttribute("ingList", ingList);
		
		return "class/liveClassContent";
	}
	
	// 클래스 상세글
	@RequestMapping("/getClassDetail")
	public String getClassDetail(HttpServletRequest request, Model model, HttpSession session, PagingVO vo
								, @RequestParam(value="nowPage", required=false)String nowPage
								, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		String clsCode = request.getParameter("clsCode");
		// 우선 클레스 상세글 가져오고
		ClsDetailDTO classDetail = clsService.getClassDetail(clsCode);
		model.addAttribute("detail", classDetail);
		session.setAttribute("detail", classDetail);
		// 우선 유저 정보 가져와야함
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		// 위시클래스 눌렀는지 아닌지 판별 하고 --------------------------
		int isWish = 0;
		
		if (member != null) {
			// 좋아요 눌렀는지 아닌지도 가져와야해 로그인 했다면
			Map<String, String> isWishMap = new HashMap<>();
			isWishMap.put("clsCode", clsCode);
			isWishMap.put("memId", member.getId());
			
			isWish = clsService.isWish(isWishMap);
		}
		model.addAttribute("isWish", isWish);
		
		// --------------------------------------------------
		
		// 댓글 페이징처리 후 가져오기---------------------------------
		int total = reviewService.countReview(clsCode);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "3";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "3";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("start", vo.getStart());
		map.put("end", vo.getEnd());
		map.put("clsCode", clsCode);
		
		model.addAttribute("review", reviewService.getReview(map));
		
		// 댓글 가져올거임
		/*
		 * List<ReviewDTO> review = reviewService.getReview(map);
		 * model.addAttribute("review", review);
		 */
		
		// 댓글쓰기 때문에 아이디도 필요
		
		return "class/classDetail";
	}
	
	
	
	// 댓글 페이징 할때..?
	
	
	
	
	
	// 댓글쓰기
	@RequestMapping("/insertReview")
	@ResponseBody
	public String insertReview(ReviewDTO dto) {
		
		System.out.println("dto : " + dto);
		
		reviewService.insertReview(dto);
		
		return "true";
	}
	
	// 좋아요 하트 눌렀을 때!!
	@RequestMapping("/clickWish")
    @ResponseBody
	public int clickWish(@RequestParam Map<String, String> map) {
        int isWish = 0;
        int resultWish = 0;
        System.out.println("map : " + map);
        // 좋아유가 눌러져있는지 아닌지

        isWish = clsService.isWish(map);
        
        System.out.println("컨트롤러에서 isWish : " + isWish);
       
        if(isWish == 0) {
        	// 좋아요가 안눌린 상태이기 때문에
        	System.out.println("결과값 0");
        	clsService.insertWish(map); 
        	resultWish = 1; // 좋아유 눌림
        } else {
        	System.out.println("결과값 1");
        	clsService.deleteWish(map);
        }
        
        System.out.println("resultWish : " + resultWish);
        
        return resultWish;
	}
}
