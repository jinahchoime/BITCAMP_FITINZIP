package com.spring.FitInZip.back.payment.vo;

import java.sql.Date;

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
public class ProductCardVO {

	private String purchase_corp, purchase_corp_code;
	private String issuer_corp, issuer_corp_code;
	private String bin, card_type, install_month, approved_id, card_mid;
	private String interest_free_install, card_item_code;
}
