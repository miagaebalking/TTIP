package com.kh.ttip.announcement.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ttip.announcement.model.dao.AnnounceDao;
import com.kh.ttip.announcement.model.vo.Announcement;
import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.announcement.model.vo.MainCategory;
import com.kh.ttip.announcement.model.vo.SubCategory;

@Service
public class AnnounceServiceImpl implements AnnounceService{

	@Autowired
	private AnnounceDao announceDao;
	
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public ArrayList<MainCategory> selectMainCategory() {
		return announceDao.selectMainCategory(sqlSession);
	}

	@Override
	public ArrayList<DetailCategory> selectDetailCategory(int[] arrayParams) {
		return announceDao.selectDetailCategory(arrayParams,sqlSession);
	}

	@Override
	public ArrayList<SubCategory> selectSubCategory(int categoryNo) {
		return announceDao.selectSubCategory(categoryNo,sqlSession);
	}

	@Override
	public ArrayList<Announcement> selectAnnounceList(int detailNo) {
		return announceDao.selectAnnounceList(detailNo,sqlSession);
	}

	

}
