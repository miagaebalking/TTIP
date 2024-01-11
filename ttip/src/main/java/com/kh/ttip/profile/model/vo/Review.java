package com.kh.ttip.profile.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class Review {
	private int reviewNo;
	private int writerNo;
	private String content;
	private Date regiDate;
	private int reviewStar;
	private String status;
	private int profileNo;
	private String changeName;
	private String userNickname;
}
