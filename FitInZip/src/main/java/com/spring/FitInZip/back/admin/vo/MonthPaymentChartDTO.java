package com.spring.FitInZip.back.admin.vo;



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
public class MonthPaymentChartDTO {
	private String clsCode;
	private String memId;
	private Integer originPrice;
	private Integer paidPrice; 
	private Integer commission;
	private Integer netPrice;	
	private String payDate;
	private String trainerId;
	private String commonName;	
}
	
