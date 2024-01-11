package com.kh.ttip.announcement.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Announcement {
	
	private String userNickname;
	private double reviewAverage;
	private int reviewCount;
	private String mainService;
	private String subService;
	private String address;
	private String oneLineIntroduce;
	private int profileNo;
	private String changeName;
}
