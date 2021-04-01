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
public class GetClsModalDTO {
	private String clsCode;
	private String trainerId;
	private String commonName;
	private String clsName;
	private String startDate;
	private String endDate;
	private String startTime;
	private String endTime;
	private String lapse;
	private String clsLevel;
	private Integer perPrice;
	private String clsInfo;
	private String curriculum;
	private Integer maxMem;
	private Integer calorie;
	private String name;
	private String sumDate;
	private String sumTime;
	private String yoil;
}
