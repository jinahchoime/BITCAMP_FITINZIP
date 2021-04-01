package com.spring.FitInZip.back.cls.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data	
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class ClsVO {

	private String clsCode;
	private String trainerId;
	private String clsCategory;
	private String clsName;
	private String clsTag;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String yoil;
	private String startTime;
	private String endTime;
	private Integer lapse;
	private String clsLevel;
	private String equip;
	private Integer perPrice;
	private String clsInfo;
	private String curriculum;
	private String clsOriName;	
	private MultipartFile clsFileName;
	private String clsStatus;
	private Integer maxMem;
	private Integer calorie;
	private String meetUrl;
}
