package com.kh.ttip.portfolio.model.service;

import java.util.ArrayList;

import com.kh.ttip.announcement.model.vo.DetailCategory;
import com.kh.ttip.portfolio.model.vo.Portfolio;
import com.kh.ttip.portfolio.model.vo.PortfolioImage;
import com.kh.ttip.profile.model.vo.Profile;

public interface PortfolioService {

	int uploadImages(ArrayList<PortfolioImage> list);

	int insertPortfolio(Portfolio pf);

//	Portfolio selectPortfolio(int userNo);

	ArrayList<PortfolioImage> selectPortfolioImageList(Portfolio pf);

	ArrayList<Portfolio> selectPortfolioList(String userNo);

	DetailCategory selectDetailName(String portfolioCategory);

	ArrayList<Profile> selectDetailCategoryList(int userNo);

	DetailCategory selectDetailCategoryNo(String detailName);

	Portfolio selectPortfolio(Portfolio pf);

	DetailCategory selectDetailNo(String userNo);


}

