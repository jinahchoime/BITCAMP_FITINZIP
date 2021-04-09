package com.spring.FitInZip.back.cls.dto;

import java.util.Date;
import java.util.List;

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
public class ClsTrainerDTO {
	private String clsCode;
	private String clsCategory;
	private String clsName;
	private String yoil;
	private String startDate;
	private String endDate;
	
	private Date startTime;
	private Date endTime;
	private String meetUrl;
	
	
	private String thumbnailFileName;	
	
	private List<String> list;
	
	
}
