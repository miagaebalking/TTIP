package com.kh.ttip.portfolio.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.portfolio.model.dao.PortfolioDao;
import com.kh.ttip.portfolio.model.vo.Portfolio;
import com.kh.ttip.portfolio.model.vo.PortfolioImage;
import com.kh.ttip.profile.model.vo.Profile;


@Service
public class PortfolioServiceImpl implements PortfolioService{
	
	@Autowired
	private PortfolioDao portfolioDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int uploadImages(ArrayList<PortfolioImage> list) {
		
		return portfolioDao.uploadImages(list,sqlSession);
		
	}

	@Override
	public int insertPortfolio(Portfolio pf) {
		
		return portfolioDao.insertPortfolio(pf,sqlSession);
	}

//	@Override
//	public ArrayList<Portfolio> selectPortfolio(int userNo) {
//		
//		return portfolioDao.selectPortfolio(userNo,sqlSession);
//	}

	@Override
	public ArrayList<PortfolioImage> selectPortfolioImageList(Portfolio pf) {
		
		return portfolioDao.selectPortfolioImageList(pf,sqlSession);
	}

	@Override
	public ArrayList<Portfolio> selectPortfolioList(String userNo) {
		
		return portfolioDao.selectPortfolioList(userNo,sqlSession);
	}

	@Override
	public DetailCategory selectDetailName(String portfolioCategory) {
		
		return portfolioDao.selectDetailName(portfolioCategory,sqlSession);
	}

	@Override
	public ArrayList<Profile> selectDetailCategoryList(int userNo) {
		
		return portfolioDao.selectDetailCategoryList(userNo,sqlSession);
	}

	@Override
	public DetailCategory selectDetailCategoryNo(String detailName) {
		
		return portfolioDao.selectDetailCategoryNo(detailName,sqlSession);
	}

	@Override
	public Portfolio selectPortfolio(Portfolio pf) {
		
		return portfolioDao.selectPortfolio(pf, sqlSession);
	}

	@Override
	public DetailCategory selectDetailNo(String userNo) {
		
		return portfolioDao.selectDetailNo(userNo,sqlSession);
	}


	

	
	
	
}

