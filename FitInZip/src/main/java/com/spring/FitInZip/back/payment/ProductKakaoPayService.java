package com.spring.FitInZip.back.payment;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.spring.FitInZip.back.payment.vo.ProductKakaoPayApprovalVO;
import com.spring.FitInZip.back.payment.vo.ProductKakaoPayVO;

import lombok.extern.java.Log;

@Service
@Log
public class ProductKakaoPayService {
	
	private static final String HOST = "https://kapi.kakao.com";
	
	private ProductKakaoPayVO productKakaoPayVO;
	
	public String productKakaoPay() {
		
		RestTemplate restTemplate = new RestTemplate();
		
		//서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		//admin key : 142ff42eee3852cdeb26a23c0e8dc6f2
		headers.add("Authorization", "KakaoAK " + "142ff42eee3852cdeb26a23c0e8dc6f2");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		//서버로 요청할 body
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("cid", "TC0ONETIME");
		params.add("partner_order_id", "jinah");
		params.add("partner_user_id", "jinah");
		params.add("item_name", "테스트중");
		params.add("quantity", "1");
		params.add("total_amount", "2000");
		params.add("tax_free_amount", "2000");
		params.add("approve_url", "http://localhost:8090/mypage");
		params.add("cancel_url", "http://localhost:8090/productPay");
		params.add("fail_url", "http://localhost:8090/cart");
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		
		try {
			productKakaoPayVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, ProductKakaoPayVO.class);
			
			log.info("" + productKakaoPayVO);
			
			return productKakaoPayVO.getNext_redirect_pc_url();
			
		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		
		return "/productPay";  //뭘 리턴해야하는거지??
	}
	
	public ProductKakaoPayApprovalVO kakaoPayInfo(String pg_token ) {
		log.info("KakaoPayInfo................");
		log.info("--------------------");
		
		RestTemplate restTemplate = new RestTemplate();
		
		//서버로 요청할 Header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK " + "142ff42eee3852cdeb26a23c0e8dc6f2");
		headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
		headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
		
		
		return null;
		
	}
	
}












