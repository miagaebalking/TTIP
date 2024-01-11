package com.kh.ttip.announcement.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class SubCategory {

	private String image;
	private String detailName;
	private int detailNo;
	private String categoryName;
}
