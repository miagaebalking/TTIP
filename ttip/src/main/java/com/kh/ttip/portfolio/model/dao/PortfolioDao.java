package com.kh.ttip.portfolio.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.portfolio.model.vo.Portfolio;
import com.kh.ttip.portfolio.model.vo.PortfolioImage;
import com.kh.ttip.profile.model.vo.Profile;

@Repository
public class PortfolioDao {

	public static int uploadImages(ArrayList<PortfolioImage> list, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("portfolioMapper.uploadImages",list);
		
	}

	public int insertPortfolio(Portfolio pf, SqlSessionTemplate sqlSession) {
		
		return sqlSession.insert("portfolioMapper.insertPortfolio",pf);
	}

//	public ArrayList<Portfolio> selectPortfolio(int userNo, SqlSessionTemplate sqlSession) {
//		
//		return (ArrayList)sqlSession.selectList("portfolioMapper.selectPortfolio",userNo);
//	}

	public ArrayList<PortfolioImage> selectPortfolioImageList(Portfolio pf, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("portfolioMapper.selectPortfolioImageList",pf);
	}

	public ArrayList<Portfolio> selectPortfolioList(String userNo, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("portfolioMapper.selectPortfolioList",userNo);
	}

	public DetailCategory selectDetailName(String portfolioCategory, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("portfolioMapper.selectDetailName",portfolioCategory);
	}

	public ArrayList<Profile> selectDetailCategoryList(int userNo, SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("portfolioMapper.selectDetailCategoryList",userNo);
	}

	public DetailCategory selectDetailCategoryNo(String detailName, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("portfolioMapper.selectDetailCategoryNo",detailName);
	}

	public Portfolio selectPortfolio(Portfolio pf, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("portfolioMapper.selectPortfolio",pf);
	}

	public DetailCategory selectDetailNo(String userNo, SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("portfolioMapper.selectDetailNo",userNo);
	}


	
	
	
	
	
}

