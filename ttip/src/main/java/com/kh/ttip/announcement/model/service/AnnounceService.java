package com.kh.ttip.announcement.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.ttip.announcement.model.vo.Announcement;
import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.announcement.model.vo.MainCategory;
import com.kh.ttip.announcement.model.vo.SubCategory;

public interface AnnounceService {
	

	//상세 카테고리 조회(이미지 조회를 위한)
	ArrayList<SubCategory> selectSubCategory(int categoryNo);

	ArrayList<MainCategory> selectMainCategory();

	ArrayList<DetailCategory> selectDetailCategory(int[] arrayParams);

	ArrayList<Announcement> selectAnnounceList(int detailNo);
}
