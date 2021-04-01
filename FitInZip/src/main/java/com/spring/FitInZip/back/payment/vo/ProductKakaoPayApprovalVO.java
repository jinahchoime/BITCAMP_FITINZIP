package com.spring.FitInZip.back.payment.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class ProductKakaoPayApprovalVO {
	
	private String aid, tid, cid, sid;
	private String partner_order_id, partner_user_id, payment_method_type;
	private ProductAmountVO productAmountVO;
	private ProductCardVO productCardVO;
	private String item_name, item_code, payload;
	private Integer quantity, tax_free_amount, vat_amount;
	private Date created_at, approved_at;
}
